/*
 * Project Name:hbm-be.
 * File Name:SysDauthOperatorSupportMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年12月17日 下午4:32:39
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 数据权限运算符支持表: sys_dauth_operator_support。 <br />
 * mapper 层 <br />
 * Date: 2016年12月17日 下午4:32:39 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysDauthOperatorSupportMapper extends BaseSqlMapper {
    
    /**
     * 获取支持的值类型。
     * @param filterTypeId 
     * @param operatorId 
     * @return 值类型
     */
    List<Integer> getDauthValueTypes(@Param("filterTypeId") long filterTypeId, @Param("operatorId") long operatorId);

}
