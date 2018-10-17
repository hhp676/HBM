var dauthGrid = new HgUi.Datagrid("dauth_grid");
dauthGrid.checkUpdateAuth = true;
dauthGrid.toolbar = $("#dauth_toolbar");
dauthGrid.mode = "rowEdit"; //行编辑模式
dauthGrid.options.isShowContextMenu = true;
dauthGrid.options.aboutUrl = "/sys/dauth/aboutDauth";
dauthGrid.options.tipCells = ["dauthCode","dauthName","sysMetadataEntity.entityName","sysMetadataEntity.tableName","tableAlias","descr"];

dauthGrid.options.onLoadSuccess = function(data) {
	dauthGrid.grid.datagrid("selectRow",0);
};

dauthGrid.options.onSelect = function(index,row) {
	//刷新列表
	if (row && row.dauthId){
		dauthGrid.selectedRow = row;
		if ($('#dauthFilterGroup_grid').length > 0) {
			$("#dauthFilterGroup_grid").datagrid("options").url = G_CTX_PATH+"/sys/dauthFilter/filterGroupList?dauthId=" + row.dauthId;
			$("#dauthFilterGroup_grid").datagrid("reload");
		}
	}
};

dauthGrid.options.onBeginEdit = function(index,row) {
	var entityNameEd = dauthGrid.grid.datagrid('getEditor', {
		index : index,
		field : "sysMetadataEntity.entityName"
	});
	$(entityNameEd.target).textbox("setValue", row.entityId);
	if (row.sysMetadataEntity) {
		$(entityNameEd.target).textbox("setText", row.sysMetadataEntity.entityName);
	}
};

dauthGrid.selectEntity = function(index,row) {
	if(row){
		var tableNameEd = dauthGrid.grid.datagrid('getEditor', {
			index : dauthGrid.editingIndex,
			field : "sysMetadataEntity.tableName"
		});
		var tableAliasEd = dauthGrid.grid.datagrid('getEditor', {
			index : dauthGrid.editingIndex,
			field : "tableAlias"
		});
		$(tableNameEd.target).textbox("setValue", row.tableName);
		$(tableAliasEd.target).textbox("setValue", row.tableAlias);
	}
}


dauthGrid.init();
dauthGrid.grid.datagrid("enableFilter");
dauthGrid.bindDefaultToolbarEvent();

// --------------------------保存数据------------------------------------------------------------------
dauthGrid.toolbar.find("[tag=save]").click(function() {
	if (dauthGrid.isEditing == true) {
		if (dauthGrid.grid.datagrid("validateRow", dauthGrid.editingIndex)) {
			var data = dauthGrid.makeSubmitData();
			var editRow = dauthGrid.grid.datagrid("getRows")[dauthGrid.editingIndex];
			var submitUrl = "/sys/dauth/add";
			if (editRow.dauthId) {
				submitUrl = "/sys/dauth/update";
				data.dauthId = editRow.dauthId;
			}
			if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
			HgUtil.post(submitUrl, data, function(data) {
				if (!data.success) {
					dauthGrid.showMsgbox("error",data.data,330);
				} else {
					HgUi.ok("保存成功!",function(){
						dauthGrid.grid.datagrid("reload");
					});
				}
			});

		} else {
			dauthGrid.showMsgbox("alert","有一条数据未校验通过!",180);
		}
	}

});


//-------------------------删除-----------------------------------------------------------------------
dauthGrid.toolbar.find("[tag=del]").click(function(){
	var row = dauthGrid.grid.datagrid("getSelected");
	var rowIndex = dauthGrid.grid.datagrid('getRowIndex', row);
	if (dauthGrid.isEditing == true && rowIndex == 0){
		HgUi.error("未保存的数据无法删除");
		return;
	}
	if (!row) {
		$.messager.alert("提示","请选择一条数据权限数据","warning");
		return;
	}
	$.messager.confirm("确认删除", "确认将选中的数据权限删除?", function(r){
		if (r) {
			HgUtil.getJson("/sys/dauth/delete",{dauthId:row.dauthId},function(data){
				if (!data.success) {
					$.messager.alert("提示","删除失败,"+data.data,"warning");
				} else {
					HgUi.ok("删除成功!",function(){
						dauthGrid.grid.datagrid("reload");
					});	
				}
			});
			
		}
	});
	
	
});


//-------------------------校验-----------------------------------------------------------------------
dauthGrid.toolbar.find("[tag=dauthCheck]").click(function(){
	var row = dauthGrid.grid.datagrid("getSelected");
	if (!row) {
		$.messager.alert("提示","请选择一条数据权限数据","warning");
		return;
	}
	var iconCls = $(this).find("i").attr("class");
	HgUi.window({id:"dauthCheckWin",title:"数据权限校验",width:600,height:300,iconCls:iconCls,
		url:"/sys/dauth/checkView/" + row.dauthId});
	
});



// 组织提交数据
dauthGrid.makeSubmitData = function() {
	var data = dauthGrid.getEditorsData();
	
	var entityNameEd = dauthGrid.grid.datagrid('getEditor', {
		index : dauthGrid.editingIndex,
		field : "sysMetadataEntity.entityName"
	});
	data.entityId = $(entityNameEd.target).combobox("getValue");
	
	return data;
};








//清空查询---------------------------------------------------------------------------------------------------

dauthGrid.toolbar.find("[tag=clear]").click(function() {
	dauthGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	dauthGrid.grid.datagrid("removeFilterRule");
	dauthGrid.grid.datagrid("load", {});
});

