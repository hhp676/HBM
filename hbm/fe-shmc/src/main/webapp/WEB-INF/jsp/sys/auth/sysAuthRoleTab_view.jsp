<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div data-options="region:'center',title:'授予角色',border:false"
	style="padding: 0px; height: 100%">
	<table singleSelect=false fit=true id="sysRole_grid_view"
		toolbar="#sysRole_grid_view_toolbar" fitColumns=true pagination="true"
		pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		data-options="url:'${ctx}/sys/sysRole/pageListByAuthId',scrollbarSize:0">
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
	<table class="table_form_result">
        <caption>
            <a href="javascript:void(0);" class="a_btn_blue" onclick="sysAuth.toRoleEdit();"><em>授予</em></a>
            <a href="javascript:void(0);"  class="a_btn_red" tag="del" onclick="sysAuth.delRole();"><em>删除</em></a>
            <a href="javascript:void(0);"  class="a_btn_gray" tag="clear"><em>清空查询</em></a>
		</caption>
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