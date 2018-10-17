var dauthOperatorSupportGrid = new HgUi.Datagrid("dauthOperatorSupport_grid");
dauthOperatorSupportGrid.checkUpdateAuth = true;
dauthOperatorSupportGrid.toolbar = $("#dauthOperatorSupport_toolbar");
dauthOperatorSupportGrid.mode = "rowEdit"; //行编辑模式
dauthOperatorSupportGrid.options.isShowContextMenu = true;
dauthOperatorSupportGrid.options.aboutUrl = "/sys/dauthOperator/aboutOperatorSupport";
dauthOperatorSupportGrid.options.tipCells = ["dauthFilterType.filterTypeName","dauthOperator.operatorName","valueType","descr"];

dauthOperatorSupportGrid.options.onLoadSuccess = function(data) {
	dauthOperatorSupportGrid.grid.datagrid("selectRow",0);
};

dauthOperatorSupportGrid.options.onBeginEdit = function(index,row) {
	if(row.dauthFilterType && row.dauthFilterType.filterTypeId){
		var dauthFilterType = dauthOperatorSupportGrid.grid.datagrid('getEditor', {
			index : index,
			field : "dauthFilterType.filterTypeName"
		});
		$(dauthFilterType.target).combobox("setValue",row.dauthFilterType.filterTypeId);
	}
	if(row.dauthOperator && row.dauthOperator.operatorId){
		var dauthOperator = dauthOperatorSupportGrid.grid.datagrid('getEditor', {
			index : index,
			field : "dauthOperator.operatorName"
		});
		$(dauthOperator.target).combobox("setValue",row.dauthOperator.operatorId);
	}
	if(row.valueType){
		var valueType = dauthOperatorSupportGrid.grid.datagrid('getEditor', {
			index : index,
			field : "valueType"
		});
		$(valueType.target).combobox("setValue",row.valueType);
		$(valueType.target).combobox("setText",HgUtil.getDictItemName('DAUTH_FILTER_VALUE_TYPE',row.valueType));
	}
};

dauthOperatorSupportGrid.init();
dauthOperatorSupportGrid.grid.datagrid("enableFilter",[{
	field:'valueType',
	type:'combobox',
	options:{
		prompt: '---请选择---',
		data:HgUtil.getDictComboboxData('DAUTH_FILTER_VALUE_TYPE'),
   		mode:'remote',
        panelHeight:'auto',
        editable:false,
        onChange:function(value){
        	if (value == ''){
        		dauthOperatorSupportGrid.grid.datagrid('removeFilterRule', 'valueType');
            } else {
            	dauthOperatorSupportGrid.grid.datagrid('addFilterRule', {
                    field: 'valueType',
                    op: 'equal',
                    value: value
                });
            }
        	dauthOperatorSupportGrid.grid.datagrid('doFilter');
        }
    }
}]);
dauthOperatorSupportGrid.bindDefaultToolbarEvent();


// --------------------------保存数据------------------------------------------------------------------
dauthOperatorSupportGrid.toolbar.find("[tag=save]").click(function() {
	if (dauthOperatorSupportGrid.isEditing == true) {
		if (dauthOperatorSupportGrid.grid.datagrid("validateRow", dauthOperatorSupportGrid.editingIndex)) {
			var data = dauthOperatorSupportGrid.makeSubmitData();
			var editRow = dauthOperatorSupportGrid.grid.datagrid("getRows")[dauthOperatorSupportGrid.editingIndex];
			var submitUrl = "/sys/dauthOperator/addSupport";
			if (editRow.supportId) {
				submitUrl = "/sys/dauthOperator/updateSupport";
				data.supportId = editRow.supportId;
			}			
			if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
			HgUtil.post(submitUrl, data, function(data) {
				if (!data.success) {
					dauthOperatorSupportGrid.showMsgbox("error",data.data,330);
				} else {
					HgUi.ok("保存成功!", function() {
						//保存后新增数据首行展示
						if (!editRow.supportId) {
							dauthOperatorSupportGrid.grid.datagrid("load",{"sort":"supportId","order":"desc"});
						}else{
							dauthOperatorSupportGrid.grid.datagrid("reload");
						}
					});
				}
			});

		} else {
			dauthOperatorSupportGrid.showMsgbox("alert","有一条数据未校验通过!",180);
		}
	}

});


