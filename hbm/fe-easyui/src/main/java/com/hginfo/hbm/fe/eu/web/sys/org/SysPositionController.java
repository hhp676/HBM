package com.hginfo.hbm.fe.eu.web.sys.org;

import static com.hginfo.hbm.fe.eu.web.sys.ControllerConstants.DEFAULT_SUCCESS_RESULT;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysOrganization;
import com.hginfo.hbm.base.entity.sys.SysPosition;
import com.hginfo.hbm.base.entity.sys.SysUserPosition;
import com.hginfo.hbm.base.page.BasePage;
import com.hginfo.hbm.base.service.sys.SysOrganizationService;
import com.hginfo.hbm.base.service.sys.SysPositionService;
import com.hginfo.hbm.base.service.sys.SysUserPositionService;
import com.hginfo.hbm.fe.core.entity.ComboTreeModel;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hbm.fe.eu.op.OperationResult;
import com.hginfo.hbm.fe.eu.page.Page;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * 岗位controller。
 * Created by qiujingde on 2016/12/24.
 * @author qiujingde
 */
@Controller
@RequestMapping("/sys/org")
public class SysPositionController {

    /**
     *
     */
    private SysPositionService posService;

    /**
     *
     */
    private SysOrganizationService orgService;
    
    /**
    *
    */
   private SysUserPositionService sysUserPositionService;

    /**
     *
     * @param model model
     * @param fId  fId
     * @return viewId
     */
    @RequestMapping("newPos/{fId}")
    public String newPosition(Model model, @PathVariable String fId) {
        SysPosition pos = new SysPosition();

        long parentId = Long.parseLong(fId.split("_")[1]);
        SysPosition parent;
        SysOrganization org;
        if (fId.startsWith("p_")) {
            parent = posService.getById(parentId);
            org = parent.getSysOrganization();
        } else {
            parent = new SysPosition();
            org = orgService.getById(parentId);
        }
        pos.setParent(parent);
        pos.setSysOrganization(org);
        pos.setFid(parent.getId());
        pos.setOrgId(org.getId());

        model.addAttribute("pos", pos);
        model.addAttribute("formUrl", "sys/org/addPos");
        return "sys/org/sysPos_edit";
    }

    /**
     *
     * @param model model
     * @param posId position id
     * @return viewId
     */
    @RequestMapping("editPos/{posId}")
    public String editPosition(Model model, @PathVariable long posId) {
        model.addAttribute("pos", posService.getById(posId));
        model.addAttribute("formUrl", "sys/org/updPos");
        return "sys/org/sysPos_edit";
    }

    /**
     *
     * @param model model
     * @param posId position id
     * @return viewId
     */
    @RequestMapping("aboutPos/{posId}")
    public String aboutPosition(Model model, @PathVariable long posId) {
        model.addAttribute("biz", posService.getById(posId));
        return "sys/biz_about";
    }

    /**
     *
     * @param model model
     * @param orgId org id
     * @return viewId
     */
    @RequestMapping("posView/{orgId}")
    public String view(Model model, @PathVariable long orgId) {
        model.addAttribute("fetchUrl", "sys/org/posList/" + orgId);
        return "sys/org/sysPos_view";
    }

    /**
     *
     * @param pos pos
     * @return 操作结果
     */
    @RequestMapping("addPos")
    @ResponseBody
    @UserLog(code = "addPosition", name = "新增岗位", engName = "addPosition")
    public OperationResult addPosition(@HValidated SysPosition pos) {
        posService.createPosition(pos);
        return DEFAULT_SUCCESS_RESULT;
    }
    
