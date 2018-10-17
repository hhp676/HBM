package com.hginfo.hbm.fe.core.model;

import com.hginfo.hbm.base.entity.sys.SysUserRole;

import java.io.Serializable;
import java.util.List;

/**
 * Created by qiujingde on 2017/3/16. <br />
 * 角色管理相关请求参数封装类。<br />
 *
 * @author qiujingde
 */
public final class SysRoleRequestModel {

    /**
     * 私有构造函数，防止实例化。
     */
    private SysRoleRequestModel() { }

    /**
     * 用户角色关联列表。
     */
    public static final class SysUserRoleList implements Serializable  {
        private static final long serialVersionUID = 8469056889951719350L;
        /**
         * user role list.
         */
        private List<SysUserRole> userRoles;

        public List<SysUserRole> getUserRoles() {
            return userRoles;
        }

        public void setUserRoles(List<SysUserRole> userRoles) {
            this.userRoles = userRoles;
        }
    }

}
