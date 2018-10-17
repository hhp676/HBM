var dauthFilterItemGrid = new HgUi.Datagrid("dauthFilterItem_grid");
dauthFilterItemGrid.checkUpdateAuth = true;
dauthFilterItemGrid.toolbar = $("#dauthFilterItem_toolbar");
dauthFilterItemGrid.mode = "rowEdit"; //行编辑模式
dauthFilterItemGrid.options.isShowContextMenu = true;
dauthFilterItemGrid.options.aboutUrl = "/sys/dauthFilter/aboutFilterItem";
dauthFilterItemGrid.options.tipCells = ["sysDauthFilterType.filterTypeName","sysMetadataField.fieldName","sysDauthOperator.operatorName","valueType","filterValue","descr"];

//field、operator、valueType、filterValue只会在每次进行编辑时设置值1次
dauthFilterItemGrid.initFieldId = false;
dauthFilterItemGrid.initOperatorId = false;
dauthFilterItemGrid.initValueType = false;
dauthFilterItemGrid.initFilterValue = false;

dauthFilterItemGrid.options.url = G_CTX_PATH+"/sys/dauthFilter/filterItemList?1=1";

dauthFilterItemGrid.options.onSelect = function(index,row) {
	//刷新字段列表
	if (row && row.filterItemId) {
		dauthFilterItemGrid.selectedRow = row;
		if ($('#dauthFilterJoinItemGroup_grid').length > 0) {
			$("#dauthFilterJoinItemGroup_grid").datagrid({url:G_CTX_PATH+"/sys/dauthFilter/filterJoinList?filterItemId=" + row.filterItemId});
		}
	}else{
		if ($('#dauthFilterJoinItemGroup_grid').length > 0) {
			//清空原有数据
			$("#dauthFilterJoinItemGroup_grid").datagrid({url:G_CTX_PATH+"/sys/dauthFilter/filterJoinList?filterItemId=-1"});
		}
	}
}

dauthFilterItemGrid.options.onLoadSuccess = function(data) {
	dauthFilterItemGrid.grid.datagrid("selectRow",0);
};

dauthFilterItemGrid.filterTypeIdFormat = function(value,row,index) {
	if (row.sysDauthFilterType && row.sysDauthFilterType.filterTypeName) {
		return row.sysDauthFilterType.filterTypeName;
	}
	return "";
}

dauthFilterItemGrid.fieldIdFormat = function(value,row,index) {
	if (row.sysMetadataField && row.sysMetadataField.fieldName) {
		return row.sysMetadataField.fieldName;
	}
	return "";
}

dauthFilterItemGrid.operatorIdFormat = function(value,row,index) {
	if (row.sysDauthOperator && row.sysDauthOperator.operatorName) {
		return row.sysDauthOperator.operatorName;
	}
	return "";
}

dauthFilterItemGrid.filterValueFormat = function(value,row,index) {
	return row.filterValueStr;
}

dauthFilterItemGrid.filterTypeLoadSuccess = function(data) {
	var editRow = dauthFilterItemGrid.grid.datagrid("getRows")[dauthFilterItemGrid.editingIndex];
	if (editRow.sysDauthFilterType && editRow.sysDauthFilterType.filterTypeId) {
		var sysDauthFilterType = dauthFilterItemGrid.grid.datagrid('getEditor', {
			index : dauthFilterItemGrid.editingIndex,
			field : "sysDauthFilterType.filterTypeName"
		});
		$(sysDauthFilterType.target).combobox("setValue",editRow.sysDauthFilterType.filterTypeId);
	}
}


