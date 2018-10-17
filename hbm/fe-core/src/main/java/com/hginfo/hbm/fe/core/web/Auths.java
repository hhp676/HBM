package com.hginfo.hbm.fe.core.web;

/**
 * 页面按钮权限配置静态类.
 * ClassName: Auths <br/>
 * @author yinyanzhen
 * @since V1.0.0
 */
public final  class Auths {
    /**
     * 系统模块菜单权限.
     * @author yinyanzhen
     */
    public final class Sys {
        //系统模块
        public static final String MODEL_ADD = "sysModel:create";
        public static final String MODEL_UPDATE = "sysModel:update";
        public static final String MODEL_DELETE = "sysModel:delete";

        //系统权限
        public static final String AUTH_ADD = "sysAuth:create";
        public static final String AUTH_UPDATE = "sysAuth:update";
        public static final String AUTH_DELETE = "sysAuth:delete";
        
        public static final String OPERATION_VIEW = "sysOperation:view";
        public static final String OPERATION_ADD = "sysOperation:create";
        public static final String OPERATION_UPDATE = "sysOperation:update";
        public static final String OPERATION_DELETE = "sysOperation:delete";
        
        public static final String MENUSET_VIEW = "menuset:view";
        public static final String MENUSET_UPDATE = "menuSet:update";
        
        public static final String CONFIG_CREATE = "sysConfig:create";
        public static final String CONFIG_UPDATE = "sysConfig:update";
        public static final String CONFIG_DELETE = "sysConfig:delete";
        
        public static final String DICT_GROUP_ADD = "sysDictGroup:create";
        public static final String DICT_GROUP_UPDATE = "sysDictGroup:update";
        public static final String DICT_GROUP_DELETE = "sysDictGroup:delete";
        
        public static final String DICT_ITEM_ADD = "sysDictItem:create";
        public static final String DICT_ITEM_UPDATE = "sysDictItem:update";
        public static final String DICT_ITEM_DELETE = "sysDictItem:delete";
        
        public static final String ICON_ADD = "sysIcon:create";
        public static final String ICON_UPDATE = "sysIcon:update";
        public static final String ICON_DELETE = "sysIcon:delete";
        public static final String ICON_RECONFIG = "sysIcon:Reconfiguration";
        
        public static final String FILE_WEBUPLOADER = "sysFile:webUpload";
        public static final String FILE_UPLOAD = "sysFile:upload";
        public static final String FILE_UPDATEATTACH = "sysFile:updateAttach";
        public static final String FILE_DELETEATTACH = "sysFile:deleteAttach";
        public static final String FILE_DOWN_ATTACH = "sysFile:downFile";
        
        /*********************************用户、角色 start*******************************/
        /**
         * 
         */
        public static final String ROLE_ADD = "sysRole:create";
        /**
         * 
         */
        public static final String ROLE_UPDATE = "sysRole:update";
        /**
         * 
         */
        public static final String ROLE_DELETE = "sysRole:delete";
        /**
         * 
         */
        public static final String ROLE_AUTH_VIEW = "sysRoleAuth:view";
        /**
         * 
         */
        public static final String ROLE_AUTH_MANAGE = "sysRoleAuth:manage";
        /**
         * 
         */
        public static final String ROLE_USER_VIEW = "sysRoleUser:list";
        /**
         * 
         */
        public static final String ROLE_AUTH_ADD = "sysRoleUser:create";
        /**
         * 
         */
        public static final String ROLE_AUTH_DELETE = "sysRoleUser:delete";
        
