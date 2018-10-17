package com.hginfo.hbm.core.props;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

import com.hginfo.hbm.core.annotation.Config;
import org.springframework.beans.BeansException;
import org.springframework.beans.SimpleTypeConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.InstantiationAwareBeanPostProcessorAdapter;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;

/**
 * 适配器--在实例化Bean后调用，处理@config。
 * @author henry
 */
@Component("configAnnotationBeanPostProcessor")
public class ConfigAnnotationBeanPostProcessor extends InstantiationAwareBeanPostProcessorAdapter {

    /**
     */
    private static final Log LOG = LogFactory.getLog(ConfigAnnotationBeanPostProcessor.class);

    /**
     * 自动注入 CustomPropertyPlaceholderConfigurer对象获取配置资源。
     */
    @Autowired
    private CustomPropertyPlaceholderConfigurer propertyConfigurer;

    /**
     */
    private SimpleTypeConverter typeConverter = new SimpleTypeConverter();
    
    @Override
    public boolean postProcessAfterInstantiation(final Object bean, String beanName) throws BeansException {
        ReflectionUtils.doWithFields(bean.getClass(), new ReflectionUtils.FieldCallback() {
            public void doWith(Field field) throws IllegalArgumentException, IllegalAccessException {
                Config cfg = field.getAnnotation(Config.class);
                if (cfg != null) {
                    if (Modifier.isStatic(field.getModifiers())) {
                        throw new IllegalStateException("@Config annotation is not supported on static fields");
                    }

                    // 如果开发者没有设置@Config的 value，则使用变量域的名称作为键查找配置资源
                    String key = cfg.value().length() <= 0 ? field.getName() : cfg.value();
                    Object value = propertyConfigurer.getProperty(key);
                    if (value == null) {
                        LOG.error("配置文件读取  " + key + " 的值为  null !");
                    }
                    if (value != null) {
                        // 转换配置值成其它非String类型
                        value = typeConverter.convertIfNecessary(value, field.getType());
                        ReflectionUtils.makeAccessible(field);
                        field.set(bean, value);
                    }
                }
            }
        });

        return true;
    }
}