dauthFilterItemGrid.filterTypeChange = function(newValue,oldValue) {
	if (!newValue || isNaN(newValue)) {
		return;
	}
	var _operatorId = undefined;
	if (!dauthFilterItemGrid.initOperatorId) {
		var editRow = dauthFilterItemGrid.grid.datagrid("getRows")[dauthFilterItemGrid.editingIndex];
		if (editRow.sysDauthOperator && editRow.sysDauthOperator.operatorId) {
			_operatorId = editRow.sysDauthOperator.operatorId;
		}
		dauthFilterItemGrid.initOperatorId = true;
	}
	
	var _fieldId = undefined;
	if (!dauthFilterItemGrid.initFieldId) {
		var editRow = dauthFilterItemGrid.grid.datagrid("getRows")[dauthFilterItemGrid.editingIndex];
		if (editRow.sysMetadataField && editRow.sysMetadataField.fieldId) {
			_fieldId = editRow.sysMetadataField.fieldId;
		}
		dauthFilterItemGrid.initFieldId = true;
	}
	
	var _opts = $(this).combobox("options");
	var _filterTypeRow = _opts.finder.getRow(this, newValue);
	var _filterTypeType = _filterTypeRow.type;
	dauthFilterItemGrid.loadDauthField(newValue, _fieldId, _filterTypeType);
	dauthFilterItemGrid.loadDauthOperator(newValue, _operatorId);
}

dauthFilterItemGrid.operatorChange = function(newValue,oldValue) {
	if (!newValue || isNaN(newValue)) {
		return;
	}
	var _valueType = undefined;
	if (!dauthFilterItemGrid.initValueType) {
		var editRow = dauthFilterItemGrid.grid.datagrid("getRows")[dauthFilterItemGrid.editingIndex];
		if (editRow.valueType) {
			_valueType = editRow.valueType;
		}
		dauthFilterItemGrid.initValueType = true;
	}
	
	var _filterTypeId = undefined;
	var sysDauthFilterType = dauthFilterItemGrid.grid.datagrid('getEditor', {
		index : dauthFilterItemGrid.editingIndex,
		field : "sysDauthFilterType.filterTypeName"
	});
	_filterTypeId = $(sysDauthFilterType.target).combobox("getValue");
	
	
	dauthFilterItemGrid.loadValueType(_filterTypeId, newValue, _valueType);
}

dauthFilterItemGrid.valueTypeChange = function(newValue,oldValue) {
	if (!newValue || isNaN(newValue)) {
		return;
	}
	dauthFilterItemGrid.loadFilterValue(newValue);
}

//加载字段
dauthFilterItemGrid.loadDauthField = function (filterTypeId, value, filterTypeType) {
	var fieldIdEd = dauthFilterItemGrid.grid.datagrid('getEditor', {
		index : dauthFilterItemGrid.editingIndex,
		field : "sysMetadataField.fieldName"
	});
	// 2:普通类型，即为数据库字段
	if (!filterTypeType || filterTypeType != '2') {
		$(fieldIdEd.target).combobox("setValue",'');
		$(fieldIdEd.target).combobox("disable");
		return;
	}
	
	$(fieldIdEd.target).combobox("enable");
	
	if (filterTypeId) {
		_entityId = sysMetadataEntityFilterItemGrid.selectedRow.entityId;
		$(fieldIdEd.target).combobox("options").url = G_CTX_PATH + '/sys/sysMetadata/getFieldList/' + _entityId + "/" + filterTypeId;
		$(fieldIdEd.target).combobox("options").onLoadSuccess = function(data) {
			if (data) {
				for (var i in data) {
					if (data[i].fieldId == value) {
						$(fieldIdEd.target).combobox("setValue",value);
						return;
					}
				}
			}
			$(fieldIdEd.target).combobox("setValue", "");
		}
		$(fieldIdEd.target).combobox("reload");
	} else {
		$(fieldIdEd.target).combobox("clear");
	}
		
}

