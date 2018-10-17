var dauthChooseGrid = new HgUi.Datagrid("dauthChoose_grid");
dauthChooseGrid.toolbar = $("#dauthChoose_toolbar");
dauthChooseGrid.options.isShowContextMenu = false;
dauthChooseGrid.options.onDblClickRow = function(index,row) {
	if (window.sysDauthChooseWinCallback) {
		window.sysDauthChooseWinCallback(row);
    }
	$("#dauthChoose_layout").layout().parent().window("close");
};

dauthChooseGrid.options.onLoadSuccess = function(data) {
	dauthChooseGrid.grid.datagrid("selectRow",0);
	dauthChooseGrid.tipDblClick();
};



dauthChooseGrid.options.remoteFilter = true;
dauthChooseGrid.init();
dauthChooseGrid.grid.datagrid("enableFilter");




//清空查询---------------------------------------------------------------------------------------------------

dauthChooseGrid.toolbar.find("[tag=clear]").click(function() {
	dauthChooseGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	dauthChooseGrid.grid.datagrid("removeFilterRule");
	dauthChooseGrid.grid.datagrid("load", {});
});

