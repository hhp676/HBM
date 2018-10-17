var dauthVariableGrid = new HgUi.Datagrid("dauthVariable_grid");
dauthVariableGrid.checkUpdateAuth = true;
dauthVariableGrid.toolbar = $("#dauthVariable_toolbar");
dauthVariableGrid.mode = "rowEdit"; //行编辑模式
dauthVariableGrid.options.isShowContextMenu = true;
dauthVariableGrid.options.aboutUrl = "/sys/dauthVariable/aboutOne";
dauthVariableGrid.options.tipCells = ["variableCode","variableName","variableValue","engName","i18nCode","descr"];

dauthVariableGrid.options.onLoadSuccess = function(data) {
	dauthVariableGrid.grid.datagrid("selectRow",0);
};
dauthVariableGrid.init();
dauthVariableGrid.grid.datagrid("enableFilter");
dauthVariableGrid.bindDefaultToolbarEvent();

// --------------------------保存数据------------------------------------------------------------------
dauthVariableGrid.toolbar.find("[tag=save]").click(function() {
	if (dauthVariableGrid.isEditing == true) {
		if (dauthVariableGrid.grid.datagrid("validateRow", dauthVariableGrid.editingIndex)) {
			var data = dauthVariableGrid.makeSubmitData();
			var editRow = dauthVariableGrid.grid.datagrid("getRows")[dauthVariableGrid.editingIndex];
			var submitUrl = "/sys/dauthVariable/add";
			if (editRow.variableId) {
				submitUrl = "/sys/dauthVariable/update";
				data.variableId = editRow.variableId;
			}	
			if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
			HgUtil.post(submitUrl, data, function(data) {
				if (!data.success) {
					dauthVariableGrid.showMsgbox("error",data.data,330);
				} else {
					HgUi.ok("保存成功!",function(){
						dauthVariableGrid.grid.datagrid("reload");
					});
				}
			});

		} else {
			dauthVariableGrid.showMsgbox("alert","有一条数据未校验通过!",180);
		}
	}

});


//-------------------------删除-----------------------------------------------------------------------
dauthVariableGrid.toolbar.find("[tag=del]").click(function(){
	var row = dauthVariableGrid.grid.datagrid("getSelected");
	if (!row) {
		HgUi.alert("请选择一条数据权限变量数据");
		return;
	}
	$.messager.confirm("确认删除", "确认将选中的数据权限变量删除?", function(r){
		if (r) {
			HgUtil.getJson("/sys/dauthVariable/delete",{variableId:row.variableId},function(data){
				if (!data.success) {
					HgUi.alert("删除失败,"+data.data);
				} else {
					HgUi.ok("删除成功!",function(){
						dauthVariableGrid.grid.datagrid("reload");
					});	
				}
			});
			
		}
	});
	
	
});






// 组织提交数据
dauthVariableGrid.makeSubmitData = function() {
	var data = dauthVariableGrid.getEditorsData();
	return data;
};








//清空查询---------------------------------------------------------------------------------------------------

dauthVariableGrid.toolbar.find("[tag=clear]").click(function() {
	dauthVariableGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	dauthVariableGrid.grid.datagrid("removeFilterRule");
	dauthVariableGrid.grid.datagrid("load", {});
});
