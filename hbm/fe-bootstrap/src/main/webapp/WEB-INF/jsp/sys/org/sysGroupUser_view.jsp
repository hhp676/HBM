<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>人员列表</title>
</head>
<body>
<div id="sysGroupUserListLayout" class="easyui-layout easyui-datagrid-layout" fit=true>
    <div region="center">
        <table id="sysGroupUserList_grid" toolbar="#sysGroupUserList_toolbar"
           fit=true fitColumns=true 
           pagination="true" pageSize="${defaultPageSize}" pageList="${defaultPageList}"
           data-options="url:'${ctx}/${fetchUrl}'">
            <thead>
            <tr>
                <th data-options="field:'groupUserId',checkbox:true"></th>
                <th data-options="field:'sysUser.userName',width:30,formatter:HgUtil.userInfoDetail('sysGroupUserListGrid.reload')">用户名</th>
                <th data-options="field:'sysUser.engName',width:30">英文名称</th>
                <th data-options="field:'sysUser.gender', formatter:HgUtil.fieldFormatterFunc('maleOrFemale'),width:20"
                    align="center">性别</th>
                <th data-options="field:'sysUser.mobile',width:30">手机号码</th>
                <th data-options="field:'sysUser.email',width:40">邮箱</th>
                <th data-options="field:'isLeader', formatter:HgUtil.fieldFormatterFunc('sysGroupDuty'), width:40">小组职责</th>
                <th data-options="field:'sysUser.userPosition.positionName',width:40">主岗位</th>
                <th data-options="field:'sysUser.userPosition.sysOrganization.orgName',width:40">主岗部门</th>
            </tr>
            </thead>
        </table>
        <div id="sysGroupUserList_toolbar" tag="listen_hotkey">
            <table>
                <tr>
                    <td>
                        <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_GROUP_USER_ADD%>">
                            <a href="javascript:void(0);" class="btn btn-primary" tag="addUser"><i class="fa fa-plus"></i>添加</a>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_GROUP_USER_DEL%>">
                            <a href="javascript:void(0);" class="btn btn-darkorange" tag="del"><i class="fa fa-remove"></i>删除</a>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_GROUP_USER_SET_LEADER%>">
                            <a href="javascript:void(0)" class="btn btn-purple" tag="setLeader"><i class="fa fa-cog"></i>设置组长</a>
                        </shiro:hasPermission>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    var sysGroupUserListGroupId = "${groupId}";
</script>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysGroupUser_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>