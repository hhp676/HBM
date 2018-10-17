/**
 * 组织架构。 Created by yuqing on 2017/1/3.
 */
var sysRoleWinList = {};

var sysRoleWinListGrid = new HgUi.Datagrid("sysRoleWinList_grid");
sysRoleWinListGrid.toolbar = $("#sysRoleWinList_toolbar");
sysRoleWinListGrid.options.isShowContextMenu = true;
sysRoleWinListGrid.init();
sysRoleWinListGrid.grid.datagrid('enableFilter', []);
sysRoleWinListGrid.bindDefaultToolbarEvent();
sysRoleWinListGrid.options.onLoadSuccess = function() {
};

sysRoleWinList.layout = $("#sysRoleWinListLayout");
sysRoleWinList.grid = sysRoleWinListGrid.grid;

sysRoleWinList.layout.find("[tag='ok']").click(function() {
	var rows = sysRoleWinList.grid.datagrid("getSelections");
	if (rows.length == 0){
		$.messager.alert("提示", "请选择一条数据", "warning");
		return;
	}
	if (sysRoleWinListCallback){
		sysRoleWinListCallback(rows);
	}
	sysRoleWinList.layout.parent().window("close");
});

sysRoleWinList.layout.find("[tag='submit']").click(function() {
	var searchData = {};
	searchData["roleName"] = $.trim(sysRoleWinListGrid.toolbar.find("[name=roleName]").val());
	searchData["roleCode"] = $.trim(sysRoleWinListGrid.toolbar.find("[name=roleCode]").val());
	sysRoleWinListGrid.grid.datagrid('load', searchData);
});

sysRoleWinList.layout.find("[tag='clear']").click(function() {
	$("#sysRoleWinListSearchForm")[0].reset();
	sysRoleWinListGrid.grid.datagrid('load', {});
});

sysRoleWinList.layout.find("[tag='cancel']").click(function() {
	sysRoleWinList.layout.parent().window("close");
});

sysRoleWinList.layout.find("[tag='clear1']").click(function() {
	sysRoleWinListGrid.grid.datagrid("removeFilterRule");
	sysRoleWinListGrid.grid.datagrid("load", {});
});