/*
 * Project Name:hbm-be.
 * File Name:${meta.className}${ServiceImplSuffix}.java
 * Package Name:${pkgName}.${serviceImplFolder}
 * Date:${currentDate}
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package ${pkgName}.${serviceImplFolder};

import com.hginfo.hdubbo.annotation.HService;
import ${pkgName}.${daoFolder}.${meta.className}${DaoSuffix};
import com.hginfo.hbm.be.service.base.${baseService};
import ${pkgName}.${entityFolder}.${meta.className};
import ${pkgName}.${serviceFolder}.${meta.className}${ServiceSuffix};

/**
 * ${meta.tableDesc}: ${meta.tableName}. <br />
 * service impl 层 <br />
 * Date: ${currentDate} <br />
 *
 * @author ${author}
 * @since V1.0.0
 */
@HService
public class ${meta.className}${ServiceImplSuffix} extends ${baseService}<${meta.className}, ${meta.className}${DaoSuffix}>
        implements ${meta.className}${ServiceSuffix} {

}
