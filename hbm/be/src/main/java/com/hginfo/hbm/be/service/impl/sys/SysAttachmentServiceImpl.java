/*
 * Project Name:hbm-be.
 * File Name:SysAttachmentServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年11月29日 下午3:43:44
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hbm.base.entity.sys.SysAttachment;
import com.hginfo.hbm.base.service.sys.SysAttachmentService;
import com.hginfo.hbm.be.dao.sys.SysAttachmentDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
* 系统附件表: sys_attachment. <br />
* service impl 层 <br />
* Date: 2016年11月29日 下午3:43:44 <br />
*
* @author qiujingde
* @since V1.0.0
*/
@HService
public class SysAttachmentServiceImpl extends BizService<SysAttachment, SysAttachmentDao>
    implements SysAttachmentService {
    
    @Override
    public SysAttachment getById(Long id) {
        return this.get(id);
        
    }
}
