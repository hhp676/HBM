var sysMetadataFieldGrid = new HgUi.Datagrid("sysMetadataField_grid");
sysMetadataFieldGrid.checkUpdateAuth = true;
sysMetadataFieldGrid.toolbar = $("#sysMetadataField_toolbar");
sysMetadataFieldGrid.mode = "rowEdit"; //行编辑模式
sysMetadataFieldGrid.options.isShowContextMenu = true;
sysMetadataFieldGrid.options.aboutUrl = "/sys/sysMetadata/aboutField";
sysMetadataFieldGrid.options.tipCells = ["fieldCode","fieldName","sysDauthFilterType.filterTypeName","columnName","engName","i18nCode","descr"];

sysMetadataFieldGrid.options.onSelect = function(index,row) {
	//刷新字段列表
	if (row && row.fieldId){
		sysMetadataFieldGrid.selectedRow = row;
	}
};

sysMetadataFieldGrid.options.onLoadSuccess = function(data) {
	//sysMetadataFieldGrid.grid.datagrid("selectRow",0);
};

sysMetadataFieldGrid.options.onBeginEdit = function(index,row) {
	var columnNameEd = sysMetadataFieldGrid.grid.datagrid('getEditor', {
		index : index,
		field : "columnName"
	});
	$(columnNameEd.target).combogrid({
		url: G_CTX_PATH + '/sys/sysMetadata/metaFieldList/' + sysMetadataEntityGrid.selectedRow.tableName,
		columns: [[
		           {field:'fieldName',title:'列名',width:150},
		           {field:'fieldDesc',title:'备注',width:150}
		       ]]
	});
	
	if (row.columnName) {
		$(columnNameEd.target).combogrid("setValue", row.columnName);
	}
	
	if (row.sysDauthFilterType && row.sysDauthFilterType.filterTypeId) {
		var dauthFilterTypeEd = sysMetadataFieldGrid.grid.datagrid('getEditor', {
			index : index,
			field : "sysDauthFilterType.filterTypeName"
		});
		$(dauthFilterTypeEd.target).combobox("setValue",row.sysDauthFilterType.filterTypeId);
	}
	
	
};
if (sysMetadataEntityGrid && sysMetadataEntityGrid.selectedRow) {
	sysMetadataFieldGrid.options.url = G_CTX_PATH+"/sys/sysMetadata/fieldList/" + sysMetadataEntityGrid.selectedRow.entityId;
}

sysMetadataFieldGrid.init();
sysMetadataFieldGrid.grid.datagrid("enableFilter");


sysMetadataFieldGrid.bindDefaultToolbarEvent();

// --------------------------保存数据------------------------------------------------------------------
sysMetadataFieldGrid.toolbar.find("[tag=save]").click(function() {
	if (sysMetadataFieldGrid.isEditing == true) {
		if (sysMetadataFieldGrid.grid.datagrid("validateRow", sysMetadataFieldGrid.editingIndex)) {
			var data = sysMetadataFieldGrid.makeSubmitData();
			var editRow = sysMetadataFieldGrid.grid.datagrid("getRows")[sysMetadataFieldGrid.editingIndex];
			var submitUrl = "/sys/sysMetadata/addField";
			if (editRow.fieldId) {
				submitUrl = "/sys/sysMetadata/updateField";
				data.fieldId = editRow.fieldId;
			}
			if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
			HgUtil.post(submitUrl, data, function(data) {
				if (!data.success) {
					sysMetadataFieldGrid.showMsgbox("error",data.data,330);
				} else {
					HgUi.ok("保存成功!",function(){
						sysMetadataFieldGrid.grid.datagrid("reload");
					});
				}
			});

		} else {
			sysMetadataFieldGrid.showMsgbox("alert","有一条数据未校验通过!",180);
		}
	}

});


//-------------------------删除-----------------------------------------------------------------------
sysMetadataFieldGrid.toolbar.find("[tag=del]").click(function(){
	var row = sysMetadataFieldGrid.grid.datagrid("getSelected");
	var rowIndex = sysMetadataFieldGrid.grid.datagrid('getRowIndex', row);
	if (sysMetadataFieldGrid.isEditing == true && rowIndex == 0){
		HgUi.error("未保存的数据无法删除");
		return;
	}
	if (!row) {
		$.messager.alert("提示","请选择一条字段数据","warning");
		return;
	}
	$.messager.confirm("确认删除", "确认将选中的字段删除?", function(r){
		if (r) {
			HgUtil.getJson("/sys/sysMetadata/deleteField",{fieldId:row.fieldId},function(data){
				if (!data.success) {
					$.messager.alert("提示","删除失败,"+data.data,"warning");
				} else {
					HgUi.ok("删除成功!",function(){
						sysMetadataFieldGrid.grid.datagrid("reload");
					});	
				}
			});
			
		}
	});
	
	
});






// 组织提交数据
sysMetadataFieldGrid.makeSubmitData = function() {
	var data = sysMetadataFieldGrid.getEditorsData();
	
	var fieldFilterTypeIdEd = sysMetadataFieldGrid.grid.datagrid('getEditor', {
		index : sysMetadataFieldGrid.editingIndex,
		field : "sysDauthFilterType.filterTypeName"
	});
	data.filterTypeId = $(fieldFilterTypeIdEd.target).combobox("getValue");
	data.entityId = sysMetadataEntityGrid.selectedRow.entityId;
	return data;
};



// 清空查询---------------------------------------------------------------------------------------------------


sysMetadataFieldGrid.toolbar.find("[tag=clear]").click(function() {
	sysMetadataFieldGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	sysMetadataFieldGrid.grid.datagrid("removeFilterRule");
	sysMetadataFieldGrid.grid.datagrid("load", {});
});
