var dauthUsageGrid = new HgUi.Datagrid("dauthUsage_grid");
dauthUsageGrid.checkUpdateAuth = true;
dauthUsageGrid.toolbar = $("#dauthUsage_toolbar");
dauthUsageGrid.mode = "rowEdit"; //行编辑模式
dauthUsageGrid.options.isShowContextMenu = true;
dauthUsageGrid.options.aboutUrl = "/sys/dauthUsage/aboutOne";
dauthUsageGrid.options.tipCells = ["methodShortName","isValid","sysDauth.dauthName","methodZhName","methodEngName","methodI18nCode","descr"];

dauthUsageGrid.options.onLoadSuccess = function(data) {
	dauthUsageGrid.grid.datagrid("selectRow",0);
};

dauthUsageGrid.options.onSelect = function(index,row) {
	//刷新列表
	if (row && row.usageId){
		dauthUsageGrid.selectedRow = row;
		if ($('#dauthDetail_grid').length > 0) {
			if (row.dauthId) {
				$("#dauthDetail_grid").datagrid("options").url = G_CTX_PATH+"/sys/dauthFilter/dauthDetailGroupList?dauthId=" + row.dauthId;
			} else {
				$("#dauthDetail_grid").datagrid("options").url = G_CTX_PATH+"/sys/dauthFilter/dauthDetailGroupList?dauthId=-1";
			}
			$("#dauthDetail_grid").datagrid("reload");
		}
	}
};

dauthUsageGrid.options.onBeginEdit = function(index,row) {
	var dauthNameEd = dauthUsageGrid.grid.datagrid('getEditor', {
		index : index,
		field : "sysDauth.dauthName"
	});
	var isValidEd = dauthUsageGrid.grid.datagrid('getEditor', {
		index : index,
		field : "isValid"
	});
	$(dauthNameEd.target).textbox("textbox").bind('blur', function(e){
		//本来此输入框为不可编辑，通过js赋值，so 不可重置value为text
		return false;
	});
	$(dauthNameEd.target).textbox("setValue", row.dauthId);
	if (row.sysDauth) {
		$(dauthNameEd.target).textbox("setText", row.sysDauth.dauthName);
	}
	
	$(isValidEd.target).textbox("setValue", row.isValid);
	$(isValidEd.target).textbox("setText", HgUtil.getDictItemName('DAUTH_USAGE_METHOD_VALID', row.isValid));
};


dauthUsageGrid.clickDauthBtn = function() {
	window.sysDauthChooseWinCallback = function(row){
		var dauthNameEd = dauthUsageGrid.grid.datagrid('getEditor', {
			index:dauthUsageGrid.editingIndex,
			field:"sysDauth.dauthName"
		});
		$(dauthNameEd.target).textbox("setValue",row.dauthId);
		$(dauthNameEd.target).textbox("setText",row.dauthName);
	};
	
	HgUi.window({id:"sysDauthChooseWin",title:"选择数据权限",width:750,height:400,
		url:"/sys/dauth/chooseDauthView"});
}

dauthUsageGrid.init();
dauthUsageGrid.grid.datagrid("enableFilter",[{
	field:'isValid',
	type:'combobox',
	options:{
		prompt: '---请选择---',
		data:HgUtil.getDictComboboxData('DAUTH_USAGE_METHOD_VALID'),
   		mode:'remote',
        panelHeight:'auto',
        editable:false,
        onChange:function(value){
        	if (String(value) == ''){
        		dauthUsageGrid.grid.datagrid('removeFilterRule', 'isValid');
            } else {
            	dauthUsageGrid.grid.datagrid('addFilterRule', {
                    field: 'isValid',
                    op: 'equal',
                    value: value
                });
            }
        	dauthUsageGrid.grid.datagrid('doFilter');
        }
    }
}]);
dauthUsageGrid.bindDefaultToolbarEvent();

// --------------------------保存数据------------------------------------------------------------------
dauthUsageGrid.toolbar.find("[tag=save]").click(function() {
	if (dauthUsageGrid.isEditing == true) {
		if (dauthUsageGrid.grid.datagrid("validateRow", dauthUsageGrid.editingIndex)) {
			var data = dauthUsageGrid.makeSubmitData();
			var editRow = dauthUsageGrid.grid.datagrid("getRows")[dauthUsageGrid.editingIndex];
			var submitUrl = "/sys/dauthUsage/add";
			if (editRow.usageId) {
				submitUrl = "/sys/dauthUsage/update";
				data.usageId = editRow.usageId;
			}		
			if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
			HgUtil.post(submitUrl, data, function(data) {
				if (!data.success) {
					dauthUsageGrid.showMsgbox("error",data.data,330);
				} else {
					HgUi.ok("保存成功!", function() {
						dauthUsageGrid.grid.datagrid('reload');
					});
				}
			});

		} else {
			dauthUsageGrid.showMsgbox("alert","有一条数据未校验通过!",180);
		}
	}

});


//清除数据权限配置---------------------------------------------------------------------------------------------------

dauthUsageGrid.toolbar.find("[tag=delDauthSet]").click(function() {
	var row = dauthUsageGrid.grid.datagrid("getSelected");
	if (!row) {
		$.messager.alert("提示","请选择一条数据权限应用数据","warning");
		return;
	}
	if (row.sysDauth == null){
		$.messager.alert("提示","数据权限为空，不可删除","warning");
		return;
	}
	$.messager.confirm("确认清除数据权限配置", "确认清除此方法的数据权限应用配置?", function(r){
		if (r) {
			HgUtil.getJson("/sys/dauthUsage/deleteUsageDauth",{usageId:row.usageId},function(data){
				if (!data.success) {
					$.messager.alert("提示","清除数据权限配置失败,"+data.data,"warning");
				} else {
					HgUi.ok("清除数据权限配置成功!",function(){
						dauthUsageGrid.grid.datagrid("reload");
					});	
				}
			});
			
		}
	});
});







// 组织提交数据
dauthUsageGrid.makeSubmitData = function() {
	var data = dauthUsageGrid.getEditorsData();
	
	var dauthNameEd = dauthUsageGrid.grid.datagrid('getEditor', {
		index : dauthUsageGrid.editingIndex,
		field : "sysDauth.dauthName"
	});
	data.dauthId = $(dauthNameEd.target).textbox("getValue");
	
	return data;
};








//清空查询---------------------------------------------------------------------------------------------------

dauthUsageGrid.toolbar.find("[tag=clear]").click(function() {
	dauthUsageGrid.grid.datagrid("removeFilterRule");
	dauthUsageGrid.grid.datagrid("load", {});
});

