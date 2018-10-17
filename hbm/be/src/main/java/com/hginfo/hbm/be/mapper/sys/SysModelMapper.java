/**
 * Project Name:hbm-be.
 * File Name:SysModelMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年11月29日 下午2:21:32
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysAuth;
import com.hginfo.hbm.base.entity.sys.SysModel;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 系统模块表: sys_model. <br />
 * mapper 层 <br />
 * Date: 2016年11月29日 下午2:21:32 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysModelMapper extends BaseSqlMapper {
    /**
     * 
     * 获得模块顶层. <br/>
     * 
     * @author yuqing
     * @param  sysModel sysModel
     * @return SysModel 
     * @since V1.0.0
     */
    SysModel getTopModel(SysModel sysModel);
    
    /**
     * 
     * 根据fid获得子类模块. <br/>
     *
     * @author yuqing
     * @param  sysModel sysModel
     *  fid 多个可用','号分隔
     * @return List<SysModel> 
     * @since V1.0.0
     */
    List<SysModel> getSubMenu(SysModel sysModel);
    
    /**
     * 
     * getEqAndContainCode:(获得相等或存在包含关系的编号数). <br/>
     *
     * @author yuqing
     * @param sysModel 
     * @return int  
     * @since V1.0.0
     */
    Integer getEqAndContainCode(SysModel sysModel);
    
    /**
     * 
     * getEqAndContainURI:(获得相等或存在包含关系的URI数量). <br/>
     *
     * @author yuqing
     * @param sysModel  
     * @return int  
     * @since V1.0.0
     */
    Integer getEqAndContainURI(SysModel sysModel);
    
    /**
     * 
     * getPreUriList:(获得与URI统配符之前路径匹配的集合). <br/>
     *
     * @author yuqing
     * @param sysModel 
     * @return list  
     * @since V1.0.0
     */
    List<SysAuth> getPreUriList(SysModel sysModel);
    
}
