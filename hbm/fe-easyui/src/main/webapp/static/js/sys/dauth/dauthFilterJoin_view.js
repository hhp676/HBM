var dauthFilterJoinGrid = new HgUi.Datagrid("dauthFilterJoin_grid");
dauthFilterJoinGrid.checkUpdateAuth = true;
dauthFilterJoinGrid.toolbar = $("#dauthFilterJoin_toolbar");
dauthFilterJoinGrid.mode = "rowEdit"; //行编辑模式
dauthFilterJoinGrid.options.isShowContextMenu = true;
dauthFilterJoinGrid.options.aboutUrl = "/sys/dauthFilter/aboutFilterJoin";
dauthFilterJoinGrid.options.tipCells = ["sysDauthFilterItem.sysMetadataField.fieldName","sysDauthFilterItem.filterValueStr","descr"];

dauthFilterJoinGrid.options.onLoadSuccess = function(data) {
	dauthFilterJoinGrid.grid.datagrid("selectRow",0);
};


dauthFilterJoinGrid.clickFilterItemBtn = function() {
	window.sysdauthFilterItemChooseWinCallback = function(row){
		var filterItemIdEd = dauthFilterJoinGrid.grid.datagrid('getEditor', {
			index:dauthFilterJoinGrid.editingIndex,
			field:"sysDauthFilterItem.sysDauthFilterType.filterTypeName"
		});
		var filterItemFieldEd = dauthFilterJoinGrid.grid.datagrid('getEditor', {
			index:dauthFilterJoinGrid.editingIndex,
			field:"sysDauthFilterItem.sysMetadataField.fieldName"
		});
		var filterItemOperatorEd = dauthFilterJoinGrid.grid.datagrid('getEditor', {
			index:dauthFilterJoinGrid.editingIndex,
			field:"sysDauthFilterItem.sysDauthOperator.operatorName"
		});
		var filterItemValueTypeEd = dauthFilterJoinGrid.grid.datagrid('getEditor', {
			index:dauthFilterJoinGrid.editingIndex,
			field:"sysDauthFilterItem.valueType"
		});
		var filterItemValueEd = dauthFilterJoinGrid.grid.datagrid('getEditor', {
			index:dauthFilterJoinGrid.editingIndex,
			field:"sysDauthFilterItem.filterValueStr"
		});
		$(filterItemIdEd.target).textbox("setValue",row.filterItemId);
		$(filterItemIdEd.target).textbox("setText",row.sysDauthFilterType.filterTypeName);
		if (row.sysMetadataField) {
			$(filterItemFieldEd.target).textbox("setText",row.sysMetadataField.fieldName);
		}
		$(filterItemOperatorEd.target).textbox("setText",row.sysDauthOperator.operatorName);
		$(filterItemValueTypeEd.target).textbox("setText",HgUtil.getDictItemName('DAUTH_FILTER_VALUE_TYPE', row.valueType));
		$(filterItemValueEd.target).textbox("setText",row.filterValueStr);
	};
	
	HgUi.window({id:"sysDauthFilterItemListWin",title:"选择过滤器项",width:750,height:400,
		url:"/sys/dauthFilter/chooseFilterItemView/" + dauthFilterJoin_entityId});
}

dauthFilterJoinGrid.options.onBeginEdit = function(index,row) {
	var filterItemIdEd = dauthFilterJoinGrid.grid.datagrid('getEditor', {
		index:dauthFilterJoinGrid.editingIndex,
		field:"sysDauthFilterItem.sysDauthFilterType.filterTypeName"
	});
	var filterItemValueTypeEd = dauthFilterJoinGrid.grid.datagrid('getEditor', {
		index:dauthFilterJoinGrid.editingIndex,
		field:"sysDauthFilterItem.valueType"
	});
	if (row.filterItemId) {
		$(filterItemIdEd.target).textbox("setValue", row.filterItemId);
		$(filterItemIdEd.target).textbox("setText", row.sysDauthFilterItem.sysDauthFilterType.filterTypeName);
		
		$(filterItemValueTypeEd.target).textbox("setText",HgUtil.getDictItemName('DAUTH_FILTER_VALUE_TYPE', row.sysDauthFilterItem.valueType));
	}
	
};


