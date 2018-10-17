var sysJobChooseWin = {};

var sysJobChooseGrid = new HgUi.Datagrid("sysJobChooseGrid");
sysJobChooseGrid.toolbar = $("#sysJobChooseToolbar");
sysJobChooseGrid.options.isShowContextMenu = true;

sysJobChooseGrid.options.remoteFilter = false;
sysJobChooseGrid.init();
sysJobChooseGrid.grid.datagrid("enableFilter");

sysJobChooseGrid.options.onLoadSuccess = function() {
};

sysJobChooseWin.layout = $("#sysJobChooseLayout");

sysJobChooseWin.layout.find("[tag='ok']").click(function() {
	var rows = sysJobChooseGrid.grid.datagrid("getSelections");
	if (!rows || rows.length < 1){
		HgUi.alert("请选择一条数据");
		return;
	}
	if (window.sysJobChooseWinCallback){
		window.sysJobChooseWinCallback(rows);
	}
	sysJobChooseWin.layout.parent().window("close");
});

sysJobChooseWin.layout.find("[tag='cancel']").click(function() {
	sysJobChooseWin.layout.parent().window("close");
});

//清空查询---------------------------------------------------------------------------------------------------

sysJobChooseGrid.toolbar.find("[tag=clear]").click(function() {
	sysJobChooseGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function() {
		$(this).val("");
	});
	sysJobChooseGrid.grid.datagrid("removeFilterRule");
	sysJobChooseGrid.grid.datagrid("load", {});
});