//加载运算符
dauthFilterItemGrid.loadDauthOperator = function(filterTypeId, value){
	var sysDauthOperator = dauthFilterItemGrid.grid.datagrid('getEditor', {
		index : dauthFilterItemGrid.editingIndex,
		field : "sysDauthOperator.operatorName"
	});
	if (filterTypeId) {
		$(sysDauthOperator.target).combobox("options").url = G_CTX_PATH + '/sys/dauthOperator/getSupportOperators/' + filterTypeId;
		$(sysDauthOperator.target).combobox("options").onLoadSuccess = function(data){
			if (data) {
				for (var i in data) {
					if (data[i].operatorId == value) {
						$(sysDauthOperator.target).combobox("setValue", value);
						return;
					}
				}
			}
			$(sysDauthOperator.target).combobox("setValue", "");
		}
		$(sysDauthOperator.target).combobox("reload");
	} else {
		$(sysDauthOperator.target).combobox("clear");
	}
}

//加载值类型
dauthFilterItemGrid.loadValueType = function(filterTypeId, operatorId, value){
	var valueType = dauthFilterItemGrid.grid.datagrid('getEditor', {
		index : dauthFilterItemGrid.editingIndex,
		field : "valueType"
	});
	if (filterTypeId && operatorId) {
		$(valueType.target).combobox("options").url = G_CTX_PATH + '/sys/dauthOperator/getSupportValueTypes/' + filterTypeId + "/" + operatorId;
		$(valueType.target).combobox("options").onLoadSuccess = function(data){
			if (data) {
				for (var i in data) {
					if (data[i].itemValue == value) {
						$(valueType.target).combobox("setValue", value);
						return;
					}
				}
			}
			$(valueType.target).combobox("setValue", "");
		}
		$(valueType.target).combobox("reload");
		
	} else {
		$(valueType.target).combobox("clear");
	}
}

//加载值
dauthFilterItemGrid.loadFilterValue = function(valueType){
	
	var filterValueEd = dauthFilterItemGrid.grid.datagrid('getEditor', {
		index : dauthFilterItemGrid.editingIndex,
		field : "filterValue"
	});
	
	// 1：自定义sql 2：自定义值 3：数据权限变量 4：岗位 5：职务 6：当前用户
	var _opts = {disabled : false};
	if (valueType == '3' || valueType == '4' || valueType == '5') {
		// 数据权限变量、岗位、职务，不可编辑，选择窗
		_opts.editable = false;
		_opts.buttonText = "...";
		_opts.onClickButton = function() {
			dauthFilterItemGrid.filterValueClickBtnFn(valueType);
		}
	} else {
		_opts.buttonText = '';
		_opts.onClickButton = function() {};
		if (valueType == '1' || valueType == '2') {
			// 自定义sql、自定义值，手动输入
			_opts.editable = true;
		} else {
			// 当前用户，值不可编辑，无需录入
			_opts.editable = false;
			_opts.disabled = true;
		}
	}
	$(filterValueEd.target).textbox(_opts);
	$(filterValueEd.target).textbox("setValue", '');
}


dauthFilterItemGrid.filterValueClickBtnFn = function(valueType) {
		//弹窗选择具体的过滤器项值
		var _operatorEd = dauthFilterItemGrid.grid.datagrid('getEditor', {
			index : dauthFilterItemGrid.editingIndex,
			field : "sysDauthOperator.operatorName"
		});
		var _operator_opts = $(_operatorEd.target).combobox("options");
		var _operator_value = $(_operatorEd.target).combobox("getValue");
		var _filterValueRow = _operator_opts.finder.getRow(_operatorEd.target[0], _operator_value);
		var _operatorCode = _filterValueRow.operatorCode;
		dauthFilterItemGrid.selFilterValue(valueType, _operatorCode);
}

