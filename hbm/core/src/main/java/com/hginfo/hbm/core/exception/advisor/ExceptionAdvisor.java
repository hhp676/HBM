package com.hginfo.hbm.core.exception.advisor;

import java.lang.reflect.Method;

import org.springframework.aop.ThrowsAdvice;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 处理异常信息。 
 * <p>此异常处理不会对程序执行产生影响，只是可以对异常进行一些个性化需求的处理
 * <p>如果需要使用，可在Spring的配置文件中添加如下代码（对所有的service、dao的方法异常进行处理）：
 * <pre class="code">&lt;bean id="exceptionAdvisor" class="com.hginfo.hbm.be.core.exception.ExceptionAdvisor"/&gt;</pre>
 * <pre class="code">&lt;aop:config proxy-target-class="true"&gt;</pre>
 * <pre class="code">    &lt;aop:advisor pointcut="execution(* *..service..*Service.*(..)) 
 *       or execution(* *..dao..*.*(..))" advice-ref="exceptionAdvisor" /&gt;</pre>
 * <pre class="code">&lt;/aop:config&gt;</pre>
 * 
 * Date: 2016年9月9日 下午5:04:27 <br/>
 * @author shichengqun
 */
public class ExceptionAdvisor implements ThrowsAdvice {
    
    /**
     */
    private static Log log = LogFactory.getLog(ExceptionAdvisor.class);
    
    /**
     * 抛出异常后执行。
     * @param method 方法
     * @param args 参数
     * @param target 对象
     * @param ex 异常信息
     */
    public void afterThrowing(Method method, Object[] args, Object target, Exception ex) {
        log.info("**************************************************************");
        log.info("Error happened in class: " + target.getClass().getName());
        log.info("Error happened in method: " + method.getName());
        for (int i = 0; i < args.length; i++) {
            log.info("arg[" + i + "]: " + args[i]);
        }
        log.info("Exception class: " + ex.getClass().getName());
        log.info("ex.getMessage():" + ex.getMessage());
        log.info("**************************************************************");
    }
}
