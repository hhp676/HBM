var dauthFilterTypeGrid = new HgUi.Datagrid("dauthFilterType_grid");
dauthFilterTypeGrid.checkUpdateAuth = true;
dauthFilterTypeGrid.toolbar = $("#dauthFilterType_toolbar");
dauthFilterTypeGrid.mode = "rowEdit"; //行编辑模式
dauthFilterTypeGrid.options.isShowContextMenu = true;
dauthFilterTypeGrid.options.aboutUrl = "/sys/dauthFilterType/aboutOne";
dauthFilterTypeGrid.options.tipCells = ["filterTypeCode", "filterTypeName", "engName", "i18nCode", "descr"];

dauthFilterTypeGrid.options.onLoadSuccess = function(data) {
	dauthFilterTypeGrid.grid.datagrid("selectRow",0);
};
dauthFilterTypeGrid.init();
dauthFilterTypeGrid.grid.datagrid("enableFilter",[{
	field:'type',
	type:'combobox',
	options:{
		prompt: '---请选择---',
		data:HgUtil.getDictComboboxData('DAUTH_FILTER_TYPE_TYPE'),
   		mode:'remote',
        panelHeight:'auto',
        editable:false,
        onChange:function(value){
        	if (value == ''){
        		dauthFilterTypeGrid.grid.datagrid('removeFilterRule', 'type');
            } else {
            	dauthFilterTypeGrid.grid.datagrid('addFilterRule', {
                    field: 'type',
                    op: 'equal',
                    value: value
                });
            }
        	dauthFilterTypeGrid.grid.datagrid('doFilter');
        }
    }
}]);
dauthFilterTypeGrid.bindDefaultToolbarEvent();

// --------------------------保存数据------------------------------------------------------------------
dauthFilterTypeGrid.toolbar.find("[tag=save]").click(function() {
	if (dauthFilterTypeGrid.isEditing == true) {
		if (dauthFilterTypeGrid.grid.datagrid("validateRow", dauthFilterTypeGrid.editingIndex)) {
			var data = dauthFilterTypeGrid.makeSubmitData();
			var editRow = dauthFilterTypeGrid.grid.datagrid("getRows")[dauthFilterTypeGrid.editingIndex];
			var submitUrl = "/sys/dauthFilterType/addFilterType";
			if (editRow.filterTypeId) {
				submitUrl = "/sys/dauthFilterType/updateFilterType";
				data.filterTypeId = editRow.filterTypeId;
			}	
			if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
			HgUtil.post(submitUrl, data, function(data) {
				if (!data.success) {
					dauthFilterTypeGrid.showMsgbox("error",data.data,330);
				} else {
					HgUi.ok("保存成功!",function(){
						dauthFilterTypeGrid.grid.datagrid('reload');
					});
				}
			});

		} else {
			dauthFilterTypeGrid.showMsgbox("alert","有一条数据未校验通过!",180);
		}
	}

});


//-------------------------删除-----------------------------------------------------------------------
dauthFilterTypeGrid.toolbar.find("[tag=del]").click(function(){
	var row = dauthFilterTypeGrid.grid.datagrid("getSelected");
	var rowIndex = dauthFilterTypeGrid.grid.datagrid('getRowIndex', row);
	if (dauthFilterTypeGrid.isEditing == true && rowIndex == 0){
		HgUi.alert("未保存的数据无法删除");
		return;
	}
	if (!row) {
		HgUi.alert("请选择一条过滤类型数据");
		return;
	}
	$.messager.confirm("确认删除", "确认将选中的过滤类型删除?", function(r){
		if (r) {
			HgUtil.getJson("/sys/dauthFilterType/deleteFilterType",{filterTypeId:row.filterTypeId},function(data){
				if (!data.success) {
					HgUi.alert("删除失败,"+data.data);
				} else {
					HgUi.ok("删除成功!",function(){
						dauthFilterTypeGrid.grid.datagrid("reload");
					});	
				}
			});
			
		}
	});
	
	
});






// 组织提交数据
dauthFilterTypeGrid.makeSubmitData = function() {
	var filterTypeCode = dauthFilterTypeGrid.grid.datagrid('getEditor', {
		index : dauthFilterTypeGrid.editingIndex,
		field : "filterTypeCode"
	});
	var filterTypeName = dauthFilterTypeGrid.grid.datagrid('getEditor', {
		index : dauthFilterTypeGrid.editingIndex,
		field : "filterTypeName"
	});
	var type = dauthFilterTypeGrid.grid.datagrid('getEditor', {
		index : dauthFilterTypeGrid.editingIndex,
		field : "type"
	});
	var engName = dauthFilterTypeGrid.grid.datagrid('getEditor', {
		index : dauthFilterTypeGrid.editingIndex,
		field : "engName"
	});
	var i18nCode = dauthFilterTypeGrid.grid.datagrid('getEditor', {
		index : dauthFilterTypeGrid.editingIndex,
		field : "i18nCode"
	});
	var descr = dauthFilterTypeGrid.grid.datagrid('getEditor', {
		index : dauthFilterTypeGrid.editingIndex,
		field : "descr"
	});

	var data = {
		filterTypeCode : $(filterTypeCode.target).textbox("getValue"),
		filterTypeName : $(filterTypeName.target).textbox("getValue"),
		type : $(type.target).combobox("getValue"),
		engName : $(engName.target).textbox("getValue"),
		i18nCode : $(i18nCode.target).textbox("getValue"),
		descr : $(descr.target).textbox("getValue")
	};
	return data;
};








//清空查询---------------------------------------------------------------------------------------------------

dauthFilterTypeGrid.toolbar.find("[tag=clear]").click(function() {
	dauthFilterTypeGrid.grid.datagrid("removeFilterRule");
	dauthFilterTypeGrid.grid.datagrid("load", {});
});
