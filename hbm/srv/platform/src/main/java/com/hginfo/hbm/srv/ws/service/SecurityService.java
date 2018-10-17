/**
 * Project Name:hbm-srv-spring
 * File Name:SecurityService.java
 * Package Name:com.hginfo.hbm.srv.rest.service
 * Date:2017年5月27日上午10:08:29
 * Copyright (c) 2017, hongguaninfo.com All Rights Reserved.
 *
 */

package com.hginfo.hbm.srv.ws.service;

import java.util.Map;

import javax.jws.WebService;

/**
 * 安全服务接口。
 * ClassName:SecurityService <br/>
 * Date: 2017年5月27日 上午10:08:29 <br/>
 * @author licheng
 * @version
 * @since V1.0.0
 * @see
 */
@WebService
public interface SecurityService {
    
    Map<String, String> getPublicKey();
}
