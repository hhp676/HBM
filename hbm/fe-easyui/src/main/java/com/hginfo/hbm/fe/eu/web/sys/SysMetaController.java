package com.hginfo.hbm.fe.eu.web.sys;

import com.hginfo.hbm.base.entity.sys.SysMetaConstraintDef;
import com.hginfo.hbm.base.entity.sys.SysMetaConstraintDetail;
import com.hginfo.hbm.base.entity.sys.SysMetadataEntity;
import com.hginfo.hbm.base.entity.sys.SysMetadataField;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysMetaConstraintDefService;
import com.hginfo.hbm.base.service.sys.SysMetaConstraintDetailService;
import com.hginfo.hbm.base.service.sys.SysMetadataEntityService;
import com.hginfo.hbm.base.service.sys.SysMetadataFieldService;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hbm.fe.eu.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hvalidate.annotation.HValidated;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import static com.hginfo.hbm.fe.eu.web.sys.ControllerConstants.DEFAULT_SUCCESS_RESULT;

/**
 * Created by qiujingde on 2017/5/8.<br />
 * 元数据管理。
 *
 * @author qiujingde
 * @since 3.0.2-beta
 */
@Controller()
@RequestMapping("/sys/meta")
public class SysMetaController {

    /**
     * 实体Service。
     */
    private SysMetadataEntityService entityService;

    /**
     * 实体字段Service.
     */
    private SysMetadataFieldService fieldService;

    /**
     * 约束定义Service。
     */
    private SysMetaConstraintDefService defService;

    /**
     * 约束字段Service。
     */
    private SysMetaConstraintDetailService detailService;

    /**
     * 约束管理列表页。
     * @return 列表页ViewId
     */
    @RequestMapping("constraint")
    public String constraintView() {
        return "/sys/metadata/constraint_view";
    }

    /**
     * 约束字段列表。
     * @return view id
     */
    @RequestMapping("constraintDefView")
    public String constraintDefView() {
        return "/sys/metadata/constraint_def_view";
    }

    /**
     * 约束字段列表。
     * @return view id
     */
    @RequestMapping("constraintDetailView")
    public String constraintDetailView() {
        return "/sys/metadata/constraint_detail_view";
    }

    /**
     * 关于本条。
     * @param def    约束定义
     * @param model  model
     * @return viewId
     */
    @RequestMapping("aboutDef")
    public String aboutDef(SysMetaConstraintDef def, Model model) {
        model.addAttribute("biz", defService.get(def.getId()));
        return "/sys/biz_about";
    }

    /**
     * 关于本条。
     * @param detail    约束字段
     * @param model  model
     * @return viewId
     */
    @RequestMapping("aboutDetail")
    public String aboutDetail(SysMetaConstraintDetail detail, Model model) {
        model.addAttribute("biz", detailService.get(detail.getId()));
        return "/sys/biz_about";
    }

    /**
     * 分页查询约束定义列表数据。
     * @param pageInfo 分页信息
     * @param filter filter
     * @return 分页数据
     */
    @RequestMapping("constraintList")
    @ResponseBody
    public Page<SysMetaConstraintDef> constraintList(BasePage<SysMetaConstraintDef> pageInfo,
                                                     SysMetaConstraintDef filter) {
        pageInfo.parseFilterRules(filter);
        pageInfo.parseSortRule(filter);
        return new Page<>(defService.getPageList(pageInfo, filter, "metaEntity"));
    }