//选择值方法----数据权限变量、岗位、职务
dauthFilterItemGrid.selFilterValue = function(valueType, operatorCode) {
	/* 说明：3:数据权限变量、4:岗位、5:职务
	 * 1、valueType 为 数据权限变量  时，为单选；
	 * 2、其他：只有operatorCode 为 'in'/'notin'/'contains'/'notcontains'时允许多选
	 */
	var _selectMode = "single";
	if (operatorCode == 'in' || operatorCode == 'notin' || operatorCode == 'contains' || operatorCode == 'notcontains') {
		_selectMode = "multiple";
	}
	if (valueType == '3') {
		HgUtil.chooseDauthVariable({}, function(row) {
			dauthFilterItemGrid.setFilterValueText(row.variableId, row.variableName);
		});
	} else if (valueType == '4') {
		HgUtil.chooseSysPosition(_selectMode, [], function(positionIds,rows){
			if(rows && rows.length > 0){
				var _positionNames = new Array();
				$.each(rows, function(i,n) {
					_positionNames.push(n.name);
				});
				dauthFilterItemGrid.setFilterValueText(positionIds.join(","), _positionNames.join(","));
			}
		});
	} else if (valueType == '5') {
		HgUtil.chooseSysJob(_selectMode, {}, function(rows) {
			if(rows && rows.length > 0){
				var _variableIds = new Array();
				var _varialbeNames = new Array();
				$.each(rows, function(i,n) {
					_variableIds.push(n.jobId);
					_varialbeNames.push(n.jobName);
				});
				dauthFilterItemGrid.setFilterValueText(_variableIds.join(","), _varialbeNames.join(","));
			}
		});
	}
}

dauthFilterItemGrid.setFilterValueText = function(value, text) {
	var filterValueEd = dauthFilterItemGrid.grid.datagrid('getEditor', {
		index : dauthFilterItemGrid.editingIndex,
		field : "filterValue"
	});
	$(filterValueEd.target).textbox("setValue", value);
	$(filterValueEd.target).textbox("setText", text);
}

//预先设置editingIndex，为各个editor加载数据用
dauthFilterItemGrid.options.onBeforeEdit = function(index,row) {
	//dauthFilterItemGrid.editingIndex = index;
	dauthFilterItemGrid.initFieldId = false;
	dauthFilterItemGrid.initOperatorId = false;
	dauthFilterItemGrid.initValueType = false;
	dauthFilterItemGrid.initFilterValue = false;
}

dauthFilterItemGrid.options.onBeginEdit = function(index,row) {
	var filterValueEd = dauthFilterItemGrid.grid.datagrid('getEditor', {
		index : dauthFilterItemGrid.editingIndex,
		field : "filterValue"
	});
	if (row.filterValue) {
		$(filterValueEd.target).textbox("setValue", row.filterValue);
		$(filterValueEd.target).textbox("setText", row.filterValueStr);
	}
	
};

dauthFilterItemGrid.init();
dauthFilterItemGrid.grid.datagrid("enableFilter",[
	{
		field:'valueType',
		type:'combobox',
		options:{
			prompt: '---请选择---',
			data:HgUtil.getDictComboboxData("DAUTH_FILTER_VALUE_TYPE"),
	   		mode:'remote',
	        panelHeight:'auto',
	        editable:false,
	        onChange:function(value){
	        	if (value == ''){
	        		dauthFilterItemGrid.grid.datagrid('removeFilterRule', 'valueType');
	            } else {
	            	dauthFilterItemGrid.grid.datagrid('addFilterRule', {
	                    field: 'valueType',
	                    op: 'equal',
	                    value: value
	                });
	            }
	        	dauthFilterItemGrid.grid.datagrid('doFilter');
	        }
	    }
	},
	{
		field:'filterValue',
		type:'textbox',
		options:{disabled:true}
	}
]);
dauthFilterItemGrid.bindDefaultToolbarEvent();



