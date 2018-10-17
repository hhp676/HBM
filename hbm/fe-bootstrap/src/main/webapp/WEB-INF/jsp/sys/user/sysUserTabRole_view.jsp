<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<table singleSelect=false fit=true id="sysUserTabRoleView_grid"
	fitColumns=true toolbar="#sysUserTabRoleView_toolbar"
	class="easyui-datagrid" pagination="true"
        pageSize="${defaultPageSize}" pageList="${defaultPageList}" 
	data-options="url:'${ctx}/sys/sysUser/sysUserTabRoleList?userId=${filter.userId}'"
	>
	<thead>
		<tr>
			<th data-options="field:'roleId',hidden:true,width:150">主键</th>
			<th data-options="field:'roleName',width:150">角色名称</th>
			<th data-options="field:'roleCode',width:150">角色编码</th>
			<th data-options="field:'descr',width:150">角色描述</th>
		</tr>
	</thead>
</table>

<script type="text/javascript">

(function(){
	var sysUserTabRoleViewgrid = new HgUi.Datagrid("sysUserTabRoleView_grid");
	sysUserTabRoleViewgrid.options.tipCells = ["roleName","roleCode","descr"];
	sysUserTabRoleViewgrid.init();
}());

</script>