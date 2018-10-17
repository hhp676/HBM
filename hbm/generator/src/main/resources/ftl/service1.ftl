/*
 * Project Name:hbm-base.
 * File Name:${meta.className}${ServiceSuffix}.java
 * Package Name:${pkgName}.${serviceFolder}
 * Date:${currentDate}
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package ${pkgName}.${serviceFolder};

import ${pkgName}.${entityFolder}.${meta.className};
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.page.Page;

/**
 * ${meta.tableDesc}: ${meta.tableName}. <br />
 * service interface 层 <br />
 * Date: ${currentDate} <br />
 *
 * @author ${author}
 * @since V1.0.0
 */
public interface ${meta.className}${ServiceSuffix} {

    /**
     *
     * @param pageInfo page info
     * @param filter filter
     * @param loadProps 需要级联加载的实体属性
     * @return page result
     */
    Page<${meta.className}> getPageList(BasePage<${meta.className}> pageInfo,
                                         ${meta.className} filter, String... loadProps);

    /**
     * 新增。
     * @param entity entity
     */
    void add(${meta.className} entity);

    /**
     * 修改。
     * @param entity entity
     */
    void update(${meta.className} entity);

    /**
     * 删除。
     * @param id id
     */
    void delete(Long id);
}
