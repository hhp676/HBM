package com.hginfo.hbm.srv.log;

import com.hginfo.hbm.base.entity.srv.SrvLog;
import com.hginfo.hbm.fe.core.log.RestLogger;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * 日志输出：输出到消息队列。
 * Created by licheng on 2017-6-16.
 */
public class QueueLoggerImpl implements RestLogger {

    /**
     * TODO 输出日志到消息队列。
     * @param srvLog 日志
     * @param request request
     * @param handler handler
     * @param ex ex
     */
    public  void log(SrvLog srvLog, HttpServletRequest request, HandlerMethod handler, Exception ex){
    }
}
