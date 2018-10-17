/**
 * 
 */
var sysConfigGrid = new HgUi.Datagrid("sysConfig_grid");
sysConfigGrid.checkUpdateAuth = true;
sysConfigGrid.toolbar = $("#sysConfig_toolbar");
sysConfigGrid.options = {
    // 禁用key编辑
    onBeginEdit: function(index, row) {
	    if (row.configId){
		    var editor = sysConfigGrid.grid.datagrid('getEditor', {
		        index: index,
		        field: "configKey"
		    });
		    $(editor.target).textbox('disable');
	    }
    },
    onDblClickCell: function(index, field) {
	    var editRow = sysConfigGrid.grid.datagrid("getRows")[index];
	    if (editRow.isCurrent != 1){
		    sysConfigGrid.showMsgbox("alert", "历史版本不可修改!", 180);
		    return false;
	    }
	    return true;
    },
    onSelect: function(rowIndex, rowData) {
	    sysConfigHisGrid.grid.datagrid('options').url = G_CTX_PATH + '/sys/sysConfig/hisList';
	    sysConfigHisGrid.grid.datagrid('load', {
		    configKey: rowData['configKey']
	    });
    },
    isShowContextMenu : true,
    aboutUrl : "/sys/sysConfig/aboutOne",
    tipCells : ["configKey","configType","configValue","defaultValue","configDesc"]
};

sysConfigGrid.mode = "rowEdit"; // 行编辑模式
sysConfigGrid.options.onLoadSuccess = function(data) {
	sysConfigGrid.grid.datagrid("selectRow",0);
};
sysConfigGrid.init();
sysConfigGrid.grid.datagrid('enableFilter', [
        {
            field: 'sortNo',
            type: 'numberbox',
            options: {
	            precision: 0
            },
            op: [
                    'equal', 'notequal', 'less', 'greater'
            ]
        }, {
            field: 'isCurrent',
            type: 'combobox',
            options: {
            	panelHeight:'auto',
            	editable:false,
            	prompt: '---请选择---',
            	data:HgUtil.getDictComboboxData('trueOrFalse'),
                onChange: function(value) {
	                if (value == ''){
		                sysConfigGrid.grid.datagrid('removeFilterRule', 'isCurrent');
	                }
	                else{
		                sysConfigGrid.grid.datagrid('addFilterRule', {
		                    field: 'isCurrent',
		                    op: 'equal',
		                    value: value
		                });
	                }
	                sysConfigGrid.grid.datagrid('doFilter');
                }
            }
        }, {
            field: 'isFinal',
            type: 'combobox',
            options: {
            	panelHeight:'auto',
            	editable:false,
            	prompt: '---请选择---',
            	data:HgUtil.getDictComboboxData('trueOrFalse'),
                onChange: function(value) {
	                if (value == ''){
		                sysConfigGrid.grid.datagrid('removeFilterRule', 'isFinal');
	                }
	                else{
		                sysConfigGrid.grid.datagrid('addFilterRule', {
		                    field: 'isFinal',
		                    op: 'equal',
		                    value: value
		                });
	                }
	                sysConfigGrid.grid.datagrid('doFilter');
                }
            }
        }
]);
sysConfigGrid.bindDefaultToolbarEvent();

var sysConfigHisGrid = new HgUi.Datagrid("sysConfigHis_grid");
sysConfigHisGrid.options.isShowContextMenu = true;
sysConfigHisGrid.options.aboutUrl = "/sys/sysConfig/aboutOne";
sysConfigHisGrid.init();

// --------------------------保存数据------------------------------------------------------------------
sysConfigGrid.toolbar.find("[tag=save]").click(function() {
	if (sysConfigGrid.isEditing == true){
		if (sysConfigGrid.grid.datagrid("validateRow", sysConfigGrid.editingIndex)){
			var data = sysConfigGrid.getEditorsData();
			//console.log(data);
			var editRow = sysConfigGrid.grid.datagrid("getRows")[sysConfigGrid.editingIndex];
			var submitUrl = "/sys/sysConfig/create";
			if (editRow.configId){
				submitUrl = "/sys/sysConfig/update";
				data.configId = editRow.configId;
			}
			if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
			HgUtil.post(submitUrl, data, function(data) {
				if(!data.success){
					HgUi.alert("保存失败,"+data.data);
				}else{
					HgUi.ok("保存成功!", function() {
						sysConfigGrid.grid.datagrid("reload");
					});
				}
			});
			
		}
		else{
			sysConfigGrid.showMsgbox("alert", "有一条数据未校验通过!", 180);
		}
	}
	
});

// -------------------------删除-----------------------------------------------------------------------
sysConfigGrid.toolbar.find("[tag=del]").click(function() {
	var row = sysConfigGrid.grid.datagrid("getSelected");
	var rowIndex = sysConfigGrid.grid.datagrid('getRowIndex', row);
	if (sysConfigGrid.isEditing == true && rowIndex == 0){
		HgUi.alert("未保存的数据无法删除");
		return;
	}
	if (!row){
		HgUi.alert("请选择一条数据");
		return;
	}
	$.messager.confirm("确认删除", "确认将选中的删除?", function(r) {
		if (r){
			HgUtil.getJson("/sys/sysConfig/delete", {
			    configId: row.configId,
			    configKey: row.configKey
			}, function(data) {
				HgUi.ok("删除成功!", function() {
					sysConfigGrid.grid.datagrid("reload");
				});
			});
			
		}
	});
	
});

// 清空查询---------------------------------------------------------------------------------------------------
sysConfigGrid.toolbar.find("[tag=clear]").click(function() {
	sysConfigGrid.grid.datagrid("removeFilterRule");
	sysConfigGrid.grid.datagrid("load", {});
});
