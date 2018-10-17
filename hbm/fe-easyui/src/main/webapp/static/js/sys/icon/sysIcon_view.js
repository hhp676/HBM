var iconGrid = new HgUi.Datagrid("icon_grid");
iconGrid.checkUpdateAuth = true;
iconGrid.toolbar = $("#icon_toolbar");
iconGrid.mode = "rowEdit"; //行编辑模式
iconGrid.options.isShowContextMenu = true;

iconGrid.options.onLoadSuccess = function(data) {
	iconGrid.grid.datagrid("selectRow",0);
};
iconGrid.init();
iconGrid.grid.datagrid("enableFilter",[
	{
		field:'icon',
		type:'textbox',
		options:{disabled:true}
	},
	{
        field: 'iconType',
        type: 'combobox',
        options: {
        	panelHeight:'auto',
        	editable:false,
        	prompt: '---请选择---',
        	data:HgUtil.getDictComboboxData('easyuiOrBootstrap'),
            onChange: function(value) {
                if (value == ''){
                	iconGrid.grid.datagrid('removeFilterRule', 'iconType');
                }
                else{
                	iconGrid.grid.datagrid('addFilterRule', {
	                    field: 'iconType',
	                    op: 'equal',
	                    value: value
	                });
                }
                iconGrid.grid.datagrid('doFilter');
            }
        }
    },
	{
        field: 'isVisible',
        type: 'combobox',
        options: {
        	panelHeight:'auto',
        	editable:false,
        	prompt: '---请选择---',
        	data:HgUtil.getDictComboboxData('trueOrFalse'),
            onChange: function(value) {
                if (value == ''){
                	iconGrid.grid.datagrid('removeFilterRule', 'isVisible');
                }
                else{
                	iconGrid.grid.datagrid('addFilterRule', {
	                    field: 'isVisible',
	                    op: 'equal',
	                    value: value
	                });
                }
                iconGrid.grid.datagrid('doFilter');
            }
        }
    }
]);



iconGrid.bindDefaultToolbarEvent();

var dictItemGridVisibleMap = HgUtil.getDictItemMap("trueOrFalse");
function dictItemGridVisibleFormatter(value) {
    return HgUtil.getDictItemName("trueOrFalse",value);
}

var dictItemGridIconTypeMap = HgUtil.getDictItemMap("easyuiOrBootstrap");
function dictItemGridIconTypeFormatter(value) {
    return HgUtil.getDictItemName("easyuiOrBootstrap",value);
}


//列显示图片--------------------------------------------------------------------------------------------------
function imgFormatter(value,row,index){
	if(typeof(row.imagePath) != "undefined"){
		return "<img src='" + G_CTX_PATH + row.imagePath + "'/>";
	}else{
		return "";
	}
};


//测试通用选择图标页面-----------------------------------------------------------------------------------------------------------
$("#choose_layout [tag='choose']").click(function(){
	var _this = $(this);
	HgUi.showIconsWin(function(icon){
		_this.linkbutton({
    		iconCls:icon.iconCss
    	});
		$("#choose_layout #chooseIconText").textbox("setValue", icon.iconCss);
	});
});

