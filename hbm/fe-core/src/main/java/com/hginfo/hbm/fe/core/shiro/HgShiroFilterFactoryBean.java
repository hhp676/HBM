package com.hginfo.hbm.fe.core.shiro;

import com.hginfo.hutils.StringUtil;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.mgt.FilterChainManager;
import org.apache.shiro.web.filter.mgt.FilterChainResolver;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.mgt.WebSecurityManager;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.BeanInitializationException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

/**
 * 重写shiro过滤器，忽略静态资源目录。
 * Created by licheng on 2017/8/11.
 */
public class HgShiroFilterFactoryBean extends ShiroFilterFactoryBean {


    private AbstractShiroFilter instance;

    private static transient final Logger log = LoggerFactory.getLogger(ShiroFilterFactoryBean.class);

    @Override
    public Object getObject() throws Exception {
        if (instance == null) {
            instance = createInstance();
        }
        return instance;
    }

    @Override
    public Class getObjectType() {
        return HgSpringShiroFilter.class;
    }

    @Override
    protected AbstractShiroFilter createInstance() throws Exception {

        log.debug("Creating Shiro Filter instance.");

        SecurityManager securityManager = getSecurityManager();
        if (securityManager == null) {
            String msg = "SecurityManager property must be set.";
            throw new BeanInitializationException(msg);
        }

        if (!(securityManager instanceof WebSecurityManager)) {
            String msg = "The security manager does not implement the WebSecurityManager interface.";
            throw new BeanInitializationException(msg);
        }

        FilterChainManager manager = createFilterChainManager();

        //Expose the constructed FilterChainManager by first wrapping it in a
        // FilterChainResolver implementation. The AbstractShiroFilter implementations
        // do not know about FilterChainManagers - only resolvers:
        PathMatchingFilterChainResolver chainResolver = new PathMatchingFilterChainResolver();
        chainResolver.setFilterChainManager(manager);

        //Now create a concrete ShiroFilter instance and apply the acquired SecurityManager and built
        //FilterChainResolver.  It doesn't matter that the instance is an anonymous inner class
        //here - we're just using it because it is a concrete AbstractShiroFilter instance that accepts
        //injection of the SecurityManager and FilterChainResolver:
        return new HgSpringShiroFilter((WebSecurityManager) securityManager, chainResolver);
    }


    private static final class HgSpringShiroFilter extends AbstractShiroFilter {

        private String[] notFilterPaths = new String[]{"/static/", "/plugins/"};


        protected HgSpringShiroFilter(WebSecurityManager webSecurityManager, FilterChainResolver resolver) {
            super();
            if (webSecurityManager == null) {
                throw new IllegalArgumentException("WebSecurityManager property cannot be null.");
            }
            setSecurityManager(webSecurityManager);
            if (resolver != null) {
                setFilterChainResolver(resolver);
            }
        }

        @Override
        protected boolean shouldNotFilter(ServletRequest request) throws ServletException {
            if (request instanceof HttpServletRequest) {
                String reqPath = ((HttpServletRequest) request).getRequestURI();
                for (String notFilterPath : notFilterPaths) {
                    if ( StringUtil.startsWithIgnoreCase(reqPath,notFilterPath)){
                        return true;
                    }
                }
            }
            return false;
        }
    }
}
