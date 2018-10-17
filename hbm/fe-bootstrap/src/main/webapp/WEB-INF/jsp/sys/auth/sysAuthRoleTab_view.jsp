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
			<td>
				<a href="javascript:void(0)" class="btn btn-palegreen btn-sm" 
					 onclick="sysAuth.toRoleEdit();">
					<i class="fa fa-check-circle-o"></i>授予
				</a>

				<a href="javascript:void(0)"  class="btn btn-darkorange btn-sm"
					 tag="del" onclick="sysAuth.delRole();">
					<i class="fa fa-remove"></i>删除
				</a>

				<a class="btn btn-yellow btn-sm"  tag="clear">
					<i class="fa fa-eraser"></i>清空查询
				</a>
			</td>
			
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