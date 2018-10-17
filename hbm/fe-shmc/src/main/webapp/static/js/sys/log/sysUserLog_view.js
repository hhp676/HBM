var sysUserLogGrid = new HgUi.Datagrid("sysUserLog_grid");

sysUserLogGrid.options.onLoadSuccess = function(data) {
	sysUserLogGrid.grid.datagrid("selectRow",0);
};

sysUserLogGrid.toolbar = $ ("#sysUserLog_toolbar");
sysUserLogGrid.searchbar = $("#sysUserLogSearchForm");
sysUserLogGrid.options.tipCells = ["sysUser.userName","operCode","operName","reqUri","operIp","key1","key2","key3","content","operRes","crtTime"];

sysUserLogGrid.reload = function() {
	sysUserLogGrid.grid.datagrid("reload");
};

sysUserLogGrid.init();

//查询------------------------------------------------------------------------------------------------------
sysUserLogGrid.searchbar.find("[tag=submit]").click(function(){
	var searchData = {};
	searchData["userName"] =  $.trim(sysUserLogGrid.searchbar.find("[name=userName]").val());
	searchData["operCode"] =  $.trim(sysUserLogGrid.searchbar.find("[name=operCode]").val());
	searchData["operName"] =  $.trim(sysUserLogGrid.searchbar.find("[name=operName]").val());
	searchData["reqUri"] =  $.trim(sysUserLogGrid.searchbar.find("[name=reqUri]").val());
	
	
	searchData["operIp"] =  $.trim(sysUserLogGrid.searchbar.find("[name=operIp]").val());
	searchData["keyword"] =  $.trim(sysUserLogGrid.searchbar.find("[name=keyword]").val());
	
	searchData["startTimeStr"] =  $.trim(sysUserLogGrid.searchbar.find("[name=startTime]").val());
	searchData["endTimeStr"] =  $.trim(sysUserLogGrid.searchbar.find("[name=endTime]").val());
	if(searchData["startTimeStr"]){
		searchData["startTimeStr"] = searchData["startTimeStr"] + " 00:00:00";
	}
	if(searchData["endTimeStr"]){
		searchData["endTimeStr"] = searchData["endTimeStr"] + " 24:00:00";
	}
	
	sysUserLogGrid.grid.datagrid('load',searchData);
});

//清空查询---------------------------------------------------------------------------------------------------
sysUserLogGrid.searchbar.find("[tag=clear]").click(function() {
	$("#sysUserLogSearchForm").form("clear");
	sysUserLogGrid.grid.datagrid("load", {});
});

