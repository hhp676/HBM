/**
 * 
 */
var sysOperationGrid = new HgUi.Datagrid("sysOperation_grid");
sysOperationGrid.checkUpdateAuth = true;
sysOperationGrid.toolbar = $("#sysOperation_toolbar");
sysOperationGrid.options = {
	onBeginEdit: function(index, row) {
		var isVisibleEd = sysOperationGrid.grid.datagrid('getEditor', {
			index : index,
			field : "isVisible"
		});
		$(isVisibleEd.target).combobox("setText",HgUtil.getDictItemName('trueOrFalse',row.isVisible));	
	}
};
sysOperationGrid.options.tipCells = ["operationCode","operationName","engName","i18nCode","style","uri","sortNo","isVisible","tip","descr"];
sysOperationGrid.mode = "rowEdit"; // 行编辑模式
sysOperationGrid.init();
sysOperationGrid.grid.datagrid('enableFilter', [
	{
	    field: 'isVisible',
	    type: 'combobox',
	    options: {
	    	prompt: '---请选择---',
	    	data:HgUtil.getDictComboboxData('trueOrFalse'),
	        panelHeight: 'auto',
	        editable:false,
	        onChange: function(value) {
		        if (value == ''){
			        sysOperationGrid.grid.datagrid('removeFilterRule', 'isVisible');
		        }
		        else{
			        sysOperationGrid.grid.datagrid('addFilterRule', {
			            field: 'isVisible',
			            op: 'equal',
			            value: value
			        });
		        }
		        sysOperationGrid.grid.datagrid('doFilter');
	        }
	    }
	}
]);
sysOperationGrid.bindDefaultToolbarEvent();

// --------------------------保存数据------------------------------------------------------------------
sysOperationGrid.toolbar.find("[tag=save]").click(function() {
	if (sysOperationGrid.isEditing == true){
		if (sysOperationGrid.grid.datagrid("validateRow", sysOperationGrid.editingIndex)){
			var data = sysOperationGrid.getEditorsData();
			//console.log(data);
			var editRow = sysOperationGrid.grid.datagrid("getRows")[sysOperationGrid.editingIndex];
			var submitUrl = "/sys/sysOperation/create";
			if (editRow.operationId){
				submitUrl = "/sys/sysOperation/update";
				data.operationId = editRow.operationId;
			}
			if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
			HgUtil.post(submitUrl, data, function(data) {
				if (!data.success){
					sysOperationGrid.showMsgbox("error", data.data, 330);
				}
				else{
					HgUi.ok("保存成功!", function() {
						sysOperationGrid.grid.datagrid('reload');
					});
				}
			});
			
		}
		else{
			sysOperationGrid.showMsgbox("alert", "有一条数据未校验通过!", 180);
		}
	}
	
});

// -------------------------删除-----------------------------------------------------------------------
sysOperationGrid.toolbar.find("[tag=del]").click(function() {
	var row = sysOperationGrid.grid.datagrid("getSelected");
	var rowIndex = sysOperationGrid.grid.datagrid('getRowIndex', row);
	if (sysOperationGrid.isEditing == true && rowIndex == 0){
		HgUi.alert("未保存的数据无法删除");
		return;
	}
	if (!row){
		HgUi.alert("请选择一条数据");
		return;
	}
	$.messager.confirm("确认删除", "确认删除此条数据?", function(r) {
		if (r){
			HgUtil.getJson("/sys/sysOperation/delete", {operationId: row.operationId}, function(data) {
				if(data.success){
					HgUi.ok("删除成功!", function() {
						sysOperationGrid.grid.datagrid("reload");
					});
				}else{
					HgUi.error("删除失败!"+data.data, function(){
					});
				}
			});
			
		}
	});
	
});

// 清空查询---------------------------------------------------------------------------------------------------
sysOperationGrid.toolbar.find("[tag=clear]").click(function() {
	sysOperationGrid.grid.datagrid("removeFilterRule");
	sysOperationGrid.grid.datagrid("load", {});
});

$.extend($.fn.validatebox.defaults.rules, {     
	minnum : {
		validator : function(value,param){
			return value >= 1&&(/^[+]?[1-9]+\d*$/i.test(value));
		},
		message : "请输入最小值为1的正整数"
	},
})
