/*
 * Project Name:hbm-base.
 * File Name:${meta.className}.java
 * Package Name:${pkgName}.${entityFolder}
 * Date:${currentDate}
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 */
package ${pkgName}.${entityFolder};

<#if (hasFk)>import com.hginfo.hbm.annotation.HEntityId;</#if>
import com.hginfo.hbm.base.${baseEntity};
import com.hginfo.hbm.base.meta.TableMeta;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;

/**
 * ${meta.tableDesc}: ${meta.tableName}. <br />
 * entity 层 <br />
 * Date: ${currentDate} <br />
 *
 * @author ${author}
 * @since V1.0.0
 */
@Entity(name = "${meta.entityName}")
@DynamicInsert
public class ${meta.className} extends ${baseEntity} {

    /**
     * serialVersionUID.
     * @since V1.0.0
     */
    private static final long serialVersionUID = 1L;

    /**
     * 数据库表元数据。
     */
    static final TableMeta TABLE_META = new TableMeta();

    static {
        TABLE_META.setAlias("${meta.tableAlias}");
    <#list meta.cols as col>
        TABLE_META.addField("${col.fieldName}", "${col.colName}", ${col.javaType}.class);
    </#list>
    }

    <#list meta.entityCols as col>
    /**
     * ${col.colName} : ${col.colDesc}。
     */
    private ${col.javaType} ${col.fieldName};
    </#list>
    <#-- 解析外键关系 -->
    <#list meta.fks as fk>
    /**
     * ${fk.fkColumn.fieldName} : ${fk.pkColumn.table.tableDesc}实体。
     */
    @HEntityId("${fk.fkColumn.fieldName}")
    private ${fk.pkColumn.table.className} ${fk.fieldName};
    </#list>

    @Override
    @Transient
    public Long getId() {
        return ${meta.pkCols[0].geOperName}();
    }

    @Override
    public void setId(Long id) {
        ${meta.pkCols[0].seOperName}(id);
    }

    <#list meta.entityCols as col>
        <#if col.pkFlag == true>
    @Id
        </#if>
    @Column(name = "${col.colName}")
    public ${col.javaType} ${col.geOperName}() {
        return ${col.fieldName};
    }

    public void ${col.seOperName}(${col.javaType} ${col.fieldName}) {
        this.${col.fieldName} = ${col.fieldName};
    }

    </#list>
    <#-- 关联实体的getter setter方法 -->
    <#list meta.fks as fk>
    @Transient
    public ${fk.pkColumn.table.className} get${fk.fieldNameU}() {
        return ${fk.fieldName};
    }

    public void set${fk.fieldNameU}(${fk.pkColumn.table.className} ${fk.fieldName}) {
        this.${fk.fieldName} = ${fk.fieldName};
    }

    </#list>
    @Override
    @Transient
    public TableMeta getTableMeta() {
        return TABLE_META;
    }

}