// --------------------------保存数据------------------------------------------------------------------
dauthFilterItemGrid.toolbar.find("[tag=save]").click(function() {
	if (dauthFilterItemGrid.isEditing == true) {
		if (dauthFilterItemGrid.grid.datagrid("validateRow", dauthFilterItemGrid.editingIndex)) {
			var data = dauthFilterItemGrid.makeSubmitData();
			var editRow = dauthFilterItemGrid.grid.datagrid("getRows")[dauthFilterItemGrid.editingIndex];
			var submitUrl = "/sys/dauthFilter/addFilterItem";
			if (editRow.filterItemId) {
				submitUrl = "/sys/dauthFilter/updateFilterItem";
				data.filterItemId = editRow.filterItemId;
			} else {
				data.entityId = sysMetadataEntityFilterItemGrid.selectedRow.entityId;
			}
			if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
			HgUtil.post(submitUrl, data, function(data) {
				if (!data.success) {
					dauthFilterItemGrid.showMsgbox("error",data.data,330);
				} else {
					HgUi.ok("保存成功!",function(){
						dauthFilterItemGrid.grid.datagrid("reload");
					});
				}
			});
		} else {
			dauthFilterItemGrid.showMsgbox("alert","有一条数据未校验通过!",180);
		}
	}

});


//-------------------------删除-----------------------------------------------------------------------
dauthFilterItemGrid.toolbar.find("[tag=del]").click(function(){
	var row = dauthFilterItemGrid.grid.datagrid("getSelected");
	var rowIndex = dauthFilterItemGrid.grid.datagrid('getRowIndex', row);
	if (dauthFilterItemGrid.isEditing == true && rowIndex == 0){
		HgUi.alert("未保存的数据无法删除");
		return;
	}
	if (!row) {
		HgUi.alert("请选择一条过滤器项数据");
		return;
	}
	$.messager.confirm("确认删除", "确认将选中的过滤器项删除?", function(r){
		if (r) {
			HgUtil.getJson("/sys/dauthFilter/deleteFilterItem",{filterItemId:row.filterItemId},function(data){
				if (!data.success) {
					HgUi.alert("删除失败,"+data.data);
				} else {
					HgUi.ok("删除成功!",function(){
						dauthFilterItemGrid.grid.datagrid("reload");
					});	
				}
			});
			
		}
	});
	
	
});

//-------------------------数据权限变量配置-----------------------------------------------------------------------
dauthFilterItemGrid.toolbar.find("[tag=dauthVariable]").click(function(){
	var rows = $("#dauthFilterItem_grid").datagrid('getPanel').find('.datagrid-row-editing');
	if(rows.length>0){
		HgUi.alert("当前存在未保存信息,请先进行保存!");
		return false;
	}else{
		var iconCls = $(this).linkbutton("options").iconCls;
		HgUi.window({id:"dauthVariableWin",title:"数据权限变量配置",width:850,height:400,iconCls:iconCls,
			url:"/sys/dauthVariable/view"});
	}
});






// 组织提交数据
dauthFilterItemGrid.makeSubmitData = function() {
	
	var data = dauthFilterItemGrid.getEditorsData();
	
	var filterTypeIdEd = dauthFilterItemGrid.grid.datagrid('getEditor', {
		index : dauthFilterItemGrid.editingIndex,
		field : "sysDauthFilterType.filterTypeName"
	});
	var fieldIdEd = dauthFilterItemGrid.grid.datagrid('getEditor', {
		index : dauthFilterItemGrid.editingIndex,
		field : "sysMetadataField.fieldName"
	});
	var operatorIdEd = dauthFilterItemGrid.grid.datagrid('getEditor', {
		index : dauthFilterItemGrid.editingIndex,
		field : "sysDauthOperator.operatorName"
	});
	data.filterTypeId = $(filterTypeIdEd.target).combobox("getValue");
	data.fieldId = $(fieldIdEd.target).combobox("getValue");
	data.operatorId = $(operatorIdEd.target).combobox("getValue");
	
	return data;
};








//清空查询---------------------------------------------------------------------------------------------------

dauthFilterItemGrid.toolbar.find("[tag=clear]").click(function() {
	dauthFilterItemGrid.grid.datagrid("removeFilterRule");
	dauthFilterItemGrid.grid.datagrid("load", {});
});


