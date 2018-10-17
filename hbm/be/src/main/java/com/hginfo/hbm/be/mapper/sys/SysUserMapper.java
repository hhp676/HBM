/**
 * Project Name:hbm-be.
 * File Name:SysUserMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年11月29日 下午2:21:33
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hginfo.hbm.base.entity.sys.SysUser;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 用户表: sys_user. <br />
 * mapper 层 <br />
 * Date: 2016年11月29日 下午2:21:33 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysUserMapper extends BaseSqlMapper {

    /**
     * 
     * getUserByUserName:(根据用户名称获取用户信息). <br/>
     *
     * @author zhangdianbo
     * @param userName 
     * @return SysUser  
     * @since V1.0.0
     */
    SysUser getUserByLoginName(String userName);
    
    /**
     * getUserEntryGroup:(聚合查询入职时间). <br/>
     * @author yinyanzhen
     * @param vo vo
     * @return List<Map<String, Object>>
     * @since V1.0.0
     */
    List<Map<String, Object>> getUserEntryGroup(Map vo);
    
    /**
     * getUserQuitGroup:(聚合查询离职时间). <br/>
     * @author yinyanzhen
     * @param vo vo
     * @return List<Map<String, Object>>
     * @since V1.0.0
     */
    List<Map<String, Object>> getUserQuitGroup(Map vo);

}
