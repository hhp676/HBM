package com.hginfo.hbm.be.service.impl.demo;

import com.hginfo.hbm.base.service.demo.FileDemoService;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.bizobject.HgMultipartFile;

import java.util.List;
import java.util.Map;

/**
 * 文件上传service.
 * ClassName: FileDemoServiceImpl <br/>
 * date: 2017年2月10日 下午4:10:59 <br/>
 *
 * @author yinyanzhen
 * @since V1.0.0
 */
@HService
public class FileDemoServiceImpl implements FileDemoService {
    
    /**
     * saveSingleFileUpload:(单文件上传保存). <br/>
     */
    @Override
    public void saveSingleFileUpload(Map<String, String> vo, List<HgMultipartFile> multipartList) {
        //TODO 先进行业务数据处理,完成后获取业务数据对应bizID值
        Long bizID = null;
        
        //TODO 附件保存
        for (HgMultipartFile file : multipartList) {
            saveFileInput(file, bizID);
        }
    }
    
    /**
     * saveFilesUpload:(多文件上传保存). <br/>
     */
    @Override
    public void saveFilesUpload(Map<String, String> vo, List<HgMultipartFile> multipartList) {
        //TODO 先进行业务数据处理,完成后获取业务数据对应bizID值
        Long bizID = null;
        
        //TODO 附件保存
        for (HgMultipartFile file : multipartList) {
            saveFileInput(file, bizID);
        }
    }
    
    /**
     * 带有对应关系的多附件保存.
     */
    @Override
    public void saveRelationFileUpload(Map<String, String> vo, List<HgMultipartFile> multipartList) {
        //TODO 先进行业务数据处理,完成后获取业务数据对应bizID值
        Long bizID = null;
        
        for (HgMultipartFile file : multipartList) {
            //根据前台的name命名规则,成对取出子业务数据与附件信息
            //TODO 子业务信息数据请根据业务场景,自行处理
            String modelId = "modelID" + file.getKey().substring(4);
            //获取附件对应的参数信息
            String modelInfo = vo.get(modelId);
            System.out.print(modelInfo + "对应文件信息>>");
            //请根据业务需要,选择是否提交子业务id
            saveFileInput(file, bizID);
        }
    }
    
    /**
     * saveFileInput:(附件保存动作). <br/>
     *
     * @author yinyanzhen
     * @param file file
     * @param bizID bizID
     * @since V1.0.0
     */
    private void saveFileInput(HgMultipartFile file, Long bizID) {
        //附件原名
        System.out.println(file.getOriginalFilename());
        //附件大小
        System.out.println(file.getSize());
        
        //为保证文件名称不重复,需要重写创建文件名
        //String filePath = "系统定义的文件存储路径/"+UUID.randomUUID().toString()+".附件原名截取文件名称后缀";
        
        //TODO 保存系统附件表信息 先关字段包括bizID,附件原名,附件大小,文件保存路径等信息
        
        //TODO 请根据业务需要,自行选择文件保存方式,以及文件保存地址
        //demo将文件存放到文件路径下
        //FileUtils.copyInputStreamToFile(file.getInputStream(), new File(filePath));
        
        //demo 将文件存放到ftp服务器上
        /*Properties pro = new Properties();
        pro.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("env.properties"));
        FtpUtil ftputil = new FtpUtil(
            pro.getProperty("ftp.hostname"), 
            Integer.parseInt(pro.getProperty("ftp.port")), 
            pro.getProperty("ftp.username"),
            pro.getProperty("ftp.password"), null);
        //开始ftp操作
        ftputil.login();
        boolean flag = ftputil.upload(file.getInputStream(), filePath);
        ftputil.closeServer();
        if(!flag){
            throw new Exception("附件保存失败");
        }*/
    }
}
