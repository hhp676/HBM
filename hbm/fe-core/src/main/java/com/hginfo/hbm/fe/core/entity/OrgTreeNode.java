package com.hginfo.hbm.fe.core.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hginfo.hbm.base.entity.sys.SysGroup;
import com.hginfo.hbm.base.entity.sys.SysOrganization;
import com.hginfo.hbm.base.entity.sys.SysPosition;

/**
 * 组织树节点。<br />
 * Created by qiujingde on 2016/12/22.
 * @author qiujingde
 */
public final class OrgTreeNode implements Serializable {
    private static final long                 serialVersionUID = -5575624645583212398L;
    
    /**
     *
     */
    public static final int                   ORG_TYPE         = 1;
    /**
     *
     */
    public static final int                   POSITION_TYPE    = 2;
    /**
     *
     */
    public static final int                   GROUP_TYPE       = 3;
    
    /**
     *
     */
    private static final Map<Integer, String> ICON_MAP         = new HashMap<>();
    static {
        ICON_MAP.put(ORG_TYPE, "icon_organization");
        ICON_MAP.put(POSITION_TYPE, "icon_position");
        ICON_MAP.put(GROUP_TYPE, "icon_group");
    }
    
    /**
     * 防止从外部被初始化。
     */
    private OrgTreeNode() {
    }
    
    /**
     * 节点类型：组织，岗位，小组。
     */
    private Integer           nodeType;
    /**
     *
     */
    private String            nodeId;
    /**
     *
     */
    private Long              baseId;
    /**
     *
     */
    private String            name;
    /**
     *
     */
    private String            code;
    /**
     *
     */
    private String            engName;
    /**
     *
     */
    private String            i18nCode;
    
    /**
     *
     */
    private List<OrgTreeNode> children = new ArrayList<>();
    
    /**
     * 子节点是否已排序。
     */
    private boolean           sortChildren;
    
    /**
     * 将对应的实体转换为OrgTreeNode。
     * @param org 实体
     * @return node
     */
    public static OrgTreeNode parse(SysOrganization org) {
        OrgTreeNode node = new OrgTreeNode();
        node.nodeType = ORG_TYPE;
        node.nodeId = "o_" + org.getId();
        node.baseId = org.getId();
        node.name = org.getOrgName();
        node.code = org.getOrgCode();
        node.engName = org.getEngName();
        node.i18nCode = org.getI18nCode();
        return node;
    }
    
    /**
     * 将对应的实体转换为OrgTreeNode。
     * @param pos 实体
     * @return node
     */
    public static OrgTreeNode parse(SysPosition pos) {
        OrgTreeNode node = new OrgTreeNode();
        node.nodeType = POSITION_TYPE;
        node.nodeId = "p_" + pos.getId();
        node.baseId = pos.getId();
        node.name = pos.getPositionName();
        node.code = pos.getPositionCode();
        node.engName = pos.getEngName();
        node.i18nCode = pos.getI18nCode();
        return node;
    }
    
    /**
     * 将对应的实体转换为OrgTreeNode。
     * @param group 实体
     * @return node
     */
    public static OrgTreeNode parse(SysGroup group) {
        OrgTreeNode node = new OrgTreeNode();
        node.nodeType = GROUP_TYPE;
        node.nodeId = "g_" + group.getId();
        node.baseId = group.getId();
        node.name = group.getGroupName();
        node.code = group.getGroupCode();
        node.engName = group.getEngName();
        node.i18nCode = group.getI18nCode();
        return node;
    }
    
    public int getNodeSize() {
        return 1 + children.stream().mapToInt(OrgTreeNode::getNodeSize).sum();
    }
    
    /**
     * 添加子节点。
     * @param child 子节点
     */
    public void addChild(OrgTreeNode child) {
        children.add(child);
    }
    
    public Integer getNodeType() {
        return nodeType;
    }
    
    public String getNodeId() {
        return nodeId;
    }
    
    public Long getBaseId() {
        return baseId;
    }
    
    public String getName() {
        return name;
    }
    
    public String getCode() {
        return code;
    }
    
    public String getEngName() {
        return engName;
    }
    
    public String getI18nCode() {
        return i18nCode;
    }
    
    public void setNodeType(Integer nodeType) {
        this.nodeType = nodeType;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    
    public void setEngName(String engName) {
        this.engName = engName;
    }
    
    public void setI18nCode(String i18nCode) {
        this.i18nCode = i18nCode;
    }
    
    public String getIconCls() {
        return ICON_MAP.get(nodeType);
    }
    
    /**
     * 按照部门，小组，岗位排序。
     * @return children
     */
    public List<OrgTreeNode> getChildren() {
        if (!sortChildren) {
            children.sort(Comparator.comparingInt(OrgTreeNode::getNodeType));
        }
        return children;
    }
}
