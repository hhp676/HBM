var dauthFilterJoinItemGroupGrid = new HgUi.Datagrid("dauthFilterJoinItemGroup_grid");
dauthFilterJoinItemGroupGrid.toolbar = $("#dauthFilterJoinItemGroup_toolbar");
dauthFilterJoinItemGroupGrid.options.tipCells = ["sysDauthFilterGroup.groupCode","sysDauthFilterGroup.groupName","sysDauthFilterGroup.descr"];

dauthFilterJoinItemGroupGrid.options.onLoadSuccess = function(data) {
	dauthFilterJoinItemGroupGrid.grid.datagrid("selectRow",0);
};


dauthFilterJoinItemGroupGrid.init();
dauthFilterJoinItemGroupGrid.bindDefaultToolbarEvent();



//清空查询---------------------------------------------------------------------------------------------------
dauthFilterJoinItemGroupGrid.toolbar.find("[tag=clear]").click(function() {
	dauthFilterJoinItemGroupGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	dauthFilterJoinItemGroupGrid.grid.datagrid("removeFilterRule");
	dauthFilterJoinItemGroupGrid.grid.datagrid("load", {});
});


