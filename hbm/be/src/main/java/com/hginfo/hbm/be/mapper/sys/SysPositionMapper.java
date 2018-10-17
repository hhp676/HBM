/**
 * Project Name:hbm-be.
 * File Name:SysPositionMapper.java
 * Package Name:com.hginfo.hbm.be.mapper.sys
 * Date:2016年11月29日 下午2:21:33
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.mapper.sys;

import com.hginfo.hbm.be.mapper.base.BaseSqlMapper;

/**
 * 岗位表: sys_position. <br />
 * mapper 层 <br />
 * Date: 2016年11月29日 下午2:21:33 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
public interface SysPositionMapper extends BaseSqlMapper {
    /**
     * getPosIdsByFid:(通过父岗位Id,获取id串). <br/>
     * @author yinyanzhen
     * @param posFID posFID
     * @return String ids串
     * @since V1.0.0
     */
    String getPosIdsByFid(Long posFID);

}
