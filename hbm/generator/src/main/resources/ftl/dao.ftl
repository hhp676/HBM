/*
 * Project Name:hbm-be.
 * File Name:${meta.className}${DaoSuffix}.java
 * Package Name:${pkgName}.${daoFolder}
 * Date:${currentDate}
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package ${pkgName}.${daoFolder};

import org.springframework.stereotype.Repository;

import ${pkgName}.${entityFolder}.${meta.className};
import com.hginfo.hbm.be.dao.base.SingleKeyBaseDao;
import ${pkgName}.${mapperFolder}.${meta.className}${MapperSuffix};

/**
 * ${meta.tableDesc}: ${meta.tableName}. <br />
 * dao 层 <br />
 * Date: ${currentDate} <br />
 *
 * @author ${author}
 * @since V1.0.0
 */
@Repository
public class ${meta.className}${DaoSuffix} extends SingleKeyBaseDao<${meta.className}>
        implements ${meta.className}${MapperSuffix} {

}
