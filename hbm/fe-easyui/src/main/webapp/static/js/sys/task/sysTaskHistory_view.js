var sysTaskHistoryDatagrid = new HgUi.Datagrid("sysTaskHistory_datagrid");
sysTaskHistoryDatagrid.toolbar = $("#sysTaskHistory_toolbar");
sysTaskHistoryDatagrid.options.isShowContextMenu = true;
sysTaskHistoryDatagrid.options.tipCells = ["descr"];

sysTaskHistoryDatagrid.options.onLoadSuccess = function(data) {
    sysTaskHistoryDatagrid.grid.datagrid("selectRow",0);
};
sysTaskHistoryDatagrid.options.onSelect = function(index, row){
	sysTaskLogGrid.taskLogView(row.taskId);
}
sysTaskHistoryDatagrid.gridOperateFormatter = function(value,row,index){
	var	htmlStr='';
	if(row.taskViewUrl != ''){
    	var handleMode;
    	/*办理方式为弹窗的*/
    	if(row.sysTaskType.taskHandleMode == '0'){
    		handleMode = 'Win';
    	}else if(row.sysTaskType.taskHandleMode == '1'){
    		handleMode = 'Href';
    	}else{
    		handleMode = 'Open';
    	}
    	htmlStr = 
			'<a class="easyui-linkbutton" onclick="sysTaskHistoryDatagrid.taskView'+handleMode+'(\''
				+row.id+'\',\''
				+row.crossDomainAppUrl+'\',\''
				+row.taskViewUrl+'\',\''
				+row.sysTaskType.handleWinHeight+'\',\''
				+row.sysTaskType.handleWinWidth+'\');">查看任务</a>';
	}
	return htmlStr;
}
sysTaskHistoryDatagrid.init();

//查询---------------------------------------------------------------------------------------------------
sysTaskHistoryDatagrid.toolbar.find("[tag=search]").click(function() {
	sysTaskLogGrid.taskLogView(0);
	var paramMap = HgUtil.paramArrayToMap($("#sysTaskHistory_toolbar #sysTaskHistorySearchForm").serializeArray());
	paramMap = HgUtil.paramMapTrim(paramMap);
	sysTaskHistoryDatagrid.grid.datagrid("load", paramMap);
});
// 清空查询---------------------------------------------------------------------------------------------------
sysTaskHistoryDatagrid.toolbar.find("[tag=clear]").click(function() {
	sysTaskLogGrid.taskLogView(0);
	$("#sysTaskHistory_toolbar #sysTaskHistorySearchForm").form('clear');
	$("#sysTaskHistorySearchForm #taskTypeId").combobox("setValue","");
    sysTaskHistoryDatagrid.grid.datagrid("load", {});
});

/*任务查看弹窗*/
sysTaskHistoryDatagrid.taskViewWin = function(taskId,appUrl,taskViewUrl,height,width){
	if(appUrl == '' || appUrl == 'null'){
		new HgUi.window({id: "taskViewWin",title: '任务查看',
			height: height,width: width,url: taskViewUrl});
	}
}

/*任务办理页面跳转,height与width无用*/
sysTaskHistoryDatagrid.taskViewHref = function(taskId,appUrl,viewUrl,height,width){
	if(appUrl == '' || appUrl == 'null'){
		var tab = $("#tab").tabs('getSelected');  
		tab.panel('refresh', G_CTX_PATH + viewUrl);
	}else{
		HgUtil.open(window.encodeURI(appUrl + viewUrl),'');
	}
}

/*任务办理页面跳转,height与width无用*/
sysTaskHistoryDatagrid.taskViewOpen = function(taskId,appUrl,viewUrl,height,width){
	if(appUrl == '' || appUrl == 'null'){
		//open页面使用window.opener来操作父页面
		HgUtil.open(window.encodeURI(G_CTX_PATH + viewUrl),'');
	}else{
		HgUtil.open(window.encodeURI(appUrl + viewUrl),'');
	}
}

var sysTaskLogGrid = new HgUi.Datagrid("sysTaskLog_datagrid");
sysTaskLogGrid.options.tipCells = ["descr"];
sysTaskLogGrid.init();

sysTaskLogGrid.taskLogView = function(taskId){
	$("#sysTaskLog_datagrid").datagrid('load',{taskId:taskId});
}
