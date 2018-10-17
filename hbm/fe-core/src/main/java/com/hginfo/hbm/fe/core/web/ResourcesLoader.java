/**
 * Project Name:hbm-fe-core
 * File Name:ResourcesLoader.java
 * Package Name:com.hginfo.hbm.fe.core.web
 * Date:2017年3月14日下午5:10:12
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.fe.core.web;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.FileSystems;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.StandardWatchEventKinds;
import java.nio.file.WatchEvent;
import java.nio.file.WatchKey;
import java.nio.file.WatchService;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hginfo.hutils.FileUtil;
import com.hginfo.hutils.PathUtil;

/**
 * 公共资源文件加载器。
 * 供框架开发人员使用
 * ClassName:ResourcesLoader <br/>
 * Date: 2017年3月14日 下午5:10:12 <br/>
 * @author licheng
 * @since V1.0.0
 */
public class ResourcesLoader {
    
    /**
     * 
     * Creates a new instance of ResourcesLoader.
     *
     */
    ResourcesLoader() {
        String osName = System.getProperty("os.name").toLowerCase();
        LoaderThread thread = new LoaderThread(osName.indexOf("windows") >= 0);
        thread.start();
    }
    
    /**
     * 资源加载子线程。
     * ClassName: LoaderThread <br/>
     * date: 2017年3月14日 下午5:26:19 <br/>
     * @author licheng
     * @version ResourcesLoader
     * @since V1.0.0
     */
    public class LoaderThread extends Thread {
        
        /**
         * 是否是调试模式。
         */
        private boolean                   isDebugMode;
        
        /**
         * 
         */
        private String                    staticRelPath = "/static/";
        
        /**
         * 
         */
        private String                    staticAbsPath;
        
        /**
         * 
         */
        private WatchService              watchService;
        
        /**
         * 
         */
        private final Map<WatchKey, Path> directories   = new HashMap<>();
        
        /**
         * Creates a new instance of LoaderThread.
         * @param isDebugMode isDebugMode
         */
        public LoaderThread(boolean isDebugMode) {
            this.isDebugMode = isDebugMode;
        }
        
        /**
         * run.
         * 调试模式下启用监控。
         * 如果空目录则退出
         * @see java.lang.Thread#run()
         */
        public void run() {
            String path = this.getClass().getResource(staticRelPath).getFile();
            File staticFile = new File(path);
            staticAbsPath = staticFile.getAbsolutePath() + "\\";
            URL uri = Thread.currentThread().getContextClassLoader().getResource("");
            if (staticFile.exists()) {
                syncFiles(staticAbsPath);
                if (!isDebugMode) {
                    return;
                }
                try {
                    registWatch(staticFile.getAbsolutePath());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        
        /**
         * 注册文件监听服务。
         * @author licheng
         * @param staticFullPath 监听路径
         * @throws Exception exception
         * @since V1.0.0
         */
        @SuppressWarnings("unchecked")
        private void registWatch(String staticFullPath) throws Exception {
            watchService = FileSystems.getDefault().newWatchService();
            registerTree(Paths.get(staticFullPath));
            while (true) {
                //阻塞方式，消费文件更改事件  
                WatchKey key = watchService.take();
                List<WatchEvent<?>> watchEvents = key.pollEvents();
                for (WatchEvent<?> watchEvent : watchEvents) {
                    final WatchEvent<Path> watchEventPath = (WatchEvent<Path>) watchEvent;
                    final Path filename = watchEventPath.context();
                    //handle OVERFLOW event   
                    if (watchEvent.kind() == StandardWatchEventKinds.OVERFLOW) {
                        continue;
                    }
                    //handle CREATE event
                    final Path directoryPath = directories.get(key);
                    final Path child = directoryPath.resolve(filename);
                    if (watchEvent.kind() == StandardWatchEventKinds.ENTRY_CREATE) {
                        if (Files.isDirectory(child, LinkOption.NOFOLLOW_LINKS)) {
                            registerTree(child);
                        }
                    }
                    syncResources(child, watchEvent);
                }
                //reset the key   
                boolean valid = key.reset();
                //remove the key if it is not valid   
                if (!valid) {
                    directories.remove(key);
                    //there are no more keys registered   
                    if (directories.isEmpty()) {
                        break;
                    }
                }
            }
        }
        
        /**
         * 注册监听目录树。
         * @author licheng
         * @param basePath 基础目录
         * @throws IOException 异常
         * @since V1.0.0
         */
        private void registerTree(Path basePath) throws IOException {
            Files.walkFileTree(basePath, new SimpleFileVisitor<Path>() {
                @Override
                public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs)
                    throws IOException {
                    WatchKey key = dir.register(watchService, StandardWatchEventKinds.ENTRY_CREATE,
                        StandardWatchEventKinds.ENTRY_MODIFY, StandardWatchEventKinds.ENTRY_DELETE);
                    //store the key and path   
                    directories.put(key, dir);
                    return FileVisitResult.CONTINUE;
                }
            });
        }
        
        /**
         * 同步资源。
         * @author licheng
         * @param path path
         * @param watchEvent watchEvent
         * @since V1.0.0
         */
        private void syncResources(Path path, WatchEvent<?> watchEvent) {
            if (watchEvent.kind() == StandardWatchEventKinds.ENTRY_CREATE) {
                syncFiles(path.toString());
            } else if (watchEvent.kind() == StandardWatchEventKinds.ENTRY_MODIFY) {
                if (!Files.isDirectory(path, LinkOption.NOFOLLOW_LINKS)) {
                    syncFiles(path.toString());
                }
            } else if (watchEvent.kind() == StandardWatchEventKinds.ENTRY_DELETE) {
                syncFiles(path.toString());
            }
        }
        
        /**
         * 同步资源文件，更新或删除。
         * @author licheng
         * @param sourcePath 路径
         * @since V1.0.0
         */
        private void syncFiles(String sourcePath) {
            String relPath = sourcePath.substring(staticAbsPath.length());
            String destPath = PathUtil.getWebAppPath() + "static/" + relPath;
            File file = new File(sourcePath);
            if (file.exists()) {
                if (file.isDirectory()) {
                    FileUtil.copyFolder(sourcePath, destPath);
                } else if (file.isFile()) {
                    FileUtil.copyFile(sourcePath, destPath);
                }
            } else {
                File destFile = new File(destPath);
                if (destFile.isDirectory()) {
                    FileUtil.delFolder(destPath);
                } else {
                    FileUtil.delFile(destPath);
                }
            }
        }
        
    }
}
