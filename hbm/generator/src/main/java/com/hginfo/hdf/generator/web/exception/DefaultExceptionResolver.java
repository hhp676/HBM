package com.hginfo.hdf.generator.web.exception;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * springMVC 异常处理。 <br />
 * Date: 2016年12月07日 上午11:11:35 <br />
 *
 * @author  henry
 * @author qiujingde
 * @since V1.0.0
 */
@ControllerAdvice
public class DefaultExceptionResolver implements HandlerExceptionResolver {

    /**
     * 日志。
     */
    private static final Log LOG = LogFactory.getLog(DefaultExceptionResolver.class);

    /**
     * 异常处理。
     * @param req current HTTP request
     * @param resp current HTTP response
     * @param handler the executed handler, or {@code null} if none chosen at the
     * time of the exception (for example, if multipart resolution failed)
     * @param ex the exception that got thrown during handler execution
     * @return a corresponding {@code ModelAndView} to forward to, or {@code null} for default processing
     */
    public ModelAndView resolveException(
            HttpServletRequest req, HttpServletResponse resp, Object handler, Exception ex) {
        LOG.error("Catch Exception: ", ex);
        Map<String, Object> map = new HashMap<>();
        map.put("errorMsg", ex.getMessage());
        
        return new ModelAndView("error/500", map);
    }

}
