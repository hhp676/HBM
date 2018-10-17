<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div data-options="region:'center',title:'授予角色',border:false"
	style="padding: 0px; height: 100%">
	<table singleSelect=false fit=true id="sysRole_grid_view"
		toolbar="#sysRole_grid_view_toolbar" fitColumns=true pagination="true"
		pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		data-options="url:'${ctx}/sys/sysRole/pageListByAuthId'">
		<thead>
			<tr>
			    <th data-options="field:'roleId',checkbox:true"></th>
				<th data-options="field:'roleName',width:120">角色名称</th>
				<th data-options="field:'roleCode',width:120">角色代码</th>
				<th data-options="field:'descr',width:200">描述</th>
			</tr>
		</thead>
	</table>
</div>
<div id="sysRole_grid_view_toolbar">
	<table>
		<tr>
			<td><a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon_add1" plain="true" onclick="sysAuth.toRoleEdit();">授予</a></td>
			<td><a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon_delete" plain="true" tag="del" onclick="sysAuth.delRole();">删除</a></td>
			<td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>
		</tr>
	</table>
</div>
<script type="text/javascript">
	var sysAuthRoleTabGrid = new HgUi.Datagrid ("sysRole_grid_view");
	sysAuthRoleTabGrid.options.tipCells = ["roleName","roleCode","descr"];
    sysAuthRoleTabGrid.init ();
    sysAuthRoleTabGrid.grid.datagrid ('enableFilter');
    // 清空查询----------------------------------------------
    $("#sysRole_grid_view_toolbar [tag=clear]").click(function() {
    	sysAuthRoleTabGrid.grid.datagrid("removeFilterRule");
    	sysAuthRoleTabGrid.grid.datagrid("reload");
    });
</script>