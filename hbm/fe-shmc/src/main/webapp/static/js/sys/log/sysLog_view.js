var sysLogGrid = new HgUi.Datagrid("sysLog_grid");
sysLogGrid.toolbar = $ ("#sysLog_toolbar");
sysLogGrid.searchbar = $("#sysLogSearchForm");
sysLogGrid.options.isShowContextMenu = true;
sysLogGrid.options.tipCells = ["key1","key2","key3","key4","key5","content"];
sysLogGrid.options.onLoadSuccess = function(data) {
	sysLogGrid.grid.datagrid("selectRow",0);
};
sysLogGrid.init();

//日志类型combobox
sysLogGrid.searchbar.find("#logType").combobox({  
	panelHeight:'auto',
	editable:false,
	textField:'text',
	valueField:'value',  
	prompt: '---请选择---',
	data:HgUtil.getDictComboboxData('LOG_TYPE')
});  

//查询------------------------------------------------------------------------------------------------------
sysLogGrid.searchbar.find("[tag=submit]").click(function(){
	var searchData = {};
	searchData["tenantId"] =  $.trim(sysLogGrid.searchbar.find("[name=tenantId]").val());
	searchData["logType"] =  $.trim(sysLogGrid.searchbar.find("[name=logType]").val());
	searchData["logLevel"] =  $.trim(sysLogGrid.searchbar.find("[name=logLevel]").val());
	searchData["keyword"] =  $.trim(sysLogGrid.searchbar.find("[name=keyword]").val());
	
	searchData["startTimeStr"] =  $.trim(sysLogGrid.searchbar.find("[name=startTime]").val());
	searchData["endTimeStr"] =  $.trim(sysLogGrid.searchbar.find("[name=endTime]").val());
	if(searchData["startTimeStr"]){
		searchData["startTimeStr"] = searchData["startTimeStr"] + " 00:00:00";
	}
	if(searchData["endTimeStr"]){
		searchData["endTimeStr"] = searchData["endTimeStr"] + " 24:00:00";
	}
	
	sysLogGrid.grid.datagrid('load',searchData);
});

//清空查询---------------------------------------------------------------------------------------------------
sysLogGrid.searchbar.find("[tag=clear]").click(function() {
	$("#sysLogSearchForm").form("clear");
	//清空后combobox选中第一条“请选择”数据
	sysLogGrid.searchbar.find("#logType").combobox("setValue",''); 
	sysLogGrid.grid.datagrid("load", {});
});


