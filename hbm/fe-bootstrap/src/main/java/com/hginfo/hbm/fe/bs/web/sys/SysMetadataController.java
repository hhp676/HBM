/**
 * Project Name:hbm-fe-easyui
 * File Name:SysMetadataController.java
 * Package Name:com.hginfo.hbm.fe.eu.web.sys
 * Date:2016年12月26日上午9:25:54
 * Copyright (c) 2016, hongguaninfo.com All Rights Reserved.
 *
 */
package com.hginfo.hbm.fe.bs.web.sys;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysMetadataEntity;
import com.hginfo.hbm.base.entity.sys.SysMetadataField;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysMetadataEntityService;
import com.hginfo.hbm.base.service.sys.SysMetadataFieldService;
import com.hginfo.hbm.base.vo.MetaField;
import com.hginfo.hbm.base.vo.MetaTable;
import com.hginfo.hbm.fe.bs.op.OperationResult;
import com.hginfo.hbm.fe.bs.page.Page;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * 元数据管理Controller。 <br />
 * controller 层 <br />
 * Date: 2016年12月26日上午9:25:54 <br />
 * @author shichengqun
 * @since V1.0.0
 */
@Controller
@RequestMapping("/sys/sysMetadata")
public class SysMetadataController {
    
    /**
     * 
     */
    @HReference
    private SysMetadataEntityService sysMetadataEntityService;
    
    /**
     * 
     */
    @HReference
    private SysMetadataFieldService  sysMetadataFieldService;
    
    /**
     * about.
     * @param entity entity
     * @param model model
     * @return page
     */
    @RequestMapping(value = "/aboutEntity")
    public String aboutEntity(SysMetadataEntity entity, Model model) {
        model.addAttribute("biz", sysMetadataEntityService.get(entity.getId()));
        return "/sys/biz_about";
    }
    
    /**
     * about.
     * @param field field
     * @param model model
     * @return page
     */
    @RequestMapping(value = "/aboutField")
    public String aboutField(SysMetadataField field, Model model) {
        model.addAttribute("biz", sysMetadataFieldService.get(field.getId()));
        return "/sys/biz_about";
    }
    
    /**
     * 元数据管理菜单。
     * @return 元数据管理页面
     */
    @RequestMapping(value = "/metadataView")
    public String metadataView() {
        return "sys/metadata/sysMetadata_view";
    }
    
    
    /**
     * 过滤器项-实体-页面。
     * @return 过滤器项-实体-页面
     */
    @RequestMapping(value = "/metadataEntityFilterItemView")
    public String metadataEntityFilterItemView() {
        return "sys/metadata/sysMetadataEntity_filterItem_view";
    }
    