//-------------------------删除-----------------------------------------------------------------------
dauthOperatorSupportGrid.toolbar.find("[tag=del]").click(function(){
	var row = dauthOperatorSupportGrid.grid.datagrid("getSelected");
	var rowIndex = dauthOperatorSupportGrid.grid.datagrid('getRowIndex', row);
	if (dauthOperatorSupportGrid.isEditing == true && rowIndex == 0){
		HgUi.alert("未保存的数据无法删除");
		return;
	}
	if (!row) {
		$.messager.alert("提示","请选择一条运算符支持数据","warning");
		return;
	}
	$.messager.confirm("确认删除", "确认将选中的运算符支持删除?", function(r){
		if (r) {
			HgUtil.getJson("/sys/dauthOperator/deleteSupport",{supportId:row.supportId},function(data){
				if (!data.success) {
					$.messager.alert("提示","删除失败,"+data.data,"warning");
				} else {
					HgUi.ok("删除成功!",function(){
						dauthOperatorSupportGrid.grid.datagrid("reload");
					});	
				}
			});
			
		}
	});
	
	
});






// 组织提交数据
dauthOperatorSupportGrid.makeSubmitData = function() {
	var dauthFilterType = dauthOperatorSupportGrid.grid.datagrid('getEditor', {
		index : dauthOperatorSupportGrid.editingIndex,
		field : "dauthFilterType.filterTypeName"
	});
	var dauthOperator = dauthOperatorSupportGrid.grid.datagrid('getEditor', {
		index : dauthOperatorSupportGrid.editingIndex,
		field : "dauthOperator.operatorName"
	});
	var valueType = dauthOperatorSupportGrid.grid.datagrid('getEditor', {
		index : dauthOperatorSupportGrid.editingIndex,
		field : "valueType"
	});
	var descr = dauthOperatorSupportGrid.grid.datagrid('getEditor', {
		index : dauthOperatorSupportGrid.editingIndex,
		field : "descr"
	});

	var data = {
		filterTypeId : $(dauthFilterType.target).combobox("getValue"),
		operatorId : $(dauthOperator.target).combobox("getValue"),
		valueType : $(valueType.target).combobox("getValue"),
		descr : $(descr.target).textbox("getValue")
	};
	return data;
};








//清空查询---------------------------------------------------------------------------------------------------

dauthOperatorSupportGrid.toolbar.find("[tag=clear]").click(function() {
	dauthOperatorSupportGrid.grid.datagrid("removeFilterRule");
	dauthOperatorSupportGrid.grid.datagrid("load", {});
});


//过滤类型配置---------------------------------------------------------------------------------------------------
dauthOperatorSupportGrid.toolbar.find("[tag=filterType]").click(function() {
	var rows = $("#dauthOperatorSupport_grid").datagrid('getPanel').find('.datagrid-row-editing');
	if(rows.length>0){
		HgUi.alert("当前存在未保存信息,请先进行保存!");
		return false;
	}else{
		HgUi.window({id:"dauthFilteTypeWin",title:"过滤器类型配置",width:850,height:400,
			url:"/sys/dauthFilterType/filterTypeView"});
	}
});


//运算符配置---------------------------------------------------------------------------------------------------
dauthOperatorSupportGrid.toolbar.find("[tag=operator]").click(function() {
	var rows = $("#dauthOperatorSupport_grid").datagrid('getPanel').find('.datagrid-row-editing');
	if(rows.length>0){
		HgUi.alert("当前存在未保存信息,请先进行保存!");
		return false;
	}else{
		HgUi.window({id:"dauthOperatorWin",title:"运算符配置",width:850,height:400,
			url:"/sys/dauthOperator/operatorView"});
	}
});
