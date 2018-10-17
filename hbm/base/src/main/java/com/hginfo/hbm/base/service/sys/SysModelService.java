/**
* Project Name:hbm-base.
* File Name:SysModelService.java
* Package Name:com.hginfo.hbm.base.service.sys
* Date:2016年11月29日 下午3:26:55
* Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
*
*/
package com.hginfo.hbm.base.service.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysModel;

/**
* 系统模块表: sys_model. <br />
* service interface 层 <br />
* Date: 2016年11月29日 下午3:26:55 <br />
*
* @author qiujingde
* @since V1.0.0
*/
public interface SysModelService {
    
    /**
     * 添加。
     * @author licheng
     * @param sysModel sysModel
     * @since V1.0.0
     */
    void add(SysModel sysModel);
    
    /**
     * 获取列表。
     * @author licheng
     * @param sysModel sysModel
     * @param loadProps 需要级联加载的实体属性
     * @return 数据集合
     * @since V1.0.0
     */
    List<SysModel> getList(SysModel sysModel, final String... loadProps);
    
    /**
     * 
     * getSysModelById:(根据模块id获得模块实体). <br/>
     *
     * @author yuqing
     * @param modelId 
     * @return sysModel  
     * @since V1.0.0
     */
    SysModel getSysModelById(Long modelId);
    
    /**
     * 
     * createSysModel:(新增模块). <br/>
     *
     * @author yuqing
     * @param sysModel 
     * @since V1.0.0
     */
    void createSysModel(SysModel sysModel);
    
    /**
     * 
     * updateSysModel:(更新模块). <br/>
     *
     * @author yuqing
     * @param sysModel 
     * @since V1.0.0
     */
    void updateSysModel(SysModel sysModel);
    
    /**
     * 
     * deleteSysModel:(删除模块). <br/>
     *
     * @author yuqing
     * @param authId 
     * @since V1.0.0
     */
    void deleteSysModel(Long authId);
}
