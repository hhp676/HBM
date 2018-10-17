/*
 * Project Name:hbm-be.
 * File Name:SysIconServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.sys
 * Date:2016年12月07日 下午3:17:04
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysIcon;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;
import com.hginfo.hbm.base.service.sys.SysIconService;
import com.hginfo.hbm.be.dao.sys.SysIconDao;
import com.hginfo.hbm.be.service.base.BizService;
import com.hginfo.hdubbo.annotation.HService;

/**
 * 系统图标表: sys_icon. <br />
 * service impl 层 <br />
 * Date: 2016年12月07日 下午3:17:04 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SysIconServiceImpl extends BizService<SysIcon, SysIconDao> implements SysIconService {

    @Override
    public SysIcon getIconById(long iconId) {
        return super.get(iconId);
    }
    
    @Override
    public List<SysIcon> getIconList(SysIcon filter) {
        SysIcon realFilter = filter == null ? new SysIcon() : filter;
        realFilter.setIsDelete(0);
        return super.getList(realFilter);
    }

    @Override
    public Page<SysIcon> getIconList(BasePage<SysIcon> pageInfo, SysIcon filter) {
        SysIcon realFilter = filter == null ? new SysIcon() : filter;
        realFilter.setIsDelete(0);
        return super.getPageList(pageInfo, realFilter);
    }

    @Override
    public SysIcon createIcon(SysIcon icon) {
        super.add(icon);
        return icon;
    }

    @Override
    public SysIcon editIcon(SysIcon icon) {
        super.update(icon);
        return icon;
    }

    @Override
    public SysIcon deleteIcon(long iconId) {
         super.delete(iconId);
         return super.get(iconId);
    }

    @Override
    public SysIcon deleteIconPhysical(long iconId) {
        super.deletePhysical(iconId);
        return super.get(iconId);
    }

}
