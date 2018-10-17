<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>人员列表</title>
</head>
<body>
<div id="sysOrgUserListLayout" class="easyui-layout" fit=true>
    <div region="center">
        <table fit=true id="sysOrgUserList_grid" pagination="true"
               fitColumns=true toolbar="#sysOrgUserList_toolbar"
               pageSize="${defaultPageSize}" pageList="${defaultPageList}"
               data-options="url:'${ctx}/${fetchUrl}',border:false">
            <thead>
            <tr>
                <th data-options="field:'userPositionId',checkbox:true"></th>
                <th data-options="field:'sysUser.userName',width:30,formatter:HgUtil.userInfoDetail('sysOrgUserListGrid.reload')">用户名</th>
                <th data-options="field:'sysUser.engName',width:30">英文名称</th>
                <th data-options="field:'sysUser.gender', formatter:HgUtil.fieldFormatterFunc('maleOrFemale'),width:20">性别</th>
                <th data-options="field:'sysUser.mobile',width:30">手机号码</th>
                <th data-options="field:'sysUser.email',width:40">邮箱</th>
                <th data-options="field:'sysPosition.sysOrganization.orgName',width:40">部门</th>
                <th data-options="field:'sysPosition.positionName',width:40">岗位</th>
                <th data-options="field:'isMajor', formatter:HgUtil.fieldFormatterFunc('isMajorPztn'), width:40" 
                    align="center">岗位类别</th>

            </tr>
            </thead>
        </table>
        <div id="sysOrgUserList_toolbar" tag="listen_hotkey">
            <table class="table_form_result">
                <caption>
                    <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_POS_USER_ADD%>">
                        <a href="javascript:void(0);" class="a_btn_blue" tag="addUser"><em>新增</em></a>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_POS_USER_DEL%>">
                        <a href="javascript:void(0);"  class="a_btn_red" tag="del"><em>删除</em></a>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_POS_USER_SET_MAJOR%>">
                        <a href="javascript:void(0);"  class="a_btn_green" tag="setMajor"><em>设为主岗</em></a>
                    </shiro:hasPermission>
                    <a href="javascript:void(0);"  class="a_btn_gray" tag="clear"><em>清空查询</em></a>
                </caption>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    var sysOrgUserListOrgId = "${orgId}";
    var sysOrgUserListPosId = "${posId}";
</script>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysOrgUser_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>