dauthFilterJoinGrid.init();
dauthFilterJoinGrid.grid.datagrid("enableFilter",[
	{
		field:'sysDauthFilterItem.valueType',
		type:'combobox',
		options:{
			prompt:'---请选择---',
			data:HgUtil.getDictComboboxData("DAUTH_FILTER_VALUE_TYPE"),
	   		mode:'remote',
	        panelHeight:'auto',
	        editable:false,
	        onChange:function(value){
	        	if (value == ''){
	        		dauthFilterJoinGrid.grid.datagrid('removeFilterRule', 'sysDauthFilterItem.valueType');
	            } else {
	            	dauthFilterJoinGrid.grid.datagrid('addFilterRule', {
	                    field: 'sysDauthFilterItem.valueType',
	                    op: 'equal',
	                    value: value
	                });
	            }
	        	dauthFilterJoinGrid.grid.datagrid('doFilter');
	        }
	    }
	},
	{
		field:'sysDauthFilterItem.filterValueStr',
		type:'textbox',
		options:{disabled:true}
	}
]);
dauthFilterJoinGrid.bindDefaultToolbarEvent();

// --------------------------保存数据------------------------------------------------------------------
dauthFilterJoinGrid.toolbar.find("[tag=save]").click(function() {
	if (dauthFilterJoinGrid.isEditing == true) {
		if (dauthFilterJoinGrid.grid.datagrid("validateRow", dauthFilterJoinGrid.editingIndex)) {
			var data = dauthFilterJoinGrid.makeSubmitData();
			var editRow = dauthFilterJoinGrid.grid.datagrid("getRows")[dauthFilterJoinGrid.editingIndex];
			var submitUrl = "/sys/dauthFilter/addFilterJoin";
			if (editRow.joinId) {
				submitUrl = "/sys/dauthFilter/updateFilterJoin";
				data.joinId = editRow.joinId;
			}
			if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
			HgUtil.post(submitUrl, data, function(data) {
				if (!data.success) {
					dauthFilterJoinGrid.showMsgbox("error",data.data,330);
				} else {
					dauthFilterJoinGrid.grid.datagrid('reload');
				}
			});

		} else {
			dauthFilterJoinGrid.showMsgbox("alert","有一条数据未校验通过!",180);
		}
	}

});


//-------------------------删除-----------------------------------------------------------------------
dauthFilterJoinGrid.toolbar.find("[tag=del]").click(function(){
	var row = dauthFilterJoinGrid.grid.datagrid("getSelected");
	if (!row) {
		HgUi.alert("请选择一条过滤器项数据");
		return;
	}
	$.messager.confirm("确认删除", "确认将选中的过滤器项删除?", function(r){
		if (r) {
			HgUtil.getJson("/sys/dauthFilter/deleteFilterJoin",{joinId:row.joinId},function(data){
				if (!data.success) {
					HgUi.alert("删除失败,"+data.data);
				} else {
					HgUi.ok("删除成功!",function(){
						dauthFilterJoinGrid.grid.datagrid("reload");
					});	
				}
			});
			
		}
	});
	
	
});






// 组织提交数据
dauthFilterJoinGrid.makeSubmitData = function() {
	var data = dauthFilterJoinGrid.getEditorsData();
	var filterItemIdEd = dauthFilterJoinGrid.grid.datagrid('getEditor', {
		index : dauthFilterJoinGrid.editingIndex,
		field : "sysDauthFilterItem.sysDauthFilterType.filterTypeName"
	});
	
	data.filterItemId = $(filterItemIdEd.target).textbox("getValue");
	data.filterGroupId = dauthFilterJoin_filterGroupId;
	return data;
};


//清空查询---------------------------------------------------------------------------------------------------
dauthFilterJoinGrid.toolbar.find("[tag=clear]").click(function() {
	dauthFilterJoinGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	dauthFilterJoinGrid.grid.datagrid("removeFilterRule");
	dauthFilterJoinGrid.grid.datagrid("load", {});
});