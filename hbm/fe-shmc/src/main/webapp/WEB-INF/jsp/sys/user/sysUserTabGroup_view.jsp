<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<table singleSelect=true fit=true id="sysUserTabGroupView_grid"
	fitColumns=true toolbar="#sysUserTabGroupView_toolbar" pagination="false"
	class="easyui-datagrid"
	data-options="url:'${ctx}/sys/sysUser/sysUserTabGroupList?userId=${filter.userId}'"
	>
	<thead>
		<tr>
			<th
				data-options="field:'groupUserId',hidden:true,width:150">主键</th>
			<th data-options="field:'sysGroup.groupName',width:150">小组名称</th>
			<th data-options="field:'sysGroup.descr',width:150">小组描述</th>
			<th data-options="field:'sysGroup.sysOrganization.orgName',width:150">所属部门</th>
			<th data-options="field:'sysGroup.groupCode',width:150">小组编码</th>
			<th data-options="field:'isLeader',
			     formatter:HgUtil.fieldFormatterFunc('sysGroupDuty'),width:150">小组职责</th>

		</tr>
	</thead>
</table>
<div id="sysUserTabGroupView_toolbar" tag=listen_hotkey>
	<table class="table_form_result">
		<caption>
			<shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_GROUP_USER_SET_LEADER%>">
				<a href="javascript:void(0);" class="a_btn_green" tag="setLeader"><em>设置组长</em></a>
			</shiro:hasPermission>
		</caption>
	</table>
</div>



<script type="text/javascript"
	src="${ctx}/static/js/sys/user/sysUserTabGroup_view.js?jsTimer=${jsTimer}"></script>