    /**
     * 约束-实体-页面。
     * @return 约束-实体-页面
     */
    @RequestMapping(value = "/metadataEntityConstraintView")
    public String metadataEntityConstraintView() {
        return "sys/metadata/sysMetadataEntity_constraint_view";
    }
    
    
    /**
     * 分页数据。
     * @param pageInfo 分页信息
     * @return 实体分页数据。
     */
    @RequestMapping(value = "/entityList")
    @ResponseBody
    public Page<SysMetadataEntity> entityList(BasePage<SysMetadataEntity> pageInfo) {
        SysMetadataEntity filter = new SysMetadataEntity();
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysMetadataEntityService.getPageList(pageInfo, filter));
    }
    
    /**
     * 数据权限选择实体数据。
     * @param filter 条件
     * @return 实体数据
     */
    @RequestMapping(value = "/getEntityList")
    @ResponseBody
    public Page<SysMetadataEntity> getEntityList(SysMetadataEntity filter) {
        Page<SysMetadataEntity> page = new Page<>();
        List<SysMetadataEntity> entityList = sysMetadataEntityService.getList(filter);
        page.setRows(entityList);
        page.setTotal(entityList == null ? 0
            : entityList.size());
        return page;
    }
    
    /**
     * 选择表页面。
     * @return 元数据管理页面
     */
    @RequestMapping(value = "/sysMetaTableView")
    public String selMetaTableView() {
        return "sys/metadata/sysMetaTable_view";
    }
    
    /**
     * 数据库表数据。
     * @return 数据库表数据。
     */
    @RequestMapping(value = "/metaTableList")
    @ResponseBody
    public Page<MetaTable> metaTableList() {
        Page<MetaTable> page = new Page<>();
        List<MetaTable> tableList = sysMetadataEntityService.getMetaTables();
        page.setRows(tableList);
        page.setTotal(tableList == null ? 0
            : tableList.size());
        return page;
    }
    
    /**
     * 数据库表数据。
     * @param tableName 表名
     * @return 数据库表数据。
     */
    @RequestMapping(value = "/metaFieldList/{tableName}")
    @ResponseBody
    public List<MetaField> metaTableList(@PathVariable String tableName) {
        return sysMetadataEntityService.getMetaFieldsByTable(tableName);
    }
    
    /**
     * 新增。
     * @param entity entity
     * @return 操作结果
     */
    @RequestMapping(value = "/addEntity")
    @ResponseBody
    @UserLog(code = "addEntity", name = "新增实体", engName = "addEntity")
    public OperationResult addEntity(@HValidated SysMetadataEntity entity) {
        sysMetadataEntityService.add(entity);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 修改。
     * @param entity entity
     * @return 操作结果
     */
    @RequestMapping(value = "/updateEntity")
    @ResponseBody
    @UserLog(code = "updateEntity", name = "修改实体", engName = "updateEntity")
    public OperationResult updateEntity(@HValidated SysMetadataEntity entity) {
        sysMetadataEntityService.update(entity);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 删除。
     * @param entityId entityId
     * @return 操作结果
     */
    @RequestMapping(value = "/deleteEntity")
    @ResponseBody
    @UserLog(code = "deleteEntity", name = "删除实体", engName = "deleteEntity")
    public OperationResult deleteEntity(long entityId) {
        sysMetadataEntityService.delete(entityId);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 字段管理菜单。
     * @return 元数据管理页面
     */
    @RequestMapping(value = "/metadataFieldView")
    public String metadataFieldView() {
        return "sys/metadata/sysMetadataField_view";
    }
    
    
    /**
     * 过滤器项-字段-页面。
     * @return 过滤器项-字段-页面
     */
    @RequestMapping(value = "/metadataFieldFilterItemView")
    public String metadataFieldFilterItemView() {
        return "sys/metadata/sysMetadataField_filterItem_view";
    }
    
    /**
     * 约束-字段-页面。
     * @return 约束-字段-页面
     */
    @RequestMapping(value = "/metadataFieldConstraintView")
    public String metadataFieldConstraintView() {
        return "sys/metadata/sysMetadataField_constraint_view";
    }
    
    
    /**
     * 分页数据。
     * @param entityId 
     * @param pageInfo 分页信息
     * @return 字段分页数据。
     */
    @RequestMapping(value = "/fieldList/{entityId}")
    @ResponseBody
    public Page<SysMetadataField> fieldList(@PathVariable long entityId,
        BasePage<SysMetadataField> pageInfo) {
        SysMetadataField filter = new SysMetadataField();
        filter.setEntityId(entityId);
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(sysMetadataFieldService.getPageList(pageInfo, filter));
    }
    
    /**
     * 字段数据。
     * @param entityId 实体id
     * @param filterTypeId 过滤类型id
     * @return 字段数据。
     */
    @RequestMapping(value = "/getFieldList/{entityId}/{filterTypeId}")
    @ResponseBody
    public List<SysMetadataField> getFieldList(@PathVariable long entityId,
        @PathVariable long filterTypeId) {
        SysMetadataField filter = new SysMetadataField();
        filter.setEntityId(entityId);
        filter.setFilterTypeId(filterTypeId);
        return sysMetadataFieldService.getList(filter);
    }
    
    /**
     * 新增。
     * @param field field
     * @return 操作结果
     */
    @RequestMapping(value = "/addField")
    @ResponseBody
    @UserLog(code = "addField", name = "新增字段", engName = "addField")
    public OperationResult addField(@HValidated SysMetadataField field) {
        sysMetadataFieldService.add(field);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 修改。
     * @param field field
     * @return 操作结果
     */
    @RequestMapping(value = "/updateField")
    @ResponseBody
    @UserLog(code = "updateField", name = "修改字段", engName = "updateField")
    public OperationResult updateField(@HValidated SysMetadataField field) {
        sysMetadataFieldService.update(field);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 删除。
     * @param fieldId fieldId
     * @return 操作结果
     */
    @RequestMapping(value = "/deleteField")
    @ResponseBody
    @UserLog(code = "deleteField", name = "删除字段", engName = "deleteField")
    public OperationResult deleteField(long fieldId) {
        sysMetadataFieldService.delete(fieldId);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
}
