var sysTaskDatagrid = new HgUi.Datagrid("sysTask_datagrid");
sysTaskDatagrid.toolbar = $("#sysTaskSearchForm");
sysTaskDatagrid.options.tipCells = ["descr"];

sysTaskDatagrid.options.onLoadSuccess = function(data) {
    sysTaskDatagrid.grid.datagrid("selectRow",0);
};

sysTaskDatagrid.gridOperateFormatter = function(value,row,index){
	var handleMode;
	/*办理方式为弹窗的*/
	if(row.sysTaskType.taskHandleMode == '0'){
		handleMode = 'Win';
	}else if(row.sysTaskType.taskHandleMode == '1'){
		handleMode = 'Href';
	}else  if(row.sysTaskType.taskHandleMode == '2'){
		handleMode = 'Open';
	}
	/*查看与办理调用方法一致,仅办理地址不同*/
	var	htmlStr = 
    	'<a  onclick="sysTaskDatagrid.taskDo'+handleMode+'(\''
    		+row.id+'\',\''
    		+row.crossDomainAppUrl+'\',\''
    		+row.taskHandleUrl+'\',\''
    		+row.sysTaskType.handleWinHeight+'\',\''
    		+row.sysTaskType.handleWinWidth+'\',\'任务办理\');">办理</a>&nbsp;&nbsp;&nbsp;';
	if(row.taskViewUrl != ''){
		htmlStr +=
			'<a  onclick="sysTaskDatagrid.taskDo'+handleMode+'(\''
				+row.id+'\',\''
				+row.crossDomainAppUrl+'\',\''
				+row.taskViewUrl+'\',\''
				+row.sysTaskType.handleWinHeight+'\',\''
				+row.sysTaskType.handleWinWidth+'\',\'任务查看\');">查看</a>';
	}
	return htmlStr;
}

sysTaskDatagrid.init();

// 查询---------------------------------------------------------------------------------------------------
sysTaskDatagrid.toolbar.find("[tag=search]").click(function() {
	var paramMap = HgUtil.paramArrayToMap($("#sysTaskSearchForm").serializeArray());
	paramMap = HgUtil.paramMapTrim(paramMap);
	sysTaskDatagrid.grid.datagrid("load", paramMap);
});
// 清空---------------------------------------------------------------------------------------------------
sysTaskDatagrid.toolbar.find("[tag=clear]").click(function() {
	$("#sysTaskSearchForm").form('clear');
	$("#sysTaskSearchForm #taskTypeId").combobox("setValue","");
    sysTaskDatagrid.grid.datagrid("load", {});
});


/*任务状态校验*/
sysTaskDatagrid.taskStatusCheck = function(taskId,callBack){
	HgUtil.post("/sys/sysTask/getTaskInfoById", {id:taskId}, function(data){
		if(data.isDelete=='0' && data.taskStatus=='0'){
			callBack();
		}else{
			HgUi.error("操作失败,该任务已被其它办理人办理或已被删除!", function(){
				var searchbtn = $("#sysTaskSearchForm [tag=search]");
				if(searchbtn.length>0){
					$("#sysTaskSearchForm [tag=search]").click();
				}
			});
		}
	});
}

/*任务办理弹窗*/
sysTaskDatagrid.taskDoWin = function(taskId,appUrl,handleUrl,height,width,title){
	sysTaskDatagrid.taskStatusCheck(taskId,
    	function(){
    		if(appUrl == '' || appUrl == 'null'){
    			new HgUi.window({id: "taskDoWin",title: title,
    				height: height,width: width,url: handleUrl,
    				//任务办理页面关闭时,对原页面重新执行查询
    				onClose:function(){
    					var searchbtn = $("#sysTaskSearchForm [tag=search]");
    					if(searchbtn.length>0){
    						$("#sysTaskSearchForm [tag=search]").click();
    					}
    				}
    			});
    		}else{
    			var url = '/sys/sysTask/taskCrossDomainWin?url='+window.encodeURI(window.encodeURI(appUrl+handleUrl));
    			new HgUi.window({id: "taskDoWin",title: title,
    				height: height,width: width,url: url,
    				//任务办理页面关闭时,对原页面重新执行查询
    				onClose:function(){
    					var searchbtn = $("#sysTaskSearchForm [tag=search]");
    					if(searchbtn.length>0){
    						$("#sysTaskSearchForm [tag=search]").click();
    					}
    				}
    			});
    		}
    	});
}

/*任务办理页面跳转,height与width无用*/
sysTaskDatagrid.taskDoHref = function(taskId,appUrl,handleUrl,height,width,title){
	sysTaskDatagrid.taskStatusCheck(taskId,
    	function(){
    		if(appUrl == '' || appUrl == 'null'){
    			var tab = $("#tab").tabs('getSelected');  
    			tab.panel('refresh', G_CTX_PATH + handleUrl);
    		}else{
    			HgUtil.open(window.encodeURI(appUrl + handleUrl),'');
    		}
    	});
}

/*任务办理页面跳转,height与width无用*/
sysTaskDatagrid.taskDoOpen = function(taskId,appUrl,handleUrl,height,width,title){
	sysTaskDatagrid.taskStatusCheck(taskId,
		function(){
    		if(appUrl == '' || appUrl == 'null'){
    			//open页面使用window.opener来操作父页面
    			HgUtil.open(window.encodeURI(G_CTX_PATH + handleUrl),'');
    		}else{
    			//open页面使用window.opener来操作父页面
    			HgUtil.open(window.encodeURI(appUrl + handleUrl),'');
    		}
    	});
}

//开启websocket任务推送,延时执行避免easyui加载问题
setTimeout(function(){
	//websocket存在,且处于连接状态时,返回,不再继续调用(避免页面重复打开加载多个对象)
	if (HgCommon.sysTaskStompClient && HgCommon.sysTaskStompClient.connected) {
		return;
	}
	//说明详见方法注释
	HgCommon.webSocketConnect(HgCommon.sysTaskStompClient,'/topic/taskWebSocket/'+userId,
    	function(client,msg){
    		var searchbtn = $("#sysTaskSearchForm [tag=search]");
    		if(searchbtn.length > 0){
    			$("#sysTaskSearchForm [tag=search]").click();
    		}else{
    			//发现页面已经离开原页面时,断开连接
    			client.disconnect(function(){});
    		}
    	});
} , 5000);

