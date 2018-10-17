var dauthFilterItemChooseGrid = new HgUi.Datagrid("dauthFilterItemChoose_grid");
dauthFilterItemChooseGrid.toolbar = $("#dauthFilterItemChoose_toolbar");
dauthFilterItemChooseGrid.options.isShowContextMenu = false;
dauthFilterItemChooseGrid.options.onDblClickRow = function(index,row) {
	if (window.sysdauthFilterItemChooseWinCallback) {
		window.sysdauthFilterItemChooseWinCallback(row);
    }
	$("#dauthFilterItemChoose_layout").layout().parent().window("close");
};

dauthFilterItemChooseGrid.options.onLoadSuccess = function(data) {
	dauthFilterItemChooseGrid.grid.datagrid("selectRow",0);
	dauthFilterItemChooseGrid.tipDblClick();
};


dauthFilterItemChooseGrid.filterValueFormat = function(value,row,index){
	return row.filterValueStr;
}


dauthFilterItemChooseGrid.options.remoteFilter = true;
dauthFilterItemChooseGrid.init();
dauthFilterItemChooseGrid.grid.datagrid("enableFilter",[
	{
		field:'valueType',
		type:'combobox',
		options:{
			prompt:'---请选择---',
			data:HgUtil.getDictComboboxData("DAUTH_FILTER_VALUE_TYPE"),
	   		mode:'remote',
	        panelHeight:'auto',
	        editable:false,
	        onChange:function(value){
	        	if (value == ''){
	        		dauthFilterItemChooseGrid.grid.datagrid('removeFilterRule', 'valueType');
	            } else {
	            	dauthFilterItemChooseGrid.grid.datagrid('addFilterRule', {
	                    field: 'valueType',
	                    op: 'equal',
	                    value: value
	                });
	            }
	        	dauthFilterItemChooseGrid.grid.datagrid('doFilter');
	        }
	    }
	},
	{
		field:'filterValue',
		type:'textbox',
		options:{disabled:true}
	}
]);




//清空查询---------------------------------------------------------------------------------------------------

dauthFilterItemChooseGrid.toolbar.find("[tag=clear]").click(function() {
	dauthFilterItemChooseGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	dauthFilterItemChooseGrid.grid.datagrid("removeFilterRule");
	dauthFilterItemChooseGrid.grid.datagrid("load", {});
});

