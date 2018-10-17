<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- sqlmapper 层 -->
<mapper namespace="${pkgName}.${mapperFolder}.${meta.className}${MapperSuffix}">

    <#if (hasFk)>
    <!-- result map -->
    <resultMap type="${meta.className}" id="${meta.firstLowerClassName}Map">
        <#list meta.cols as col>
        <<#if (col.pkFlag)>id<#else>result</#if> property="${col.fieldName}" column="${col.fieldName}" />
        </#list>
        <#list meta.fks as fk>
        <association property="${fk.fieldName}" column="${fk.fkColumn.fieldName}" select="${pkgName}.${mapperFolder}.${fk.pkColumn.table.className}${MapperSuffix}.getById" />
        </#list>
    </resultMap>
    </#if>

    <!-- sqlColumn -->
    <sql id="SQL_${meta.tableNameUC}_COLUMN">
        <#list meta.cols as col>
        ${meta.tableAlias}.${col.colName} ${col.fieldName}<#if col_index + 1 < meta.cols?size>,</#if>
        </#list>
    </sql>

    <!-- sqlWhere -->
    <sql id="SQL_${meta.tableNameUC}_WHERE">
        <#list meta.cols as col>
            <#if col.colType == "String">
        <if test="${col.fieldName} != null and ${col.fieldName}.length() != 0">
            <#else>
        <if test="${col.fieldName} != null">
            </#if>
            AND ${meta.tableAlias}.${col.colName} = ${r'#{' + col.fieldName + '}'}
        </if>
        </#list>
        <if test="filterStr !=null and filterStr.length()!=0">
            ${r'${filterStr}'}
        </if>
    </sql>

    <#--getById-->
    <!-- According to the id check record  -->
    <select id="getById" parameterType="long" resultType="${meta.className}">
        select <include refid="SQL_${meta.tableNameUC}_COLUMN"/>
        from ${meta.tableNameUC} ${meta.tableAlias}
        <where>
            <#list meta.pkCols as col>
            ${meta.tableAlias}.${col.colName} = ${r'#{idValue}'}
            </#list>
        </where>
    </select>

    <#--getList-->
    <!-- Query All  -->
    <select id="getList" parameterType="${meta.className}" resultType="${meta.className}">
        select <include refid="SQL_${meta.tableNameUC}_COLUMN"/>
        from ${meta.tableNameUC} ${meta.tableAlias}
        <where>
            <include refid="SQL_${meta.tableNameUC}_WHERE"/>
        </where>
        <if test="orderStr != null and orderStr.length() != 0">
            ORDER BY ${r'${orderStr}'}
        </if>
        <if test="orderStr == null or orderStr.length() == 0">
            ORDER BY
            <#list meta.pkCols as col>
                ${meta.tableAlias}.${col.colName} desc<#if col_index + 1 < meta.pkCols?size>,</#if>
            </#list>
        </if>
    </select>

    <#--getListCount-->
    <!-- Statistical line   -->
    <select id="getListCount" parameterType="${meta.className}" resultType="int">
        select count(
            ${meta.tableAlias}.${meta.pkCols[0].colName}
        ) as counts
        from ${meta.tableNameUC} ${meta.tableAlias}
        <where>
            <include refid="SQL_${meta.tableNameUC}_WHERE"/>
        </where>
    </select>

    <!-- check unique count -->
    <select id="checkUniqueCount" parameterType="${meta.className}" resultType="int">
        select count(
            ${meta.tableAlias}.${meta.pkCols[0].colName}
        ) as counts
        from ${meta.tableNameUC} ${meta.tableAlias}
        <where>
            <#list meta.pkCols as col>
                <#if col.colType == "String">
            <if test="${col.fieldName} != null and ${col.fieldName}.length() != 0">
                <#else>
            <if test="${col.fieldName} != null">
                </#if>
                AND ${meta.tableAlias}.${col.colName} != ${r'#{' + col.fieldName + '}'}
            </if>
            </#list>
            <#list meta.cols as col><#if !(col.pkFlag)>
                <#if col.colType == "String">
            <if test="${col.fieldName} != null and ${col.fieldName}.length() != 0">
                <#else>
            <if test="${col.fieldName} != null">
                </#if>
                AND ${meta.tableAlias}.${col.colName} = ${r'#{' + col.fieldName + '}'}
            </if>
            </#if></#list>
        </where>
    </select>

</mapper>
