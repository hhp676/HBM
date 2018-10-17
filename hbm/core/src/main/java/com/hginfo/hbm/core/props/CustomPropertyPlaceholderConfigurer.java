package com.hginfo.hbm.core.props;

import java.util.Properties;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;


/**
 * 自定义属性配置类。
 * @author henry
 */
public class CustomPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {
    /**
     */
    private Properties props;
    /**
     */
    private static Log log = LogFactory.getLog(CustomPropertyPlaceholderConfigurer.class);
    
    @Override
    protected void processProperties(ConfigurableListableBeanFactory beanFactory, Properties properties)
            throws BeansException {
        super.processProperties(beanFactory, properties);
        log.debug(String.valueOf(properties));
        this.props = properties;
    }

    public Properties getProps() {
        return props;
    }

    /**
     * @param key 
     * @return Property
     */
    public Object getProperty(String key) {
        return props.get(key);
    }
}