    /**
     * 获取岗位树. <br/>
     * @author yinyanzhen
     * @param currPosID 当前节点id,拼装树时,当前节点向下将被忽略掉
     * @param currOrgID 岗位所属组织id
     * @return List<ComboTreeModel>
     * @since V1.0.0
     */
    @RequestMapping("/getPosTree")
    @ResponseBody
    public List<ComboTreeModel> getPosTree(Long currOrgID, Long currPosID) {
        //获取根节点
        List<ComboTreeModel> modelTreeList = new ArrayList<ComboTreeModel>();
        //未指明组织ID时,不进行组织下岗位树查询
        if (currOrgID == null) {
            return modelTreeList;
        }
        SysPosition sysPos = new SysPosition();
        sysPos.setIsDelete(0);
        sysPos.setOrgId(currOrgID);
        sysPos.setOrderStr("sp.POSITION_ID_");
        List<SysPosition> posList = posService.getList(sysPos);
        for (SysPosition pos:posList) {
            if (currPosID != null && pos.getId().equals(currPosID)) {
                continue;
            }
            if (pos.getFid() == null) {
                ComboTreeModel treeModel = new ComboTreeModel(); 
                treeModel.setId(pos.getId());
                treeModel.setText(pos.getPositionName());
                //设置子节点
                treeModel.setChildren(getSubPosList(currPosID, treeModel.getId(), posList));
                modelTreeList.add(treeModel);
            }
        }
        return modelTreeList;
    }
    
    /**
     * getSubPosList:(获取子节点,递归向下). <br/>
     * @author yinyanzhen
     * @param currPosID 当前节点id,拼装树时,当前节点向下将被忽略掉
     * @param fID 父节点id
     * @param posList 岗位List
     * @return List<ComboTreeModel>
     * @since V1.0.0
     */
    private List<ComboTreeModel> getSubPosList(Long currPosID, Long fID, List<SysPosition> posList) {
        List<ComboTreeModel> list = new ArrayList<ComboTreeModel>();
        for (SysPosition pos : posList) {
            if (currPosID != null && pos.getId().equals(currPosID)) {
                continue;
            }
            if (pos.getFid() != null && fID.equals(pos.getFid())) {
                ComboTreeModel treeModel = new ComboTreeModel();
                treeModel.setId(pos.getId());
                treeModel.setText(pos.getPositionName());
                //设置子节点
                treeModel.setChildren(getSubPosList(currPosID, treeModel.getId(), posList));
                list.add(treeModel);
            }
        }
        return list;
    }

    /**
     *
     * @param pos pos
     * @return 操作结果
     */
    @RequestMapping("updPos")
    @ResponseBody
    @UserLog(code = "updatePosition", name = "修改岗位", engName = "updatePosition")
    public OperationResult updatePosition(@HValidated SysPosition pos) {
        posService.editPosition(pos);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
     *
     * @param posId posId
     * @return 操作结果
     */
    @RequestMapping("delPos/{posId}")
    @ResponseBody
    @UserLog(code = "deletePosition", name = "删除岗位", engName = "deletePosition")
    public OperationResult deletePosition(@PathVariable long posId) {
        posService.deletePosition(posId);
        return DEFAULT_SUCCESS_RESULT;
    }

    /**
     *
     * @param filter 过滤条件
     * @param basePage page info
     * @param orgId org id
     * @return page result
     */
    @RequestMapping("posList/{orgId}")
    @ResponseBody
    public Page<SysPosition> posList(SysPosition filter, BasePage<SysPosition> basePage, @PathVariable long orgId) {
        filter.setOrgId(orgId);

        basePage.parseFilterRules(filter);
        basePage.parseSortRule(filter);

        return new Page<>(posService.getPageList(basePage, filter));
    }
    
    /**
     * 岗位选择弹窗。
     * @return page
     * @since V1.0.0
     */
    @RequestMapping("chooseSysPositionView")
    public String chooseSysPositionView() {
        return "sys/org/chooseSysPosition_view";
    }
    
    /**
     * 更新岗位数据。
     * @param filter filter
     * @return data
     * @since V1.0.0
     */
    @RequestMapping("updateUserPosition")
    @ResponseBody
    @UserLog(code = "updateUserPosition", name = "更新用户岗位对应", engName = "updateUserPosition")
    public OperationResult updateUserPosition(SysUserPosition filter) {
        sysUserPositionService.doRefresh(filter.getUserId(), filter.getPositionIds());
        return DEFAULT_SUCCESS_RESULT;
    }
    
    @HReference
    public void setSysUserPositionService(SysUserPositionService sysUserPositionService) {
        this.sysUserPositionService = sysUserPositionService;
    }

    @HReference
    public void setPosService(SysPositionService posService) {
        this.posService = posService;
    }

    @HReference
    public void setOrgService(SysOrganizationService orgService) {
        this.orgService = orgService;
    }
}
