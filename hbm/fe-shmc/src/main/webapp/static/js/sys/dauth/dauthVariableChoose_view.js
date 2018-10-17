var dauthVariableChooseGrid = new HgUi.Datagrid("dauthVariableChoose_grid");
dauthVariableChooseGrid.toolbar = $("#dauthVariableChoose_toolbar");
dauthVariableChooseGrid.options.isShowContextMenu = false;
dauthVariableChooseGrid.options.onDblClickRow = function(index,row) {
	if (window.sysDauthVariableChooseWinCallback) {
		window.sysDauthVariableChooseWinCallback(row);
    }
	$("#dauthVariableChoose_layout").layout().parent().window("close");
};

dauthVariableChooseGrid.options.onLoadSuccess = function(data) {
	dauthVariableChooseGrid.grid.datagrid("selectRow",0);
	dauthVariableChooseGrid.tipDblClick();
};

dauthVariableChooseGrid.options.remoteFilter = false;
dauthVariableChooseGrid.init();
dauthVariableChooseGrid.grid.datagrid("enableFilter");




//清空查询---------------------------------------------------------------------------------------------------

dauthVariableChooseGrid.toolbar.find("[tag=clear]").click(function() {
	dauthVariableChooseGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	dauthVariableChooseGrid.grid.datagrid("removeFilterRule");
	dauthVariableChooseGrid.grid.datagrid("load", {});
});

