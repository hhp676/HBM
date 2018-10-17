package com.hginfo.hbm.fe.core.ueditor;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.io.FileUtils;

import com.baidu.ueditor.define.BaseState;
import com.baidu.ueditor.define.State;
import com.hginfo.hutils.FtpUtil;

/**
 * Reason: 添加对ftp上传的支持<br/>.
 * date: 2017年1月23日 上午10:42:45 <br/>
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
public class StorageManager {
    /**
     * 
     */
    public static final int BUFFER_SIZE = 8192;
    
    /**
     * 
     * @author yinyanzhen
     * @param data data
     * @param path path
     * @return State
     * @since V1.0.0
     */
    public static State saveBinaryFile(byte[] data, String path) {
        File file = new File(path);
        
        State state = valid(file);
        
        if (!state.isSuccess()) {
            return state;
        }
        try {
            BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file));
            bos.write(data);
            bos.flush();
            bos.close();
        } catch (IOException ioe) {
            return new BaseState(false, 4);
        }
        
        state = new BaseState(true, file.getAbsolutePath());
        state.putInfo("size", data.length);
        state.putInfo("title", file.getName());
        return state;
    }
    
    /**
     * 
     * @author yinyanzhen
     * @param is is
     * @param path path
     * @param maxSize maxSize
     * @return State
     * @since V1.0.0
     */
    public static State saveFileByInputStream(InputStream is, String path, long maxSize) {
        State state = null;
        
        File tmpFile = getTmpFile();
        
        byte[] dataBuf = new byte[2048];
        BufferedInputStream bis = new BufferedInputStream(is, 8192);
        try {
            BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(tmpFile),
                8192);
            
            int count = 0;
            while ((count = bis.read(dataBuf)) != -1) {
                bos.write(dataBuf, 0, count);
            }
            bos.flush();
            bos.close();
            
            if (tmpFile.length() > maxSize) {
                tmpFile.delete();
                return new BaseState(false, 1);
            }
            
            state = saveTmpFile(tmpFile, path);
            
            if (!state.isSuccess()) {
                tmpFile.delete();
            }
            
            return state;
        } catch (IOException localIOException) {
        }
        return new BaseState(false, 4);
    }
    
    /**
     * 
     * @author yinyanzhen
     * @param is is
     * @param path path
     * @return State
     * @since V1.0.0
     */
    public static State saveFileByInputStream(InputStream is, String path) {
        State state = null;
        
        File tmpFile = getTmpFile();
        
        byte[] dataBuf = new byte[2048];
        BufferedInputStream bis = new BufferedInputStream(is, 8192);
        try {
            BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(tmpFile),
                8192);
            
            int count = 0;
            while ((count = bis.read(dataBuf)) != -1) {
                bos.write(dataBuf, 0, count);
            }
            bos.flush();
            bos.close();
            
            state = saveTmpFile(tmpFile, path);
            
            if (!state.isSuccess()) {
                tmpFile.delete();
            }
            
            return state;
        } catch (IOException localIOException) {
        }
        return new BaseState(false, 4);
    }
    
    /**
     * 
     * @author yinyanzhen
     * @return File
     * @since V1.0.0
     */
    private static File getTmpFile() {
        File tmpDir = FileUtils.getTempDirectory();
        double d = Math.random() * 10000.0D;
        String tmpFileName = String.valueOf(d).replace(".", "");
        return new File(tmpDir, tmpFileName);
    }
    
    /**
     * 
     * @author yinyanzhen
     * @param tmpFile tmpFile
     * @param path path
     * @return State
     * @since V1.0.0
     */
    private static State saveTmpFile(File tmpFile, String path) {
        State state = null;
        File targetFile = new File(path);
        
        if (targetFile.canWrite()) {
            return new BaseState(false, 2);
            
        }
        try {
            FileUtils.moveFile(tmpFile, targetFile);
        } catch (IOException e) {
            return new BaseState(false, 4);
        }
        
        state = new BaseState(true);
        state.putInfo("size", targetFile.length());
        state.putInfo("title", targetFile.getName());
        
        return state;
    }
    
    /**
     * 
     * @author yinyanzhen
     * @param file file
     * @return State
     * @since V1.0.0
     */
    private static State valid(File file) {
        File parentPath = file.getParentFile();
        
        if ((!parentPath.exists()) && (!parentPath.mkdirs())) {
            return new BaseState(false, 3);
        }
        
        if (!parentPath.canWrite()) {
            return new BaseState(false, 2);
        }
        
        return new BaseState(true);
    }
    
    /**
     * 上传FTP文件.
     * 
     * @author yinyanzhen
     * @param is is
     * @param remoteDir remoteDir
     * @param path path
     * @param maxSize maxSize
     * @param keepLocalFile keepLocalFile
     * @return State
     * @since V1.0.0
     */
    public static State saveFtpFileByInputStream(InputStream is, String remoteDir, String path,
        long maxSize, boolean keepLocalFile) {
        State state = null;
        
        File tmpFile = getTmpFile();
        
        byte[] dataBuf = new byte[2048];
        BufferedInputStream bis = new BufferedInputStream(is, 8192);
        try {
            BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(tmpFile),
                8192);
            
            int count = 0;
            while ((count = bis.read(dataBuf)) != -1) {
                bos.write(dataBuf, 0, count);
            }
            bos.flush();
            bos.close();
            
            if (tmpFile.length() > maxSize) {
                tmpFile.delete();
                return new BaseState(false, 1);
            }
            
            state = saveFtpTmpFile(tmpFile, remoteDir, path, keepLocalFile);
            
            if (!state.isSuccess()) {
                tmpFile.delete();
            }
            
            return state;
        } catch (IOException localIOException) {
        }
        return new BaseState(false, 4);
    }
    
    /**
     * ueditor文件上传到ftp服务器.
     * @author yinyanzhen
     * @param tmpFile tmpFile
     * @param remoteDir remoteDir
     * @param path path
     * @param keepLocalFile keepLocalFile
     * @return State
     * @since V1.0.0
     */
    private static State saveFtpTmpFile(File tmpFile, String remoteDir, String path,
        boolean keepLocalFile) {
        State state = null;
        File targetFile = new File(path);
        
        if (targetFile.canWrite()) {
            return new BaseState(false, 2);
            
        }
        try {
            FileUtils.moveFile(tmpFile, targetFile);
        } catch (IOException e) {
            return new BaseState(false, 4);
        }
        
        try {
            //读取配置文件参数
            Properties pro = new Properties();
            pro.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("env.properties"));
            FtpUtil ftputil = new FtpUtil(
                pro.getProperty("ftp.hostname"), 
                Integer.parseInt(pro.getProperty("ftp.port")), 
                pro.getProperty("ftp.username"),
                pro.getProperty("ftp.password"), null);
            //开始ftp操作
            ftputil.login();
            boolean flag = ftputil.upload(path, remoteDir);
            ftputil.closeServer();
            if (!flag) {
                return new BaseState(false, 4);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new BaseState(false, 4);
        }
        
        try {
            if (!keepLocalFile) {
                targetFile.delete();
            }
        } catch (Exception e) {
            
        }
        
        state = new BaseState(true);
        state.putInfo("size", targetFile.length());
        state.putInfo("title", targetFile.getName());
        
        return state;
    }
}
