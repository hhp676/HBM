/**
 * Project Name:hbm-base
 * File Name:SysTokenService.java
 * Package Name:com.hginfo.hbm.base.service.sys
 * Date:2016年11月25日下午7:08:35
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.base.service.sys;

import com.hginfo.hbm.base.entity.sys.SysToken;

/**
 * SysTokenService.
 * ClassName:SysTokenService <br/>
 * Date: 2016年11月25日 下午7:08:35 <br/>
 * @author licheng
 * @since V1.0.0
 */
public interface SysTokenService {
    
    /**
     * 验证是否是一个有效token。
     * @author licheng
     * @param sysToken 需要账户id和sign。
     * @return 是否有效
     * @since V1.0.0
     */
    boolean isValidToken(SysToken sysToken);
    
    /**
     * 创建一个令牌。
     * @author licheng
     * @param accountId 账户ID
     * @return 令牌
     * @since V1.0.0
     */
    SysToken createToken(Long accountId);
    
    /**
     * 创建一个令牌。
     * @author licheng
     * @param accountId 账户ID
     * @param timeout 有效时间（秒）
     * @return 令牌
     * @since V1.0.0
     */
    SysToken createToken(Long accountId, int timeout);
    
}
