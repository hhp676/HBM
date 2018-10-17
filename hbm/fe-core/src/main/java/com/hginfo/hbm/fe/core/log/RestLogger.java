package com.hginfo.hbm.fe.core.log;

import com.hginfo.hbm.base.entity.srv.SrvLog;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * 日志记录接口。
 * Created by licheng on 2017-6-16.
 */
public interface RestLogger {

    void log(SrvLog srvLog, HttpServletRequest request, HandlerMethod handler, Exception ex);

}
