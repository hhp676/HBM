var sysMetaTableGrid = new HgUi.Datagrid("sysMetaTable_grid");
sysMetaTableGrid.toolbar = $("#sysMetaTable_toolbar");
sysMetaTableGrid.options.isShowContextMenu = false;
sysMetaTableGrid.options.onDblClickRow = function(index,row) {
	if (window.sysMetaTableListWinCallback) {
		window.sysMetaTableListWinCallback(row);
    }
	$("#sysMetaTable_layout").layout().parent().window("close");
};

sysMetaTableGrid.options.onLoadSuccess = function(data) {
	sysMetaTableGrid.grid.datagrid("selectRow",0);
	sysMetaTableGrid.tipDblClick();
};

sysMetaTableGrid.options.remoteFilter = false;
sysMetaTableGrid.init();
sysMetaTableGrid.grid.datagrid("enableFilter");




//清空查询---------------------------------------------------------------------------------------------------

sysMetaTableGrid.toolbar.find("[tag=clear]").click(function() {
	sysMetaTableGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	sysMetaTableGrid.grid.datagrid("removeFilterRule");
	sysMetaTableGrid.grid.datagrid("load", {});
});




