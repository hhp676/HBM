/*
 * Project Name:hbm-be.
 * File Name:SysDauthMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2017年01月12日 下午6:28:35
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import java.util.List;

import com.hginfo.hbm.be.dauth.bean.DauthFilterGroupBean;
import com.hginfo.hbm.be.dauth.bean.DauthFilterItemBean;
import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 数据权限表: sys_dauth。 <br />
 * mapper 层 <br />
 * Date: 2017年01月12日 下午6:28:35 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public interface SysDauthMapper extends BaseSqlMapper {
    
    
    /**
     * 获取过滤器组所有的过滤器项。
     * @param filterGroupId filterGroupId
     * @return 过滤器项
     */
    List<DauthFilterItemBean> getDauthFilterItemList(long filterGroupId);
    
    /**
     * 获取数据权限所有的过滤器组。
     * @param dauthCode dauthCode
     * @return 过滤器组
     */
    List<DauthFilterGroupBean> getDauthFilterGroupList(String dauthCode);

}
