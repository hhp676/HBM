/*
 * Project Name:hbm-be.
 * File Name:SysMetadataFieldServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年12月26日 上午10:45:20
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hbm.be.dao.sys.SysMetadataFieldDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hbm.base.entity.sys.SysMetadataField;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysMetadataFieldService;

/**
 * 元数据字段表: sys_metadata_field. <br />
 * service impl 层 <br />
 * Date: 2016年12月26日 上午10:45:20 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
@HService
public class SysMetadataFieldServiceImpl extends BizService<SysMetadataField, SysMetadataFieldDao> 
    implements SysMetadataFieldService {

    @Override
    public Page<SysMetadataField> getPageList(BasePage<SysMetadataField> basePage,
        SysMetadataField filter, final String... loadProps) {
        
        SysMetadataField realFilter = filter == null ? new SysMetadataField() : filter;
        realFilter.setIsDelete(0);
        return super.getPageList(basePage, filter);
        
    }
}
