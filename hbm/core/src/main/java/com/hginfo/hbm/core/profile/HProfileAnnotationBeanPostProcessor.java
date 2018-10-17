package com.hginfo.hbm.core.profile;

import com.hginfo.hbm.base.service.sys.SysConfigService;
import com.hginfo.hbm.base.service.sys.SysUserProfileService;
import com.hginfo.hbm.core.annotation.HProfile;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.SpringContextUtil;
import com.hginfo.hutils.StringUtil;
import org.springframework.beans.SimpleTypeConverter;
import org.springframework.beans.factory.annotation.AnnotatedBeanDefinition;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.InstantiationAwareBeanPostProcessorAdapter;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.BeanNameGenerator;
import org.springframework.context.annotation.AnnotationBeanNameGenerator;
import org.springframework.context.annotation.ClassPathBeanDefinitionScanner;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopeMetadata;
import org.springframework.context.annotation.ScopeMetadataResolver;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.AnnotationAttributes;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.core.type.AnnotatedTypeMetadata;
import org.springframework.core.type.AnnotationMetadata;
import org.springframework.core.type.classreading.MetadataReader;
import org.springframework.core.type.filter.AbstractTypeHierarchyTraversingFilter;
import org.springframework.core.type.filter.TypeFilter;
import org.springframework.util.ClassUtils;
import org.springframework.util.ReflectionUtils;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

/**
 * HConfig注解处理类。<br />
 * 注意：暂时只支持对spring MVC中Controller层对象的处理。<br />
 * Created by qiujingde on 2016/12/8.
 */
