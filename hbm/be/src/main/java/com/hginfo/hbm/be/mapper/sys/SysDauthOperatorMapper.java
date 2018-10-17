/*
 * Project Name:hbm-be.
 * File Name:SysDauthOperatorMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年12月17日 下午4:32:39
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import java.util.List;

import com.hginfo.hbm.base.entity.sys.SysDauthOperator;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 数据权限运算符表: sys_dauth_operator。 <br />
 * mapper 层 <br />
 * Date: 2016年12月17日 下午4:32:39 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysDauthOperatorMapper extends BaseSqlMapper {

    

    /**
     * 根据过滤类型获取支持的运算符。
     * @param filterTypeId 
     * @return 运算符list
     */
    List<SysDauthOperator> getDauthOperators(long filterTypeId);
}
