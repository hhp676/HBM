package com.hginfo.hbm.fe.bs.web.sys.org;

import static com.hginfo.hbm.fe.core.entity.OrgTreeNode.GROUP_TYPE;
import static com.hginfo.hbm.fe.core.entity.OrgTreeNode.ORG_TYPE;
import static com.hginfo.hbm.fe.core.entity.OrgTreeNode.POSITION_TYPE;
import static com.hginfo.hbm.fe.core.entity.OrgTreeNode.parse;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hginfo.hbm.base.entity.sys.SysGroup;
import com.hginfo.hbm.base.entity.sys.SysOrganization;
import com.hginfo.hbm.base.entity.sys.SysPosition;
import com.hginfo.hbm.base.service.sys.SysGroupService;
import com.hginfo.hbm.base.service.sys.SysOrganizationService;
import com.hginfo.hbm.base.service.sys.SysPositionService;
import com.hginfo.hbm.fe.bs.op.OperationResult;
import com.hginfo.hbm.fe.bs.page.Page;
import com.hginfo.hbm.fe.core.entity.ComboTreeModel;
import com.hginfo.hbm.fe.core.entity.OrgTreeNode;
import com.hginfo.hbm.fe.core.log.UserLog;
import com.hginfo.hdubbo.annotation.HReference;
import com.hginfo.hvalidate.annotation.HValidated;

/**
 * 组织岗位。<br />
 * Created by qiujingde on 2016/12/22.
 */
@Controller
@RequestMapping("/sys/org")
public class SysOrganizationController {
    
    /**
     *
     */
    private SysOrganizationService orgService;
    
    /**
     *
     */
    private SysPositionService     posService;
    
    /**
     *
     */
    private SysGroupService        groupService;
    
    /**
     *
     * @return viewId
     */
    @RequestMapping("view")
    public String showSysOrg() {
        return "sys/org/sysOrg_view";
    }
    
    /**
     *
     * @return viewId
     */
    @RequestMapping("jobManage")
    public String showSysJob() {
        return "sys/org/sysJob_view";
    }
    
    /**
     *
     * @param model model
     * @param fid  fid
     * @return viewId
     */
    @RequestMapping("newOrg/{fid}")
    public String newOrg(Model model, @PathVariable long fid) {
        SysOrganization org = new SysOrganization();
        SysOrganization parent = orgService.getById(fid);
        org.setParent(parent);
        org.setFid(parent.getId());
        
        model.addAttribute("org", org);
        model.addAttribute("formUrl", "sys/org/addOrg");
        return "sys/org/sysOrg_edit";
    }
    
    /**
     *
     * @param model model
     * @param orgId organization id
     * @return viewId
     */
    @RequestMapping("editOrg/{orgId}")
    public String editOrg(Model model, @PathVariable long orgId) {
        model.addAttribute("org", orgService.getById(orgId));
        model.addAttribute("formUrl", "sys/org/updOrg");
        return "sys/org/sysOrg_edit";
    }

    /**
     * getSysOrganization:(id获取部门信息). <br/>
     * @author yinyanzhen
     * @param orgCode orgCode
     * @return SysOrganization
     * @since V1.0.0
     */
    @RequestMapping("/getSysOrganization")
    @ResponseBody
    public SysOrganization getSysOrganization(String orgCode) {
        SysOrganization filter = new SysOrganization();
        filter.setIsDelete(0);
        filter.setOrgCode(orgCode);
        List<SysOrganization> list = orgService.getList(filter);
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }
    
    /**
     *
     * @param model model
     * @param orgId organization id
     * @return viewId
     */
    @RequestMapping("aboutOrg/{orgId}")
    public String aboutOrg(Model model, @PathVariable long orgId) {
        model.addAttribute("biz", orgService.getById(orgId));
        return "sys/biz_about";
    }
    
    /**
     * 获取组织树数据。
     * @param filter 过滤条件。
     * @return 组织树。
     */
    @RequestMapping("orgTree")
    @ResponseBody
    public Page<OrgTreeNode> getOrgTree(OrgTreeNode filter) {
        OrgTreeNode root = getRootOrg();
        
        populateRoot(root, filter);
        
        Page<OrgTreeNode> page = new Page<>();
        page.setRows(Collections.singletonList(root));
        page.setTotal(root.getNodeSize());
        
        return page;
    }
    
