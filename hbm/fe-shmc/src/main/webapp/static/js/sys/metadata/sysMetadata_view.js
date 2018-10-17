var sysMetadataEntityGrid = new HgUi.Datagrid("sysMetadataEntity_grid");
sysMetadataEntityGrid.checkUpdateAuth = true;
sysMetadataEntityGrid.toolbar = $("#sysMetadataEntity_toolbar");
sysMetadataEntityGrid.mode = "rowEdit"; //行编辑模式
sysMetadataEntityGrid.options.isShowContextMenu = true;
sysMetadataEntityGrid.options.aboutUrl = "/sys/sysMetadata/aboutEntity";
sysMetadataEntityGrid.options.tipCells = ["entityCode", "entityName", "tableName", "tableAlias", "engName", "i18nCode", "descr"];

sysMetadataEntityGrid.options.onSelect = function(index,row) {
	//刷新字段列表
	if (row && row.entityId){
		sysMetadataEntityGrid.selectedRow = row;
		
		if ($('#sysMetadataField_grid').length > 0) {
			$("#sysMetadataField_grid").datagrid("options").url = G_CTX_PATH+"/sys/sysMetadata/fieldList/" + row.entityId;
			$("#sysMetadataField_grid").datagrid("reload");
		}
	}
};

sysMetadataEntityGrid.options.onLoadSuccess = function(data) {
	sysMetadataEntityGrid.grid.datagrid("selectRow",0);
};

sysMetadataEntityGrid.clickTableBtn = function(){
	window.sysMetaTableListWinCallback = function(row){
		var tableNameEd = sysMetadataEntityGrid.grid.datagrid('getEditor', {index:sysMetadataEntityGrid.editingIndex,field:"tableName"});
		$(tableNameEd.target).textbox("setValue",row.tableName);
		$(tableNameEd.target).textbox("setText",row.tableName);
	};
	
	HgUi.window({id:"sysMetaTableListWin",title:"选择表",width:850,height:400,
		url:"/sys/sysMetadata/sysMetaTableView"});
};

//表名不可修改   添加或移除Editor
//拓展方法
$.extend($.fn.datagrid.methods, {
	addEditor : function(jq, param) {
	    if (param instanceof Array) {
	        $.each(param, function(index, item) {
	            var e = $(jq).datagrid('getColumnOption', item.field);
	            e.editor = item.editor;
	        });
	    } else {
	        var e = $(jq).datagrid('getColumnOption', param.field);
	        e.editor = param.editor;
	    }
	},
	removeEditor : function(jq, param) {
	    if (param instanceof Array) {
	        $.each(param, function(index, item) {
	            var e = $(jq).datagrid('getColumnOption', item);
	            e.editor = {};
	        });
	    } else {
	        var e = $(jq).datagrid('getColumnOption', param);
	        e.editor = {};
	    }
	}
});

//表名字段Editor移除
sysMetadataEntityGrid.options.onBeforeEdit = function(index, row) {
	if(row && row.entityId){
		sysMetadataEntityGrid.grid.datagrid('removeEditor','tableName');
	}
};

//新建时表名字段Editor增加
sysMetadataEntityGrid.toolbar.find("[tag=add]").click(function(){
	sysMetadataEntityGrid.grid.datagrid('addEditor',[{
		field:'tableName',
		editor:{
			type:'textbox',
			options:{
				buttonText:'...',
				onClickButton:sysMetadataEntityGrid.clickTableBtn,
	   			editable:false,
	   			required:true,
	   			missingMessage:'此输入项为必填项'
			}
		}
	}]);
});


sysMetadataEntityGrid.init();
sysMetadataEntityGrid.grid.datagrid("enableFilter");


sysMetadataEntityGrid.bindDefaultToolbarEvent();

// --------------------------保存数据------------------------------------------------------------------
sysMetadataEntityGrid.toolbar.find("[tag=save]").click(function() {
	if (sysMetadataEntityGrid.isEditing == true) {
		if (sysMetadataEntityGrid.grid.datagrid("validateRow", sysMetadataEntityGrid.editingIndex)) {
			var data = sysMetadataEntityGrid.makeSubmitData();
			var editRow = sysMetadataEntityGrid.grid.datagrid("getRows")[sysMetadataEntityGrid.editingIndex];
			var submitUrl = "/sys/sysMetadata/addEntity";
			if (editRow.entityId) {
				submitUrl = "/sys/sysMetadata/updateEntity";
				data.entityId = editRow.entityId;
			}
			if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
			HgUtil.post(submitUrl, data, function(data) {
				if (!data.success) {
					sysMetadataEntityGrid.showMsgbox("error",data.data,330);
				} else {
					HgUi.ok("保存成功!",function(){
						//保存后新增数据首行展示
						if (!editRow.entityId) {
							sysMetadataEntityGrid.grid.datagrid("load",{sort:"entityId",order:"desc"});
						}else{
							sysMetadataEntityGrid.grid.datagrid("reload");
						}
					});
				}
			});

		} else {
			sysMetadataEntityGrid.showMsgbox("alert","有一条数据未校验通过!",180);
		}
	}

});


//-------------------------删除-----------------------------------------------------------------------
sysMetadataEntityGrid.toolbar.find("[tag=del]").click(function(){
	var row = sysMetadataEntityGrid.grid.datagrid("getSelected");
	var rowIndex = sysMetadataEntityGrid.grid.datagrid('getRowIndex', row);
	if (sysMetadataEntityGrid.isEditing == true && rowIndex == 0){
		HgUi.alert("未保存的数据无法删除");
		return;
	}
	$.messager.confirm("确认删除", "<br>确认将选中的实体删除?", function(r){
		if (r) {
			HgUtil.getJson("/sys/sysMetadata/deleteEntity",{entityId:row.entityId},function(data){
				if (!data.success) {
					$.messager.alert("提示","删除失败,"+data.data,"warning");
				} else {
					HgUi.ok("删除成功!",function(){
						sysMetadataEntityGrid.grid.datagrid("reload");
					});	
				}
			});
			
		}
	});
	
	
});






// 组织提交数据
sysMetadataEntityGrid.makeSubmitData = function() {
	return sysMetadataEntityGrid.getEditorsData();
};



// 清空查询---------------------------------------------------------------------------------------------------


sysMetadataEntityGrid.toolbar.find("[tag=clear]").click(function() {
	sysMetadataEntityGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	sysMetadataEntityGrid.grid.datagrid("removeFilterRule");
	sysMetadataEntityGrid.grid.datagrid("load", {});
});