//重新生成图标配置数据-------------------------------------------------------------------------------------------------------
iconGrid.toolbar.find("[tag=Reconfiguration]").click(function(){
	$.messager.confirm("确认重新生成图标配置数据", "确认重新生成图标配置数据?", function(r){
		$("#icon_layout").block();
		if (r) {
			HgUtil.getJson("/sys/sysIcon/Reconfiguration",{},function(data){
				if (!data.success) {
					HgUi.alert("重新生成失败,"+data.data);
				} else {
					HgUi.ok("重新生成图标配置数据成功,重新加载项目后生效!",function(){
						iconGrid.grid.datagrid('reload');
					});
				}
			});
		}
		$("#icon_layout").unblock();
	});
});
// --------------------------保存数据------------------------------------------------------------------
iconGrid.toolbar.find("[tag=save]").click(function() {
	if (iconGrid.isEditing == true) {
		if (iconGrid.grid.datagrid("validateRow", iconGrid.editingIndex)) {
			var data = iconGrid.makeSubmitData();
			var editRow = iconGrid.grid.datagrid("getRows")[iconGrid.editingIndex];
			var submitUrl = "/sys/sysIcon/addIcon";
			if (editRow.iconId) {
				submitUrl = "/sys/sysIcon/updIcon";
				data.iconId = editRow.iconId;
			}			
			HgUtil.post(submitUrl, data, function(data) {
				if (!data.success) {
					iconGrid.showMsgbox("error",data.data,330);
				} else {
					HgUi.ok("保存成功!",function(){
						iconGrid.grid.datagrid("reload");
					});	
				}
			});

		} else {
			iconGrid.showMsgbox("alert","有一条数据未校验通过!",180);
		}
	}

});


//-------------------------删除-----------------------------------------------------------------------
iconGrid.toolbar.find("[tag=del]").click(function(){
	var row = iconGrid.grid.datagrid("getSelected");
	var rowIndex = iconGrid.grid.datagrid('getRowIndex', row);
	if (iconGrid.isEditing == true && rowIndex == 0){
		HgUi.alert("未保存的数据无法删除");
		return;
	}
	if (!row) {
		HgUi.alert("请选择一条图标配置数据");
		return;
	}
	$.messager.confirm("确认删除", "确认将选中的图标配置数据删除?", function(r){
		if (r) {
			HgUtil.getJson("/sys/sysIcon/delIcon",{iconId:row.iconId},function(data){
				if (!data.success) {
					HgUi.alert("删除失败,"+data.data);
				} else {
					HgUi.ok("删除成功!",function(){
						iconGrid.grid.datagrid("reload");
					});	
				}
			});
			
		}
	});
	
	
});

// 组织提交数据
iconGrid.makeSubmitData = function() {
	var iconType = iconGrid.grid.datagrid('getEditor', {
		index : iconGrid.editingIndex,
		field : "iconType"
	});
	var skinCode = iconGrid.grid.datagrid('getEditor', {
		index : iconGrid.editingIndex,
		field : "skinCode"
	});
	var iconCss = iconGrid.grid.datagrid('getEditor', {
		index : iconGrid.editingIndex,
		field : "iconCss"
	});
	var imagePath = iconGrid.grid.datagrid('getEditor', {
		index : iconGrid.editingIndex,
		field : "imagePath"
	});
	var sortNo = iconGrid.grid.datagrid('getEditor', {
		index : iconGrid.editingIndex,
		field : "sortNo"
	});
	var isVisible = iconGrid.grid.datagrid('getEditor', {
		index : iconGrid.editingIndex,
		field : "isVisible"
	});
	var tip = iconGrid.grid.datagrid('getEditor', {
		index : iconGrid.editingIndex,
		field : "tip"
	});
	var descr = iconGrid.grid.datagrid('getEditor', {
		index : iconGrid.editingIndex,
		field : "descr"
	});

	var data = {
		iconType : $(iconType.target).textbox("getValue"),
		skinCode : $(skinCode.target).textbox("getValue"),
		iconCss : $(iconCss.target).textbox("getValue"),
		imagePath : $(imagePath.target).textbox("getValue"),
		sortNo : $(sortNo.target).numberbox("getValue"),
		isVisible : $(isVisible.target).textbox("getValue"),
		tip : $(tip.target).textbox("getValue"),
		descr : $(descr.target).textbox("getValue")
	};
	return data;
};


// 清空查询---------------------------------------------------------------------------------------------------


iconGrid.toolbar.find("[tag=clear]").click(function() {
	/*iconGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});*/	
	iconGrid.grid.datagrid("removeFilterRule");
	iconGrid.grid.datagrid("load", {});
});




