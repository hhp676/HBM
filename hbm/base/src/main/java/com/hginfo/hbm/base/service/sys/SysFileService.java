/*
 * Project Name:hbm-base.
 * File Name:SysFileService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年11月29日 下午3:26:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysAttachment;
import com.hginfo.hbm.base.entity.sys.SysFile;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hutils.bizobject.HgMultipartFile;

import java.util.List;

/**
* 系统文件表: sys_file. <br />
* service interface 层 <br />
* Date: 2016年12月19日   <br />
*
* @author mahonghua
* @since V1.0.0
*/
public interface SysFileService {

    /**
     * 获取分页数据.
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @return 分页数据
     */
    Page<SysFile> getFileList(BasePage<SysFile> pageInfo, SysFile filter);

    /**
     * webUploader 上传.
     * @param multipartList 可序列化的文件请求list
     * @return 文件信息
     */
    SysFile createUploadFile(List<HgMultipartFile> multipartList);

    /**.
     * 根据fileId获取文件信息
     * @param fileId 文件信息ID
     * @return 返回文件信息
     */
    SysFile getById(long fileId);

    /**.
     * 物理删除文件附件信息
     * @param fileId 文件信息ID
     * @param attId 附件信息ID
     */
    void deleteSysAttachFile(long fileId, long attId);
    
    /**
     * updateFileAndAttachment:(更新附件信息). <br/>
     * @author yinyanzhen
     * @param file file
     * @param attachment attachment
     * @since V1.0.0
     */
    void updateFileAndAttachment(SysFile file, SysAttachment attachment);

    /***.
     * 修改文件信息
     * @param attach 文件信息
     * @return 文件信息
     */
    SysFile updateSysFile(SysFile attach);

    /**.
     * 修改附件信息
     * @param attach 附件信息
     */
    void updateSysAttachFile(SysAttachment attach);

}
