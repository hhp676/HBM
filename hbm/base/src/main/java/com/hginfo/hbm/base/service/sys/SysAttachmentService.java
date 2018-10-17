/**
* Project Name:hbm-base.
* File Name:SysAttachmentService.java
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

import java.util.List;

/**
* 系统附件表: sys_attachment. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:54 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysAttachmentService {

    /**
     * 获取列表。
     * @param entity 实体
     * @param loadProps 需要级联加载的实体属性
     * @return 列表
     * @since V1.0.0
     */
    List<SysAttachment> getList(SysAttachment entity, final String... loadProps);
    
    /**
     * getById:(主键查询). <br/>
     * @author yinyanzhen]
     * @param id id
     * @return SysAttachment
     * @since V1.0.0
     */
    SysAttachment getById(Long id);
    
    /**
     * getPageList:(分页查询). <br/>
     * @author yinyanzhen
     * @param pageInfo
     * @param filter
     * @param loadProps
     * @return Page Page
     * @since V1.0.0
     */
    Page<SysAttachment> getPageList(BasePage<SysAttachment> pageInfo,SysAttachment filter, final String... loadProps);

}
