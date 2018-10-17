/*
 * Project Name:hbm-be.
 * File Name:SrvLogServiceImpl.java
 * Package Name:com.hginfo.hbm.be.service.impl.srv
 * Date:2017年06月08日 上午10:07:12
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.be.service.impl.srv;

import com.hginfo.hbm.base.entity.srv.SrvLog;
import com.hginfo.hbm.base.service.srv.SrvLogService;
import com.hginfo.hbm.be.dao.srv.SrvLogDao;
import com.hginfo.hbm.be.service.base.SingleKeyBaseService;
import com.hginfo.hdubbo.annotation.HService;
import com.hginfo.hutils.IpAddressUtil;

/**
 * 接口日志表: srv_log. <br />
 * service impl 层 <br />
 * Date: 2017年06月08日 上午10:07:12 <br />
 *
 * @author qiujingde
 * @since V1.0.0
 */
@HService
public class SrvLogServiceImpl extends SingleKeyBaseService<SrvLog, SrvLogDao>
        implements SrvLogService {

    /**
     * 添加。
     *
     * @param e entity
     * @since V1.0.0
     */
    public void add(SrvLog e) {
        e.setProviderIp(IpAddressUtil.getLocalIp());
        super.add(e);
    }

    @Override
    public int getMaxProcessTime() {
        int result = this.getDao().selectResult("getMaxProcessTime", new SrvLog());
        return result;
    }

}
