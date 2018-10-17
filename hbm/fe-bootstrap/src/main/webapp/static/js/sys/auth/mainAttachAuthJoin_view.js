var mainAttachAuthJoinGrid = new HgUi.Datagrid("mainAttachAuthJoin_grid");
//1:主权限设置附属权限  2：附属权限设置主权限
mainAttachAuthJoinGrid.joinType = mainAttachAuthJoin_type;
mainAttachAuthJoinGrid.toolbar = $("#mainAttachAuthJoin_toolbar");
if (mainAttachAuthJoinGrid.joinType == 1) {
	mainAttachAuthJoinGrid.options.tipCells
		= ["attachSysAuth.authName","attachSysAuth.authCode","attachSysAuth.uri","attachSysAuth.descr"];
} else {
	mainAttachAuthJoinGrid.options.tipCells
		= ["mainSysAuth.authName","mainSysAuth.authCode","mainSysAuth.uri","mainSysAuth.descr"];
}

mainAttachAuthJoinGrid.options.onLoadSuccess = function(data) {
};

mainAttachAuthJoinGrid.options.url = G_CTX_PATH+"/sys/sysAuthMenu/authJoinList";
var authGrid_selectedRow = $("#sysAuth_grid").treegrid("getSelected");
if (authGrid_selectedRow && authGrid_selectedRow.authShowType == 2) {
	if (mainAttachAuthJoinGrid.joinType == 1) {
		mainAttachAuthJoinGrid.options.queryParams = {mainAuthId : authGrid_selectedRow.authId};
	} else {
		mainAttachAuthJoinGrid.options.queryParams = {attachAuthId : authGrid_selectedRow.authId};
	}
} else {
	mainAttachAuthJoinGrid.options.queryParams = {authJoinId:'-1'};
}

mainAttachAuthJoinGrid.init();
mainAttachAuthJoinGrid.grid.datagrid("enableFilter");

//-------------------------删除-----------------------------------------------------------------------
mainAttachAuthJoinGrid.toolbar.find("[tag=del]").click(function(){
	var rows = mainAttachAuthJoinGrid.grid.datagrid("getSelections");
	if (rows.length == 0){
		$.messager.alert("提示","请选择一条数据","warning");
		return;
	}
	$.messager.confirm("确认删除", "确认删除选中数据?", function(r){
		if (r) {
			var authJoinIds = [];
			if (rows instanceof Array){
				for ( var index=0; index<rows.length; index++){
					if(rows[index].authJoinId != null ){
						authJoinIds.push(rows[index].authJoinId);
					}
				}
			} else {
				authJoinIds.push(rows.authJoinId);
			}
			HgUtil.getJson("/sys/sysAuthMenu/deleteBatchAuthJoin",{joinIds:authJoinIds.toString()},function(data){
				if (!data.success) {
					$.messager.alert("提示","删除失败,"+data.data,"warning");
				} else {
					HgUi.ok("删除成功!",function(){
						mainAttachAuthJoinGrid.grid.datagrid("reload");
					});	
				}
			});
			
		}
	});
	
	
});


//关联权限配置---------------------------------------------------------------------------------------------------
mainAttachAuthJoinGrid.toolbar.find("[tag=attachAuthJoin]").click(function() {
	var _selectedRow = $("#sysAuth_grid").treegrid("getSelected");
	if (_selectedRow == null || _selectedRow.authShowType != '2'){
		HgUi.error("请选择权限!", function() {
		});
		return;
	}
	//var iconCls = $(this).linkbutton("options").iconCls;
	
	
	sysAuth.chooseMainAttachAuthViewDialog(mainAttachAuthJoinGrid.joinType, _selectedRow.authId, function(rows) {
		var authIds = [];
		if (rows instanceof Array){
			for ( var index=0; index<rows.length; index++){
				if(rows[index].authId != null ){
					authIds.push(rows[index].authId);
				}
			}
		} else {
			authIds.push(rows.authId);
		}
		if(authIds.length ==0){
			HgUi.notice(" 请至少勾选一条数据!");
			return false;
		}else{
			var _saveParam = {};
			var _saveUrl = "";
			if (mainAttachAuthJoinGrid.joinType == 1) {
				_saveUrl = "/sys/sysAuthMenu/saveMainAuthJoinList";
				_saveParam.mainAuthId = _selectedRow.authId,
				_saveParam.attachAuthIds = authIds.join(',')	
			} else {
				_saveUrl = "/sys/sysAuthMenu/saveAttachAuthJoinList";
				_saveParam.attachAuthId = _selectedRow.authId,
				_saveParam.mainAuthIds = authIds.join(',')	
			}
			
			HgUtil.post(_saveUrl, _saveParam, function(data) {
				if(!data.success){
					$.messager.alert("提示","保存失败,"+data.data,"warning");
				}else{
					HgUi.ok("保存成功!", function() {
						mainAttachAuthJoinGrid.grid.datagrid("reload");
					});
				}
			});
			return true;
		}
	});
});
//清空查询---------------------------------------------------------------------------------------------------

mainAttachAuthJoinGrid.toolbar.find("[tag=clear]").click(function() {
	mainAttachAuthJoinGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	mainAttachAuthJoinGrid.grid.datagrid("removeFilterRule");
	mainAttachAuthJoinGrid.grid.datagrid("reload");
});




