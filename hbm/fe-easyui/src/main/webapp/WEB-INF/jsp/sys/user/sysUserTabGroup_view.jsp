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
	<table>
		<tr>
		    <%-- <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_UPDATE_USER_GROUP%>">
			<td>
				<a href="javascript:void(0)"
				class="easyui-linkbutton" iconCls="icon_edit" plain="true"
				tag="edit">管理</a>
			</td>
			</shiro:hasPermission> --%>
			
			<shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_GROUP_USER_SET_LEADER%>">
			<td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon_edit" plain="true" tag="setLeader">设置组长</a></td>
			</shiro:hasPermission>
		</tr>
	</table>
</div>



<script type="text/javascript"
	src="${ctx}/static/js/sys/user/sysUserTabGroup_view.js?jsTimer=${jsTimer}"></script>
