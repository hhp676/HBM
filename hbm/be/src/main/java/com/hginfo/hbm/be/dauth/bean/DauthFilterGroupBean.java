package com.hginfo.hbm.be.dauth.bean;

import java.util.Arrays;
import java.util.List;

/**
 * 数据权限过滤器项，数据解析用. <br />
 * Date: 2017年02月15日 下午15:41:02 <br />
 *
 * @author shichengqun
 * @since V1.0.0
 */
public class DauthFilterGroupBean {

    /**
     * 过滤器组编号。
     */
    private Long filterGroupId;
    
    
    /**
     * 此过滤器组是否一定不满足数据权限。
     * true：此过滤器组一定不满足数据权限（不需sql解析直接返回 1!=1）
     * false/null：此过滤器组需要进行sql的解析
     */
    private Boolean falseFlag;
    
    /**
     * 数据权限ID。
     */
    private Long dauthId;
    
    /**
     * 过滤器组编码。
     */
    private String groupCode;
    
    /**
     * 过滤器组名称。
     */
    private String groupName;
    
    /**
     * 过滤器项。
     */
    private List<DauthFilterItemBean> filterItemBeanList;
    
    

    public Long getFilterGroupId() {
        return filterGroupId;
    }

    public void setFilterGroupId(Long filterGroupId) {
        this.filterGroupId = filterGroupId;
    }

    public Long getDauthId() {
        return dauthId;
    }

    public void setDauthId(Long dauthId) {
        this.dauthId = dauthId;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
    
    public List<DauthFilterItemBean> getFilterItemBeanList() {
        return filterItemBeanList;
    }

    public void setFilterItemBeanList(List<DauthFilterItemBean> filterItemBeanList) {
        this.filterItemBeanList = filterItemBeanList;
    }

    public Boolean getFalseFlag() {
        return falseFlag;
    }

    public void setFalseFlag(Boolean falseFlag) {
        this.falseFlag = falseFlag;
    }

    @Override
    public String toString() {
        String format = "DauthFilterGroupBean["
                + "filterGroupId: %d, "
                + "falseFlag: %s, "
                + "dauthId: %d, "
                + "groupCode: %s, "
                + "groupName: %s, "
                + "filterItemBeanList: [%s]]";
        return String.format(format,
                filterGroupId,
                falseFlag,
                dauthId,
                groupCode,
                groupName,
                filterItemBeanList == null ? "" : Arrays.toString(filterItemBeanList.toArray()));
    }

}