        /**
         * 
         */
        public static final String USER_ADD = "sysUser:create";
        /**
         * 
         */
        public static final String USER_UPDATE = "sysUser:update";
        /**
         * 
         */
        public static final String USER_DELETE = "sysUser:delete";
        /**
         * 
         */
        public static final String USER_PWD_VIEW = "sysUserPwd:view";
        /**
         * 
         */
        public static final String USER_TAB_LOG_VIEW = "sysUserTabLog:view";
        /**
         * 
         */
        public static final String USER_TAB_POS_VIEW = "sysUserTabPos:view";
        /**
         * 
         */
        public static final String USER_TAB_GROUP_VIEW = "sysUserTabGroup:view";
        /**
         * 
         */
        public static final String USER_TAB_ROLE_VIEW = "sysUserTabRole:view";
        /**
         * 
         */
        public static final String USER_TAB_ROLE_ADD = "sysUserTabRole:add";
        /**
         * 
         */
        public static final String USER_TAB_ROLE_DELETE = "sysUserTabRole:delete";
        /**
         * 
         */
        public static final String USER_TAB_AUTH_VIEW = "sysUserTabAuth:view";
        /**
         * 
         */
        public static final String USER_TAB_NAUTH_VIEW = "sysUserTabNAuth:view";
        /**
         * 
         */
        public static final String USER_TAB_AUTH_MANAGE = "sysUserAuth:manage";
        
        /*********************************组织架构 start *******************************/
        public static final String SYS_ORG_JOB_MANAGE = "sysOrg:jobManage";
        public static final String SYS_ORG_NEW_ORG = "sysOrg:newOrg";
        public static final String SYS_ORG_EDIT_ORG = "sysOrg:editOrg";
        public static final String SYS_ORG_ABOUT_ORG = "sysOrg:aboutOrg";
        public static final String SYS_ORG_ORG_TREE = "sysOrg:orgTree";

        public static final String SYS_ORG_ALL_JOBS = "sysOrg:allJobs";
        public static final String SYS_ORG_CHOOSE_SYS_JOB_VIEW = "sysOrg:chooseSysJobView";

        public static final String SYS_ORG_NEW_POS = "sysOrg:newPos";
        public static final String SYS_ORG_EDIT_POS = "sysOrg:editPos";
        public static final String SYS_ORG_ABOUT_POS = "sysOrg:aboutPos";
        public static final String SYS_ORG_POS_VIEW = "sysOrg:posView";
        public static final String SYS_ORG_CHOOSE_SYS_POSITION_VIEW = "sysOrg:chooseSysPositionView";

        public static final String SYS_ORG_NEW_GROUP = "sysOrg:newGroup";
        public static final String SYS_ORG_EDIT_GROUP = "sysOrg:editGroup";
        public static final String SYS_ORG_ABOUT_GROUP = "sysOrg:aboutGroup";
        public static final String SYS_ORG_CHOOSE_SYS_GROUP_VIEW = "sysOrg:chooseSysGroupView";

        public static final String SYS_ORG_ORG_USER_VIEW = "sysOrg:orgUser:view";

        public static final String SYS_ORG_GROUP_USER_VIEW = "sysOrg:groupUser:view";

        public static final String SYS_ORG_POS_USER_VIEW = "sysOrg:posUser:view";

        public static final String SYS_ORG_POS_USER_ADD = "sysOrg:posUser:add";
        public static final String SYS_ORG_POS_USER_DEL = "sysOrg:posUser:del";

        public static final String SYS_ORG_GROUP_USER_ADD = "sysOrg:groupUser:add";
        public static final String SYS_ORG_GROUP_USER_DEL = "sysOrg:groupUser:del";

        // 用户岗位更新
        public static final String SYS_ORG_UPDATE_USER_POSITION = "sysOrg:updateUserPosition";
        // 设置主岗
        public static final String SYS_ORG_POS_USER_SET_MAJOR = "sysOrg:posUser:setMajor";
        // 用户小组更新
        public static final String SYS_ORG_UPDATE_USER_GROUP = "sysOrg:updateUserGroup";
        // 设置组长
        public static final String SYS_ORG_GROUP_USER_SET_LEADER = "sysOrg:groupUser:setLeader";
        /*********************************数据权限 start *******************************/
        public static final String DAUTH_FILTERTYPE_VIEW = "dauthFilterType:view";
        public static final String DAUTH_FILTERTYPE_ADD = "dauthFilterType:create";
        public static final String DAUTH_FILTERTYPE_UPDATE = "dauthFilterType:update";
        public static final String DAUTH_FILTERTYPE_DELETE = "dauthFilterType:delete";
        
