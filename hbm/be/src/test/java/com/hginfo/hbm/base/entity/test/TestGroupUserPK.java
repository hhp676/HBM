package com.hginfo.hbm.base.entity.test;

import com.hginfo.hbm.base.MultiKey;

/**
 * Created by qiujingde on 2017/2/15. <br />
 * TestGroupUser对应的主键组合类。<br />
 * @author qiujingde
 */
public class TestGroupUserPK extends MultiKey {
    private static final long serialVersionUID = 1795184521108554108L;

    /**
     * USER_ID_ : 用户ID。
     */
    private Long userId;
    /**
     * GROUP_ID_ : 角色ID。
     */
    private Long groupId;

    /**
     *
     */
    public TestGroupUserPK() {

    }

    /**
     *
     * @param userId   user id
     * @param groupId  group id
     */
    public TestGroupUserPK(Long groupId, Long userId) {
        this.userId = userId;
        this.groupId = groupId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        TestGroupUserPK that = (TestGroupUserPK) o;

        if (userId != null ? !userId.equals(that.userId) : that.userId != null) {
            return false;
        }
        return groupId != null ? groupId.equals(that.groupId) : that.groupId == null;
    }

    @Override
    public int hashCode() {
        int result = userId != null ? userId.hashCode() : 0;
        result = 31 * result + (groupId != null ? groupId.hashCode() : 0);
        return result;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }
}
