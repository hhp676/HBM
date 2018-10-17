package com.hginfo.hbm.be.meta;

import com.google.common.collect.BiMap;
import com.google.common.collect.HashBiMap;
import com.hginfo.hbm.base.BaseEntity;
import com.hginfo.hlog.Log;
import com.hginfo.hlog.LogFactory;
import com.hginfo.hutils.StringUtil;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.ClassPathScanningCandidateComponentProvider;
import org.springframework.core.type.classreading.MetadataReader;
import org.springframework.core.type.classreading.MetadataReaderFactory;
import org.springframework.core.type.filter.AnnotationTypeFilter;
import org.springframework.core.type.filter.AssignableTypeFilter;
import org.springframework.core.type.filter.TypeFilter;
import org.springframework.stereotype.Component;
import org.springframework.util.ClassUtils;

import javax.annotation.PostConstruct;
import javax.persistence.Entity;
import java.io.IOException;

/**
 * Created by qiujingde on 2017/5/18.
 * 扫描entity类，根据@Entity注解获取entity class和数据库表的对应关系。
 */
@Component
public class TableNameScanner {

    /**
     * 日志。
     */
    private final Log log = LogFactory.getLog(getClass());

    /**
     * 双向map。
     */
    private final BiMap<Class<? extends BaseEntity>, String> entityMap = HashBiMap.create();

    /**
     * 执行扫描。
     */
    @PostConstruct
    private void init() {
        ClassPathScanningCandidateComponentProvider scanner =
                new ClassPathScanningCandidateComponentProvider(false);
        scanner.addIncludeFilter(new EntityFilter());

        for (BeanDefinition bd : scanner.findCandidateComponents("com.hginfo")) {
            log.debug("TableNameScanner get entity class: " + bd.getBeanClassName());
            addEntity(bd.getBeanClassName());
        }

    }

    /**
     * 根据实体类获取对应的表名。
     * @param eClass 实体类
     * @return 对应表名
     */
    public String getTableNameByEntityClass(Class<? extends BaseEntity> eClass) {
        return entityMap.get(eClass);
    }

    /**
     * 根据表名获取对应的实体类。
     * @param tableName 表名
     * @return 实体类
     */
    public Class<? extends BaseEntity> getEntityClassByTableName(String tableName) {
        return entityMap.inverse().get(tableName);
    }

    /**
     * 实体类过滤器。
     */
    private class EntityFilter implements TypeFilter {

        /**
         * Entity注解过滤器。
         */
        private final TypeFilter annotationFilter = new AnnotationTypeFilter(Entity.class);
        /**
         * BaseEntity子类过滤器。
         */
        private final TypeFilter classFilter = new AssignableTypeFilter(BaseEntity.class);

        @Override
        public boolean match(MetadataReader metadataReader, MetadataReaderFactory metadataReaderFactory)
                throws IOException {
            return annotationFilter.match(metadataReader, metadataReaderFactory)
                    && classFilter.match(metadataReader, metadataReaderFactory);
        }
    }

    /**
     * 解析对应关系。
     * @param className entity class name
     */
    @SuppressWarnings("unchecked")
    private void addEntity(String className) {
        try {
            Class<? extends BaseEntity> clazz =
                    (Class<? extends BaseEntity>) ClassUtils.forName(className, getClass().getClassLoader());
            Entity entity = clazz.getAnnotation(Entity.class);

            String tableName = entity.name();
            if (StringUtil.isNotBlank(tableName)) {
                entityMap.put(clazz, tableName);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


}