public class HProfileAnnotationBeanPostProcessor extends InstantiationAwareBeanPostProcessorAdapter
        implements BeanFactoryPostProcessor, Ordered {

    /**
     *
     */
    private static final Log LOG = LogFactory.getLog(HProfileAnnotationBeanPostProcessor.class);

    /**
     * 优先级，比HAnnotationBean低，比其他高。
     */
    private static final int ORDER = Integer.MAX_VALUE - 500;

    /**
     *
     */
    private static final String DEFAULT_PROFILE_SCOPE = "profile";

    /**
     *
     */
    private static final String PROFILE_SCOPE_BEAN_NAME = "profileScope";

    /**
     *
     */
    private SysConfigService configService;
    /**
     *
     */
    private SysUserProfileService profileService;
    /**
     */
    private SimpleTypeConverter typeConverter = new SimpleTypeConverter();

    @Override
    public int getOrder() {
        return ORDER;
    }

    @Override
    public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) {
        LOG.debug("start HProfile scan.............");

        beanFactory.registerScope(DEFAULT_PROFILE_SCOPE,
                beanFactory.getBean(PROFILE_SCOPE_BEAN_NAME, org.springframework.beans.factory.config.Scope.class));

        if (beanFactory instanceof BeanDefinitionRegistry) {
            ClassPathBeanDefinitionScanner scanner =
                    new ClassPathBeanDefinitionScanner((BeanDefinitionRegistry) beanFactory, false);
            TypeFilter filter = new FieldAnnotationTypeFilter(HProfile.class);
            scanner.addIncludeFilter(filter);

            BeanNameGenerator beanNameGenerator = new AnnotationBeanNameGenerator();
            scanner.setBeanNameGenerator(beanNameGenerator);

            ScopeMetadataResolver scopeResolver =
                    new HConfigScopeMetadataResolver((BeanDefinitionRegistry) beanFactory, beanNameGenerator);
            scanner.setScopeMetadataResolver(scopeResolver);

            scanner.scan("com.hginfo");
        }
        LOG.debug("end HProfile scan.");
    }



    @Override
    public Object postProcessAfterInitialization(final Object bean, String beanName) {

        ReflectionUtils.doWithFields(bean.getClass(), field -> {
            HProfile cfg = field.getAnnotation(HProfile.class);
            if (cfg == null) {
                return;
            }
            if (Modifier.isStatic(field.getModifiers())) {
                throw new IllegalStateException("@HProfile annotation is not supported on static fields");
            }
            // 如果开发者没有设置@HConfig的value，则使用变量域的名称作为键查找配置资源
            String key = cfg.value().length() <= 0 ? field.getName() : cfg.value();
            Object value = getProperty(key);
            if (value == null) {
                LOG.error("配置文件读取  " + key + " 的值为  null !");
                return;
            }
            // 转换配置值成其它非String类型
            value = typeConverter.convertIfNecessary(value, field.getType());
            ReflectionUtils.makeAccessible(field);
            field.set(bean, value);
        });

        return bean;
    }

    /**
     * 获取属性值。
     * @param key  key
     * @return 属性值
     */
    private String getProperty(String key) {
        makeSure();
        String value = profileService.getProperty(key);
        if (StringUtil.isBlank(value)) {
            value = configService.getProperty(key);
        }
        return value;
    }

    /**
     * 确保profileService和configService被初始化。
     */
    private void makeSure() {
        if (profileService == null) {
            profileService = SpringContextUtil.getBean(SysUserProfileService.class);
            configService = SpringContextUtil.getBean(SysConfigService.class);
        }
    }

    /**
     *
     */
    private static final class FieldAnnotationTypeFilter extends AbstractTypeHierarchyTraversingFilter {
        /**
         *
         */
        private final Class<? extends Annotation> annotationType;

        /**
         *
         * @param annotationType annotationType
         */
        FieldAnnotationTypeFilter(Class<? extends Annotation> annotationType) {
            super(true, false);
            this.annotationType = annotationType;
        }

        @Override
        protected boolean matchSelf(MetadataReader metadataReader) {
            AnnotationMetadata metadata = metadataReader.getAnnotationMetadata();
            Boolean match = hasAnnotation(metadata.getClassName());
            return match != null && match;
        }

        @Override
        protected Boolean matchSuperClass(String superClassName) {
            return hasAnnotation(superClassName);
        }

        /**
         *
         * @param typeName typeName
         * @return 判断结果
         */
        private Boolean hasAnnotation(String typeName) {
            if (!typeName.startsWith("com.hginfo")) {
                return false;
            }
            try {
                Class<?> clazz = ClassUtils.forName(typeName, getClass().getClassLoader());
                Field[] fields = clazz.getDeclaredFields();
                for (Field field : fields) {
                    if (AnnotationUtils.getAnnotation(field, this.annotationType) != null) {
                        return true;
                    }
                }
                return false;
            } catch (Throwable ex) {
                // Class not regularly loadable - can't determine a match that way.
                LOG.info("Class not regularly loadable - can't determine a match that way. ClassName:" + typeName);
            }

            return null;
        }
    }

    /**
     *
     */
    private static final class HConfigScopeMetadataResolver implements ScopeMetadataResolver {

        /**
         *
         */
        private final Class<? extends Annotation> scopeAnnotationType = Scope.class;

        /**
         *
         */
        private final ScopedProxyMode defaultProxyMode = ScopedProxyMode.TARGET_CLASS;

        /**
         * beanFactory.
         */
        private final BeanDefinitionRegistry registry;
        /**
         *
         */
        private final BeanNameGenerator beanNameGenerator;

        /**
         *
         * @param registry               beanFactory
         * @param beanNameGenerator      beanNameGenerator
         */
        HConfigScopeMetadataResolver(BeanDefinitionRegistry registry, BeanNameGenerator beanNameGenerator) {
            this.registry = registry;
            this.beanNameGenerator = beanNameGenerator;
        }

        @Override
        public ScopeMetadata resolveScopeMetadata(BeanDefinition definition) {
            ScopeMetadata metadata = new ScopeMetadata();
            ScopedProxyMode proxyMode = defaultProxyMode;
            String scope = DEFAULT_PROFILE_SCOPE;

            if (definition instanceof AnnotatedBeanDefinition) {
                AnnotatedBeanDefinition annDef = (AnnotatedBeanDefinition) definition;
                AnnotationAttributes attributes = attributesFor(
                        annDef.getMetadata(), this.scopeAnnotationType);
                if (attributes != null) {
                    scope = attributes.getString("value");
                    if ("singleton".equals(scope)) {
                        scope = DEFAULT_PROFILE_SCOPE;
                    }
                    proxyMode = attributes.getEnum("proxyMode");
                    if (proxyMode == null || proxyMode == ScopedProxyMode.DEFAULT) {
                        proxyMode = this.defaultProxyMode;
                    }
                }
            } else {
                scope = definition.getScope();
                if (StringUtil.isBlank(scope) || "singleton".equals(scope)) {
                    scope = DEFAULT_PROFILE_SCOPE;
                }
            }
            metadata.setScopeName(scope);
            metadata.setScopedProxyMode(proxyMode);
            LOG.debug("HProfileAnnotationBeanPostProcessor modify " + definition.getBeanClassName()
                    + "'s scope to " + scope + " and it's scopedProxyMode to " + proxyMode);

            // force register again.
            String beanName = beanNameGenerator.generateBeanName(definition, registry);
            if (registry.containsBeanDefinition(beanName)) {
                registry.removeBeanDefinition(beanName);
            }

            return metadata;
        }

        /**
         *
         * @param metadata           metadata
         * @param annotationClass    annotationClass
         * @return    注解属性
         */
        private static AnnotationAttributes attributesFor(AnnotatedTypeMetadata metadata, Class<?> annotationClass) {
            String annotationClassName = annotationClass.getName();
            return AnnotationAttributes.fromMap(metadata.getAnnotationAttributes(annotationClassName, false));
        }

    }



}