    /**
     * 获取组织树. <br/>
     * @author yinyanzhen
     * @param currOrgID 当前节点id,拼装树时,当前节点向下将被忽略掉
     * @return List<ComboTreeModel>
     * @since V1.0.0
     */
    @RequestMapping("/getOrgTree")
    @ResponseBody
    public List<ComboTreeModel> getModelTree(Long currOrgID) {
        SysOrganization sysOrg = new SysOrganization();
        sysOrg.setIsDelete(0);
        sysOrg.setOrderStr("so.ORG_ID_");
        List<SysOrganization> orgList = orgService.getList(sysOrg);
        //获取根节点
        List<ComboTreeModel> modelTreeList = new ArrayList<ComboTreeModel>();
        for (SysOrganization org : orgList) {
            if (currOrgID != null && org.getId().equals(currOrgID)) {
                continue;
            }
            if (org.getFid() == null) {
                ComboTreeModel treeModel = new ComboTreeModel();
                treeModel.setId(org.getId());
                treeModel.setText(org.getOrgName());
                treeModel.setCode(org.getOrgCode());
                //设置子节点
                treeModel.setChildren(getSubOrgList(currOrgID, treeModel.getId(), orgList));
                modelTreeList.add(treeModel);
            }
        }
        return modelTreeList;
    }
    
    /**
     * getSubOrgList:(获取子节点,递归向下). <br/>
     * @author yinyanzhen
     * @param currOrgID 当前节点id,拼装树时,当前节点向下将被忽略掉
     * @param fID 父节点id
     * @param orgList 部门List
     * @return List<ComboTreeModel>
     * @since V1.0.0
     */
    private List<ComboTreeModel> getSubOrgList(Long currOrgID, Long fID,
        List<SysOrganization> orgList) {
        List<ComboTreeModel> list = new ArrayList<ComboTreeModel>();
        for (SysOrganization org : orgList) {
            if (currOrgID != null && org.getId().equals(currOrgID)) {
                continue;
            }
            if (org.getFid() != null && fID.equals(org.getFid())) {
                ComboTreeModel treeModel = new ComboTreeModel();
                treeModel.setId(org.getId());
                treeModel.setText(org.getOrgName());
                treeModel.setCode(org.getOrgCode());
                //设置子节点
                treeModel.setChildren(getSubOrgList(currOrgID, treeModel.getId(), orgList));
                list.add(treeModel);
            }
        }
        return list;
    }
    
