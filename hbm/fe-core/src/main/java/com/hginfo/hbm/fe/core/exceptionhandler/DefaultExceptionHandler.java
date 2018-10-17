package com.hginfo.hbm.fe.core.exceptionhandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 自定义异常处理器。<br>
 * Date: 2016年9月9日 下午6:27:59 <br/>
 * @author shichengqun
 */
@ControllerAdvice
public class DefaultExceptionHandler implements HandlerExceptionResolver {
    
    /**
     */
    private static final Log     LOG = LogFactory.getLog(DefaultExceptionHandler.class);
    
    /**
     * 系统异常处理。
     * @param request 
     * @param response 
     * @param handler 
     * @param ex 
     * @return 视图
     */
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response,
        Object handler, Exception ex) {
        LOG.error("Catch Exception: ", ex);
        return ExceptionToolkit.resolveException(request, response, handler, ex);
    }
    
}
