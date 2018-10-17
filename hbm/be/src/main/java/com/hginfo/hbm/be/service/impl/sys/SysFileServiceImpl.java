/*
 * Project Name:hbm-be.
 * File Name:SysFileServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年11月29日 下午3:43:44
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysAttachment;
import com.hginfo.hbm.base.entity.sys.SysFile;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysFileService;
import com.hginfo.hbm.be.dao.sys.SysFileDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.DateTimeUtil;
import com.hginfo.hutils.StringUtil;
import com.hginfo.hutils.bizobject.HgMultipartFile;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Properties;

/**
* 系统文件表: sys_file. <br />
* service impl 层 <br />
* Date: 2016年11月29日 下午3:43:44 <br />
*
* @author qiujingde
* @since V1.0.0
*/
@HService
public class SysFileServiceImpl extends BizService<SysFile, SysFileDao>implements SysFileService {
    
    /**
     * 附件Service。
     */
    private SysAttachmentServiceImpl attachmentService;
    
    
    @Override
    public Page<SysFile> getFileList(BasePage<SysFile> pageInfo, SysFile filter) {
        filter.setIsDelete(0);
        return this.getPageList(pageInfo, filter);
    }
    
    /**.
     * webUploader上传提交
     */
    @Override
    public SysFile createUploadFile(List<HgMultipartFile> multipartList) {
        boolean success;
        String message;
        HgMultipartFile multipartFile = multipartList.get(0);
        String originalFilename = multipartFile.getOriginalFilename();
        String ext = StringUtil.substringAfterLast(originalFilename, ".");
        
        String newName = DateTimeUtil.getDateTimeStr(new Date(), "yyyyMMddHHmmss");
        String newFileName = newName + "." + ext;
        
        // 保存文件
        SysFile addFile = new SysFile();
        try {
            Properties pro = new Properties();
            pro.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("env.properties"));
            String filePath = pro.getProperty("file.uploadPath") + "/" + newFileName;
            
            File newFile = new File(filePath);
            //将文件写入到指定文件内
            FileUtils.copyInputStreamToFile(multipartFile.getInputStream(), newFile);
            success = true;
            message = "上传成功";
            //文件表
            addFile.setRealName(originalFilename);
            addFile.setFileName(originalFilename);
            addFile.setFileType(ext);
            addFile.setFileSize(multipartFile.getSize() + "");
            addFile.setRelativePath(filePath);
            addFile.setIsDelete(0);
            
            this.add(addFile);
            //附件表
            SysAttachment attachment = new SysAttachment();
            attachment.setAttName(originalFilename);
            attachment.setAttCode(addFile.getFileId().toString());
            attachment.setFileId(addFile.getFileId());
            attachment.setBizCode("");
            attachment.setBizId(null);
            attachment.setSubBizId(null);
            attachmentService.add(attachment);
            addFile.setAttId(attachment.getAttId());
        } catch (Exception e) {
            e.printStackTrace();
            message = "文件上传失败";
            success = false;
        }
        
        addFile.setSuccess(success);
        addFile.setMessage(message);
        addFile.setDescr("成功");
        return addFile;
    }
    
    @Override
    public SysFile getById(long fileId) {
        return get(fileId);
    }
    
    /**.
     * 删除文件附件信息
     */
    @Override
    public void deleteSysAttachFile(long fileId, long attId) {
        //修改文件信息
        this.delete(fileId);
        //修改附件信息
        attachmentService.delete(attId);
    }
    
    @Override
    public void updateFileAndAttachment(SysFile file, SysAttachment attachment) {
       this.updateSysFile(file);
       this.updateSysAttachFile(attachment);
    }
    
    /**.
     * 修改文件信息
     */
    @Override
    public SysFile updateSysFile(SysFile file) {
        super.update(file);
        return file;
    }
    
    /***.
     * 修改附件信息
     */
    @Override
    public void updateSysAttachFile(SysAttachment attach) {
        attachmentService.update(attach);
    }

    @SuppressWarnings("SpringJavaAutowiredMembersInspection")
    @Autowired
    public void setAttachmentService(SysAttachmentServiceImpl attachmentService) {
        this.attachmentService = attachmentService;
    }
}
