/*
 * Project Name:hbm-base.
 * File Name:SysIconService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年12月07日 下午3:17:04
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysIcon;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * 系统图标表: sys_icon. <br />
 * service interface 层 <br />
 * Date: 2016年12月07日 下午3:17:04 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysIconService {
     /**
     * 根据id获取图标配置数据。
     * @param iconId id
     * @return iconId
     */
    SysIcon getIconById(long iconId);

    /**
     * 获取分页图标配置数据。
     * @param pageInfo 分页信息
     * @param filter   查询条件
     * @return 分页数据
     */
    Page<SysIcon> getIconList(BasePage<SysIcon> pageInfo, SysIcon filter);
    
    
    /**
     * 获取图标配置数据。
     * @param filter   查询条件
     * @return 图标配置数据
     */
    List<SysIcon> getIconList(SysIcon filter);

    /**
     * 新增图标配置。
     * @param icon 新增的图标配置
     * @return 保存后的图标配置
     */
    SysIcon createIcon(SysIcon icon);

    /**
     * 修改图标配置。
     * @param icon 要修改的图标配置
     * @return 修改保存后的图标配置
     */
    SysIcon editIcon(SysIcon icon);

    /**
     * 删除图标配置。
     * @param iconId 图标配置ID
     * @return 被删除的图标配置
     */
    SysIcon deleteIcon(long iconId);
    
    /**
     * 物理删除图标配置。
     * @param iconId 图标配置ID
     * @return 被删除的图标配置
     */
    SysIcon deleteIconPhysical(long iconId);


}
