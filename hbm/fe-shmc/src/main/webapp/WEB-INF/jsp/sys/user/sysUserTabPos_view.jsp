<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<table singleSelect=true fit=true id="sysUserTabPosView_grid"
	fitColumns=true toolbar="#sysUserTabPosView_toolbar" pagination="false"
	class="easyui-datagrid"
	data-options="url:'${ctx}/sys/sysUser/sysUserTabPosList?userId=${filter.userId}'"
	>
	<thead>
		<tr>
			<th
				data-options="field:'sysUser.userPositionId',hidden:true,width:150">主键</th>
			<th data-options="field:'sysUser.userName',hidden:true,width:150">姓名</th>
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
<div id="sysUserTabPosView_toolbar" tag=listen_hotkey>
	<table class="table_form_result">
		<caption>
			<shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_POS_USER_SET_MAJOR%>">
				<a href="javascript:void(0);" class="a_btn_green" tag="setMajor"><em>设置主岗</em></a>
			</shiro:hasPermission>
		</caption>
	</table>
</div>



<script type="text/javascript"
	src="${ctx}/static/js/sys/user/sysUserTabPos_view.js?jsTimer=${jsTimer}"></script>