        public static final String DAUTH_OPERATOR_VIEW = "dauthOperator:view";
        public static final String DAUTH_OPERATOR_ADD = "dauthOperator:create";
        public static final String DAUTH_OPERATOR_UPDATE = "dauthOperator:update";
        public static final String DAUTH_OPERATOR_DELETE = "dauthOperator:delete";
        
        public static final String DAUTH_OPERATORSUPPORT_ADD = "dauthOperatorSupport:create";
        public static final String DAUTH_OPERATORSUPPORT_UPDATE = "dauthOperatorSupport:update";
        public static final String DAUTH_OPERATORSUPPORT_DELETE = "dauthOperatorSupport:delete";
        
        public static final String METADATA_FIELD_ADD = "sysMetadataField:addField";
        public static final String METADATA_FIELD_UPDATE = "sysMetadataField:updateField";
        public static final String METADATA_FIELD_DELETE = "sysMetadataField:deleteField";
        
        public static final String METADATA_ENTITY_ADD = "sysMetadata:addEntity";
        public static final String METADATA_ENTITY_UPDATE = "sysMetadata:updateEntity";
        public static final String METADATA_ENTITY_DELETE = "sysMetadata:deleteEntity";

        public static final String CONSTRAINT_DEF_ADD = "sysConstraintDef:add";
        public static final String CONSTRAINT_DEF_UPDATE = "sysConstraintDef:update";
        public static final String CONSTRAINT_DEF_DEL = "sysConstraintDef:del";

        public static final String CONSTRAINT_DETAIL_ADD = "sysConstraintDetail:add";
        public static final String CONSTRAINT_DETAIL_UPDATE = "sysConstraintDetail:update";
        public static final String CONSTRAINT_DETAIL_DEL = "sysConstraintDetail:del";
        
        public static final String DAUTH_VARIABLE_VIEW = "dauthVariable:view";
        public static final String DAUTH_VARIABLE_ADD = "dauthVariable:create";
        public static final String DAUTH_VARIABLE_UPDATE = "dauthVariable:update";
        public static final String DAUTH_VARIABLE_DELETE = "dauthVariable:delete";
        
        public static final String DAUTH_FILTERITEM_ADD = "dauthFilter:addFilterItem";
        public static final String DAUTH_FILTERITEM_UPDATE = "dauthFilter:updateFilterItem";
        public static final String DAUTH_FILTERITEM_DELETE = "dauthFilter:deleteFilterItem";
        
        public static final String DAUTH_FILTERGROUP_ADD = "dauthFilter:addFilterGroup";
        public static final String DAUTH_FILTERGROUP_UPDATE = "dauthFilter:updateFilterGroup";
        public static final String DAUTH_FILTERGROUP_DELETE = "dauthFilter:deleteFilterGroup";
        
        public static final String DAUTH_FILTERJOIN_VIEW = "dauthFilterJoin:view";
        public static final String DAUTH_FILTERJOIN_ADD = "dauthFilterJoin:create";
        public static final String DAUTH_FILTERJOIN_UPDATE = "dauthFilterJoin:update";
        public static final String DAUTH_FILTERJOIN_DELETE = "dauthFilterJoin:delete";
        
        public static final String DAUTH_CHECK = "dauthCheck:view";
        public static final String DAUTH_ADD = "dauth:create";
        public static final String DAUTH_UPDATE = "dauth:update";
        public static final String DAUTH_DELETE = "dauth:delete";
        
        
        public static final String DAUTH_USAGE_ADD = "dauthUsage:create";
        public static final String DAUTH_USAGE_UPDATE = "dauthUsage:update";
        public static final String DAUTH_USAGE_CLEARCONFIG = "dauthUsage:clearConfig";
        
        
        
        
    }
    
    /**
     * 公共模块菜单权限.
     * @author shichengqun
     */
    public final class Common {
        /**
         * 查看用户详情
         */
        public static final String SYSUSER_DETAIL = "common:sysUserDetail";
    }
}
