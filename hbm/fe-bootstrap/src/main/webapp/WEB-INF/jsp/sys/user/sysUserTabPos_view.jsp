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
	<table>
		<tr>
		    <%-- <shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_UPDATE_USER_POSITION%>">
			<td>
				<a href="javascript:void(0)"
				class="easyui-linkbutton" iconCls="icon_edit" plain="true"
				tag="edit">管理</a>
			</td>
			</shiro:hasPermission> --%>
			
			<shiro:hasPermission name="<%=Auths.Sys.SYS_ORG_POS_USER_SET_MAJOR%>">
			<td>
				<a href="javascript:void(0);" tag="setMajor" class="btn-magenta  btn-sm"> 
					<i class="fa fa-cog"></i>设置主岗
				</a>
			</td>
			</shiro:hasPermission>
		</tr>
	</table>
</div>



<script type="text/javascript"
	src="${ctx}/static/js/sys/user/sysUserTabPos_view.js"></script>
