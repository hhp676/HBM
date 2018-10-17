package com.hginfo.hbm.srv.log;

import com.hginfo.hbm.base.entity.srv.SrvLog;
import com.hginfo.hbm.fe.core.log.RestLogger;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * 日志输出：输出到文件。
 * Created by licheng on 2017-6-16.
 */
public class FileLoggerImpl implements RestLogger {

    /**
     * T输出日志到文件。
     * @param srvLog 日志
     * @param request request
     * @param handler handler
     * @param ex ex
     */
    public  void log(SrvLog srvLog, HttpServletRequest request, HandlerMethod handler, Exception ex){
    }
}