    /**
     * 添加约束定义.
     * @param def 约束定义实体
     * @return 操作结果
     */
    @RequestMapping("addDef")
    @ResponseBody
    @UserLog(code = "addDef", name = "添加约束定义", engName = "addDef")
    public OperationResult addDef(@HValidated SysMetaConstraintDef def) {
        defService.add(def);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
     * 修改约束定义.
     * @param def 约束定义实体
     * @return 操作结果
     */
    @RequestMapping("updateDef")
    @ResponseBody
    @UserLog(code = "updateDef", name = "修改约束定义", engName = "updateDef")
    public OperationResult updateDef(@HValidated SysMetaConstraintDef def) {
        defService.update(def);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
     * 删除。
     * @param defId defId
     * @return 操作结果
     */
    @RequestMapping(value = "/delDef")
    @ResponseBody
    @UserLog(code = "delDef", name = "删除约束定义", engName = "delDef")
    public OperationResult delDef(long defId) {
        defService.delete(defId);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
     * 获取实体。
     * @param entityId entity id
     * @return 对应实体
     */
    @RequestMapping("getEntity/{entityId}")
    @ResponseBody
    public SysMetadataEntity getEntity(@PathVariable Long entityId) {
        return entityService.get(entityId);
    }

    /**
     * 获取所有约束定义。
     * @return list
     */
    @RequestMapping("getDefList")
    @ResponseBody
    public List<SysMetaConstraintDef> getAllDef() {
        return defService.getList(new SysMetaConstraintDef());
    }

    /**
     * 获取约束定义。
     * @param defId def id
     * @return 约束定义
     */
    @RequestMapping("getDef/{defId}")
    @ResponseBody
    public SysMetaConstraintDef getDef(@PathVariable Long defId) {
        return defService.get(defId);
    }



    /**
     *
     * @param pageInfo page info
     * @param defId def id
     * @return page
     */
    @RequestMapping("constraintDetailList/{defId}")
    @ResponseBody
    public Page<SysMetaConstraintDetail> constraintDetailList(
            BasePage<SysMetaConstraintDetail> pageInfo,
            @PathVariable Long defId) {
        SysMetaConstraintDetail filter = new SysMetaConstraintDetail();
        pageInfo.parseSortRule(filter);
        pageInfo.parseFilterRules(filter);

        filter.setDefId(defId);
        return new Page<>(detailService.getPageList(pageInfo, filter, "field"));
    }

    /**
     *
     * @param fieldId field id
     * @return field
     */
    @RequestMapping("getField/{fieldId}")
    @ResponseBody
    public SysMetadataField getField(@PathVariable Long fieldId) {
        return fieldService.get(fieldId);
    }

    /**
     *
     * @param entityId entity id
     * @return list
     */
    @RequestMapping("getFieldList/{entityId}")
    @ResponseBody
    public List<SysMetadataField> getFieldList(@PathVariable Long entityId) {
        SysMetadataField filter = new SysMetadataField();
        filter.setEntityId(entityId);

        return fieldService.getList(filter);
    }

    /**
     * 添加约束字段.
     * @param detail 约束字段
     * @return 操作结果
     */
    @RequestMapping("addDetail")
    @ResponseBody
    @UserLog(code = "addDetail", name = "添加约束字段", engName = "addDetail")
    public OperationResult addDetail(@HValidated SysMetaConstraintDetail detail) {
        detailService.add(detail);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
     * 修改约束字段.
     * @param detail 约束字段
     * @return 操作结果
     */
    @RequestMapping("updateDetail")
    @ResponseBody
    @UserLog(code = "updateDetail", name = "修改约束字段", engName = "updateDetail")
    public OperationResult updateDetail(@HValidated SysMetaConstraintDetail detail) {
        detailService.update(detail);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
     * 删除约束字段.
     * @param detailId 约束字段id
     * @return 操作结果
     */
    @RequestMapping("delDetail")
    @ResponseBody
    @UserLog(code = "delDetail", name = "删除约束字段", engName = "delDetail")
    public OperationResult delDetail(long detailId) {
        detailService.delete(detailId);
        return DEFAULT_SUCCESS_RESULT;
    }

    @HReference
    public void setEntityService(SysMetadataEntityService entityService) {
        this.entityService = entityService;
    }

    @HReference
    public void setDefService(SysMetaConstraintDefService defService) {
        this.defService = defService;
    }

    @HReference
    public void setDetailService(SysMetaConstraintDetailService detailService) {
        this.detailService = detailService;
    }

    @HReference
    public void setFieldService(SysMetadataFieldService fieldService) {
        this.fieldService = fieldService;
    }
}
