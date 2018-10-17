<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<table singleSelect=true id="sysPersonalTabPosView_grid"
	fitColumns=true fit=true  pagination="false"
	class="easyui-datagrid"
	data-options="url:'${ctx}/sys/sysPersonal/posList'">
	<thead>
		<tr>
			<th data-options="field:'sysPosition.positionName',width:150">岗位名称</th>
			<th data-options="field:'sysPosition.descr',width:150">岗位描述</th>
			<th data-options="field:'sysPosition.sysOrganization.orgName',width:150">所属部门</th>
			<th data-options="field:'sysPosition.sysJob.jobName',width:150">职位名称</th>
			<th data-options="field:'sysPosition.positionCode',width:150">岗位编码</th>
			<th data-options="field:'isMajor',
			     formatter:HgUtil.fieldFormatterFunc('isMajorPztn'),width:150" align="center">岗位类别</th>

		</tr>
	</thead>
</table>
