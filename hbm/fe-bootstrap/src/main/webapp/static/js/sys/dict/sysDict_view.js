var dictGroupGrid = new HgUi.Datagrid("datagroup_grid");
dictGroupGrid.checkUpdateAuth = true;
dictGroupGrid.toolbar = $("#datagroup_toolbar");
dictGroupGrid.mode = "rowEdit"; //行编辑模式
dictGroupGrid.options.isShowContextMenu = true;
dictGroupGrid.options.onSelect = function(index,row) {
	//刷新字典项列表
	if (row && row.dictGroupId){
		dictGroupGrid.selectedRow = row;
		$("#dataitem_grid").datagrid({url:G_CTX_PATH+"/sys/sysDict/"+row.dictGroupId+"/itemList"});	
	}
};

dictGroupGrid.options.onLoadSuccess = function(data) {
	dictGroupGrid.grid.datagrid("selectRow",0);
};
dictGroupGrid.init();
dictGroupGrid.grid.datagrid("enableFilter");


dictGroupGrid.bindDefaultToolbarEvent();


(function(){
	// --------------------------保存数据------------------------------------------------------------------
	dictGroupGrid.toolbar.find("[tag=save]").click(function() {
		if (dictGroupGrid.isEditing == true) {
			if (dictGroupGrid.grid.datagrid("validateRow", dictGroupGrid.editingIndex)) {
				var data = dictGroupGrid.getEditorsData();
				var editRow = dictGroupGrid.grid.datagrid("getRows")[dictGroupGrid.editingIndex];
				var submitUrl = "/sys/sysDict/addGroup";
				if (editRow.dictGroupId) {
					submitUrl = "/sys/sysDict/updGroup";
					data.dictGroupId = editRow.dictGroupId;
				}	
				if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
					return;
				}
				HgUtil.post(submitUrl, data, function(data) {
					if (!data.success) {
						dictGroupGrid.showMsgbox("error",data.data,330);
					} else {
						HgUi.ok("保存成功!",function(){
							dictGroupGrid.grid.datagrid("reload");
						});
					}
				});

			} else {
				dictGroupGrid.showMsgbox("alert","有一条数据未校验通过!",180);
			}
		}

	});


	//-------------------------删除-----------------------------------------------------------------------
	dictGroupGrid.toolbar.find("[tag=del]").click(function(){
		var row = dictGroupGrid.grid.datagrid("getSelected");
		var rowIndex = dictGroupGrid.grid.datagrid('getRowIndex', row);
		if (dictGroupGrid.isEditing == true && rowIndex == 0){
			HgUi.error("未保存的数据无法删除");
			return;
		}
		if (!row) {
			$.messager.alert("提示","请选择一条字典组数据","warning");
			return;
		}
		$.messager.confirm("确认删除", "确认将选中的字典组删除?", function(r){
			if (r) {
				HgUtil.getJson("/sys/sysDict/delGroup",{groupId:row.dictGroupId},function(data){
					if (!data.success) {
						$.messager.alert("提示","删除失败,"+data.data,"warning");
					} else {
						HgUi.ok("删除成功!",function(){
							dictGroupGrid.grid.datagrid("reload");
						});	
					}
				});
				
			}
		});
		
		
	});

	// 清空查询---------------------------------------------------------------------------------------------------
	dictGroupGrid.toolbar.find("[tag=clear]").click(function() {
		dictGroupGrid.grid.datagrid("removeFilterRule");
		dictGroupGrid.grid.datagrid("load", {});
	});



})();



//# sourceURL=tt.js



