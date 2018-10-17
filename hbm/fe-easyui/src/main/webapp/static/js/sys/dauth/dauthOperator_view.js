var dauthOperatorGrid = new HgUi.Datagrid("dauthOperator_grid");
dauthOperatorGrid.checkUpdateAuth = true;
dauthOperatorGrid.toolbar = $("#dauthOperator_toolbar");
dauthOperatorGrid.mode = "rowEdit"; //行编辑模式
dauthOperatorGrid.options.isShowContextMenu = true;
dauthOperatorGrid.options.aboutUrl = "/sys/dauthOperator/aboutOperator";
dauthOperatorGrid.options.tipCells = ["operatorCode","operatorName","operatorValue","engName","i18nCode","descr"];

dauthOperatorGrid.options.onLoadSuccess = function(data) {
	dauthOperatorGrid.grid.datagrid("selectRow",0);
};
dauthOperatorGrid.init();
dauthOperatorGrid.grid.datagrid("enableFilter");
dauthOperatorGrid.bindDefaultToolbarEvent();

// --------------------------保存数据------------------------------------------------------------------
dauthOperatorGrid.toolbar.find("[tag=save]").click(function() {
	if (dauthOperatorGrid.isEditing == true) {
		if (dauthOperatorGrid.grid.datagrid("validateRow", dauthOperatorGrid.editingIndex)) {
			var data = dauthOperatorGrid.makeSubmitData();
			var editRow = dauthOperatorGrid.grid.datagrid("getRows")[dauthOperatorGrid.editingIndex];
			var submitUrl = "/sys/dauthOperator/addOperator";
			if (editRow.operatorId) {
				submitUrl = "/sys/dauthOperator/updateOperator";
				data.operatorId = editRow.operatorId;
			}
			if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
			HgUtil.post(submitUrl, data, function(data) {
				if (!data.success) {
					dauthOperatorGrid.showMsgbox("error",data.data,330);
				} else {
					HgUi.ok("保存成功!", function() {
						dauthOperatorGrid.grid.datagrid('reload');
					});
				}
			});

		} else {
			dauthOperatorGrid.showMsgbox("alert","有一条数据未校验通过!",180);
		}
	}

});


//-------------------------删除-----------------------------------------------------------------------
dauthOperatorGrid.toolbar.find("[tag=del]").click(function(){
	var row = dauthOperatorGrid.grid.datagrid("getSelected");
	var rowIndex = dauthOperatorGrid.grid.datagrid('getRowIndex', row);
	if (dauthOperatorGrid.isEditing == true && rowIndex == 0){
		HgUi.alert("未保存的数据无法删除");
		return;
	}
	if (!row) {
		HgUi.alert("请选择一条运算符数据");
		return;
	}
	$.messager.confirm("确认删除", "确认将选中的运算符删除?", function(r){
		if (r) {
			HgUtil.getJson("/sys/dauthOperator/deleteOperator",{operatorId:row.operatorId},function(data){
				if (!data.success) {
					HgUi.alert("删除失败,"+data.data);
				} else {
					HgUi.ok("删除成功!",function(){
						dauthOperatorGrid.grid.datagrid("reload");
					});	
				}
			});
			
		}
	});
	
	
});






// 组织提交数据
dauthOperatorGrid.makeSubmitData = function() {
	var operatorCode = dauthOperatorGrid.grid.datagrid('getEditor', {
		index : dauthOperatorGrid.editingIndex,
		field : "operatorCode"
	});
	var operatorName = dauthOperatorGrid.grid.datagrid('getEditor', {
		index : dauthOperatorGrid.editingIndex,
		field : "operatorName"
	});
	var operatorValue = dauthOperatorGrid.grid.datagrid('getEditor', {
		index : dauthOperatorGrid.editingIndex,
		field : "operatorValue"
	});
	var engName = dauthOperatorGrid.grid.datagrid('getEditor', {
		index : dauthOperatorGrid.editingIndex,
		field : "engName"
	});
	var i18nCode = dauthOperatorGrid.grid.datagrid('getEditor', {
		index : dauthOperatorGrid.editingIndex,
		field : "i18nCode"
	});
	var descr = dauthOperatorGrid.grid.datagrid('getEditor', {
		index : dauthOperatorGrid.editingIndex,
		field : "descr"
	});

	var data = {
		operatorCode : $(operatorCode.target).textbox("getValue"),
		operatorName : $(operatorName.target).textbox("getValue"),
		operatorValue : $(operatorValue.target).textbox("getValue"),
		engName : $(engName.target).textbox("getValue"),
		i18nCode : $(i18nCode.target).textbox("getValue"),
		descr : $(descr.target).textbox("getValue")
	};
	return data;
};








//清空查询---------------------------------------------------------------------------------------------------

dauthOperatorGrid.toolbar.find("[tag=clear]").click(function() {
	dauthOperatorGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	dauthOperatorGrid.grid.datagrid("removeFilterRule");
	dauthOperatorGrid.grid.datagrid("load", {});
});
