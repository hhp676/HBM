/**
* Project Name:hbm-base.
* File Name:SysPositionService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:55
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysOrganization;
import com.hginfo.hbm.base.entity.sys.SysPosition;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

import java.util.List;

/**
* 岗位表: sys_position. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:55 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysPositionService {

    /**
     *
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return position list
     */
    List<SysPosition> getList(SysPosition filter, final String... loadProps);

    /**
     *
     * @param parentId 父节点
     * @return 子节点
     */
    List<SysPosition> getOrgChildren(long parentId);

    /**
     *
     * @param parentId 父节点Id
     * @return 子节点
     */
    List<SysPosition> getPosChildren(long parentId);

    /**
     *
     * @param id id
     * @return pos
     */
    SysPosition getById(long id);

    /**
     *
     * @param newPos new position
     * @return saved position
     */
    SysPosition createPosition(SysPosition newPos);

    /**
     *
     * @param editPos edit position
     * @return saved position
     */
    SysPosition editPosition(SysPosition editPos);

    /**
     *
     * @param posId position id
     * @return deleted position
     */
    SysPosition deletePosition(long posId);

    /**
     *
     * @param basePage page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<SysPosition> getPageList(BasePage<SysPosition> basePage, SysPosition filter, final String... loadProps);
}
