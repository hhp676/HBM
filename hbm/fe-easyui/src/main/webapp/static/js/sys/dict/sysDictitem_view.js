var dictItemGrid = new HgUi.Datagrid("dataitem_grid");
dictItemGrid.checkUpdateAuth = true;
dictItemGrid.toolbar = $("#dataitem_toolbar");
dictItemGrid.mode = "rowEdit"; //行编辑模式

dictItemGrid.options.isShowContextMenu = true;

dictItemGrid.init();
if (dictGroupGrid && dictGroupGrid.selectedRow) {
	dictItemGrid.grid.datagrid({url:G_CTX_PATH+"/sys/sysDict/"+dictGroupGrid.selectedRow.dictGroupId+"/itemList"});
}

dictItemGrid.bindDefaultToolbarEvent();

(function(){
	// --------------------------保存数据------------------------------------------------------------------
	dictItemGrid.toolbar.find("[tag=save]").click(function() {
		if (dictItemGrid.isEditing) {
			if (dictItemGrid.grid.datagrid("validateRow", dictItemGrid.editingIndex)) {
				var data = dictItemGrid.getEditorsData();
				var editRow = dictItemGrid.grid.datagrid("getRows")[dictItemGrid.editingIndex];
				var submitUrl = "/sys/sysDict/addItem";
				if (editRow.dictItemId) {
					submitUrl = "/sys/sysDict/updItem";
					data.dictItemId = editRow.dictItemId;
				} else {
					data.dictGroupId = dictGroupGrid.selectedRow.dictGroupId;
				}
				if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
					return;
				}
				HgUtil.post(submitUrl, data, function(data) {
					if (!data.success) {
						dictItemGrid.showMsgbox("error",data.data,330);
					} else {
						HgUi.ok("保存成功!",function(){
							dictItemGrid.grid.datagrid("reload");
						});
					}
				});

			} else {
				dictItemGrid.showMsgbox("alert","有一条数据未校验通过!",180);
			}
		}

	});


	//-------------------------删除-----------------------------------------------------------------------
	dictItemGrid.toolbar.find("[tag=del]").click(function(){
		var row = dictItemGrid.grid.datagrid("getSelected");
		var rowIndex = dictItemGrid.grid.datagrid('getRowIndex', row);
		if (dictItemGrid.isEditing == true && rowIndex == 0){
			HgUi.alert("未保存的数据无法删除");
			return;
		}
		if (!row) {
			HgUi.alert("请选择一条字典项数据");
			return;
		}
		$.messager.confirm("确认删除", "确认将选中的字典项删除?", function(r){
			if (r) {
				HgUtil.getJson("/sys/sysDict/delItem",{itemId:row.dictItemId},function(data){
					if (!data.success) {
						
					} else {
						HgUi.ok("删除成功!",function(){
							dictItemGrid.grid.datagrid("reload");
						});	
					}
				});
				
			}
		});
	});
})();








