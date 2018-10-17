<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<table singleSelect=true fit=true id="sysPersonalTabGroupView_grid"
	fitColumns=true  pagination="false"
	class="easyui-datagrid"
	data-options="url:'${ctx}/sys/sysPersonal/groupList'">
	<thead>
		<tr>
			<th
				data-options="field:'groupUserId',hidden:true,width:150">主键</th>
			<th data-options="field:'sysGroup.groupName',width:150">小组名称</th>
			<th data-options="field:'sysGroup.descr',width:150">小组描述</th>
			<th data-options="field:'sysGroup.sysOrganization.orgName',width:150">所属部门</th>
			<th data-options="field:'sysGroup.groupCode',width:150">小组编码</th>
			<th data-options="field:'isLeader',formatter:HgUtil.fieldFormatterFunc('sysGroupDuty'),width:150">小组职责</th>

		</tr>
	</thead>
</table>