    /**
     *
     * @param org org
     * @return 操作结果
     */
    @RequestMapping("addOrg")
    @ResponseBody
    @UserLog(code = "addOrg", name = "新增组织", engName = "addOrg")
    public OperationResult addOrg(@HValidated SysOrganization org) {
        orgService.createOrganization(org);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     *
     * @param org org
     * @return 操作结果
     */
    @RequestMapping("updOrg")
    @ResponseBody
    @UserLog(code = "updOrg", name = "修改组织", engName = "updOrg")
    public OperationResult updateOrganization(@HValidated SysOrganization org) {
        orgService.editOrganization(org);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     *
     * @param orgId orgId
     * @return 操作结果
     */
    @RequestMapping("delOrg/{orgId}")
    @ResponseBody
    @UserLog(code = "delOrg", name = "删除组织", engName = "delOrg")
    public OperationResult deletePosition(@PathVariable long orgId) {
        orgService.deleteOrganization(orgId);
        return OperationResult.DEFAULT_SUCCESS;
    }
    
    /**
     * 获取根节点，并递归获取所有子节点。
     * @return 根节点
     */
    private OrgTreeNode getRootOrg() {
        SysOrganization root = orgService.getRoot();
        return OrgTreeNode.parse(root);
    }
    
    /**
     * 获取子节点。<br />
     * 实现步骤：<br />
     *    1.把根节点放入关系处理器。
     *    2.获取所有有效的组织，岗位和小组，放入关系处理器。
     *    3.在处理器分析所有有效的组织，岗位和小组。
     * @param root 当前节点
     * @param filter filter
     */
    private void populateRoot(OrgTreeNode root, OrgTreeNode filter) {
        NodeLinker linker = new NodeLinker(orgService, posService);
        linker.put(root);
        
        List<SysOrganization> orgList = getOrgList(filter);
        orgList.stream().map(OrgTreeNode::parse).forEach(linker::put);
        List<SysGroup> groupList = getGroupList(filter);
        groupList.stream().map(OrgTreeNode::parse).forEach(linker::put);
        List<SysPosition> posList = getPosList(filter);
        posList.stream().map(OrgTreeNode::parse).forEach(linker::put);
        
        orgList.forEach(linker::linkParent);
        groupList.forEach(linker::linkParent);
        posList.forEach(linker::linkParent);
    }
    
    /**
     *
     * @param filter filter
     * @return org list
     */
    @SuppressWarnings("unchecked")
    private List<SysOrganization> getOrgList(OrgTreeNode filter) {
        if (filter.getNodeType() != null && filter.getNodeType() != ORG_TYPE) {
            return Collections.EMPTY_LIST;
        }
        SysOrganization orgFilter = new SysOrganization();
        orgFilter.setOrgName(filter.getName());
        orgFilter.setOrgCode(filter.getCode());
        orgFilter.setEngName(filter.getEngName());
        orgFilter.setI18nCode(filter.getI18nCode());
        
        return orgService.getList(orgFilter);
    }
    
    /**
     *
     * @param filter filter
     * @return group list
     */
    @SuppressWarnings("unchecked")
    private List<SysGroup> getGroupList(OrgTreeNode filter) {
        if (filter.getNodeType() != null && filter.getNodeType() != GROUP_TYPE) {
            return Collections.EMPTY_LIST;
        }
        SysGroup groupFilter = new SysGroup();
        groupFilter.setGroupName(filter.getName());
        groupFilter.setGroupCode(filter.getCode());
        groupFilter.setEngName(filter.getEngName());
        groupFilter.setI18nCode(filter.getI18nCode());
        
        return groupService.getList(groupFilter);
    }
    
    /**
     *
     * @param filter filter
     * @return position list
     */
    @SuppressWarnings("unchecked")
    private List<SysPosition> getPosList(OrgTreeNode filter) {
        if (filter.getNodeType() != null && filter.getNodeType() != POSITION_TYPE) {
            return Collections.EMPTY_LIST;
        }
        SysPosition posFilter = new SysPosition();
        posFilter.setPositionName(filter.getName());
        posFilter.setPositionCode(filter.getCode());
        posFilter.setEngName(filter.getEngName());
        posFilter.setI18nCode(filter.getI18nCode());
        
        return posService.getList(posFilter);
    }
    
    /**
     * NodeCache用来建立各节点之间的父子关系。
     */
    private static final class NodeLinker {
        
        /**
         *
         */
        private final SysOrganizationService orgService;
        
        /**
         *
         */
        private final SysPositionService     posService;
        
        /**
         *
         * @param orgService      orgService
         * @param posService      posService
         */
        private NodeLinker(SysOrganizationService orgService, SysPositionService posService) {
            this.orgService = orgService;
            this.posService = posService;
        }
        
        /**
         * node缓存map。
         */
        private Map<Long, OrgTreeNode> nodeMap = new HashMap<>();
        
        /**
         * 保存到nodeMap。
         * @param node node
         */
        private void put(OrgTreeNode node) {
            nodeMap.putIfAbsent(node.getBaseId(), node);
        }
        
        /**
         * 关联组织的父级节点。
         * @param org 组织
         */
        private void linkParent(SysOrganization org) {
            nodeMap.putIfAbsent(org.getId(), parse(org));
            linkParent(fetchOrg(org.getFid()), nodeMap.get(org.getId()));
        }
        
        /**
         * 关联小组的父级节点。
         * @param group 小组
         */
        private void linkParent(SysGroup group) {
            nodeMap.putIfAbsent(group.getId(), parse(group));
            linkParent(fetchOrg(group.getOrgId()), nodeMap.get(group.getId()));
        }
        
        /**
         * 关联岗位的父级节点。
         * @param pos 岗位
         */
        private void linkParent(SysPosition pos) {
            nodeMap.putIfAbsent(pos.getId(), parse(pos));
            linkParent(pos.getFid() != null ? fetchPos(pos.getFid())
                : fetchOrg(pos.getOrgId()), nodeMap.get(pos.getId()));
        }
        
        /**
         * 获取id对应的组织Node。
         * @param id   id
         * @return treeNode
         */
        private OrgTreeNode fetchOrg(Long id) {
            if (id == null) {
                return null;
            }
            OrgTreeNode node = nodeMap.get(id);
            if (node == null) {
                SysOrganization org = orgService.getById(id);
                if (org.getIsDelete() == 0) {
                    linkParent(org);
                }
            }
            return nodeMap.get(id);
        }
        
        /**
         * 获取id对应的岗位Node。
         * @param id   id
         * @return treeNode
         */
        private OrgTreeNode fetchPos(long id) {
            OrgTreeNode node = nodeMap.get(id);
            if (node == null) {
                SysPosition pos = posService.getById(id);
                if (pos.getIsDelete() == 0) {
                    linkParent(pos);
                }
            }
            return nodeMap.get(id);
        }
        
        /**
         * 关联父级节点与子级节点。
         * @param parent  父级节点
         * @param child   子级节点
         */
        private void linkParent(OrgTreeNode parent, OrgTreeNode child) {
            if (parent != null) {
                parent.addChild(child);
            }
        }
    }
    
    @HReference
    public void setOrgService(SysOrganizationService orgService) {
        this.orgService = orgService;
    }
    
    @HReference
    public void setPosService(SysPositionService posService) {
        this.posService = posService;
    }
    
    @HReference
    public void setGroupService(SysGroupService groupService) {
        this.groupService = groupService;
    }
    
}
