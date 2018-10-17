var dauthFilterGroupGrid = new HgUi.Datagrid("dauthFilterGroup_grid");
dauthFilterGroupGrid.checkUpdateAuth = true;
dauthFilterGroupGrid.toolbar = $("#dauthFilterGroup_toolbar");
dauthFilterGroupGrid.mode = "rowEdit"; //行编辑模式
dauthFilterGroupGrid.options.isShowContextMenu = true;
dauthFilterGroupGrid.options.aboutUrl = "/sys/dauthFilter/aboutFilterGroup";
dauthFilterGroupGrid.options.tipCells = ["groupCode","groupName","descr"];

dauthFilterGroupGrid.options.onLoadSuccess = function(data) {
	dauthFilterGroupGrid.grid.datagrid("selectRow",0);
};

dauthFilterGroupGrid.options.url = G_CTX_PATH+"/sys/dauthFilter/filterGroupList?1=1";
if (dauthGrid.selectedRow) {
	dauthFilterGroupGrid.options.url = dauthFilterGroupGrid.options.url + "&dauthId=" + dauthGrid.selectedRow.dauthId;
} else {
	dauthFilterGroupGrid.options.url = dauthFilterGroupGrid.options.url + "&dauthId=-1";
}

dauthFilterGroupGrid.subGridOptions = {
	view: detailview,
	detailFormatter:function(index,row){
        return '<div style="padding:2px"><table class="ddv" id="dauthFilterGroupGrid_subDetail_'+ row.filterGroupId +'"></table></div>';
    },
    onExpandRow: function(index,row){
        //var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
        var dauthFilterGroupGrid_subGrid = new HgUi.Datagrid("dauthFilterGroupGrid_subDetail_" + row.filterGroupId);
        dauthFilterGroupGrid_subGrid.options = {
            url:G_CTX_PATH+"/sys/dauthFilter/filterJoinList?filterGroupId=" + row.filterGroupId + "&rows=100000",
            fitColumns:true,
            singleSelect:true,
            rownumbers:true,
            loadMsg:'',
            height:'auto',
            columns:[[
                {field:'sysDauthFilterItem.sysDauthFilterType.filterTypeName',title:'过滤类型',width:150},
                {field:'sysDauthFilterItem.sysMetadataField.fieldName',title:'字段',width:150},
                {field:'sysDauthFilterItem.sysDauthOperator.operatorName',title:'运算符',width:150},
                {field:'sysDauthFilterItem.valueType',title:'值类型',width:150,formatter:HgUtil.fieldFormatterFunc('DAUTH_FILTER_VALUE_TYPE')},
                {field:'sysDauthFilterItem.filterValueStr',title:'过滤值',width:150},
                {field:'descr',title:'描述',width:100}
            ]],
            tipCells: [
                       "sysDauthFilterItem.sysDauthFilterType.filterTypeName",
                       "sysDauthFilterItem.sysMetadataField.fieldName",
                       "sysDauthFilterItem.valueType",
                       "sysDauthFilterItem.filterValueStr",
                       "descr"
                      ],
            onResize:function(){
            	dauthFilterGroupGrid.grid.datagrid('fixDetailRowHeight',index);
            },
            onLoadSuccess:function(){
                setTimeout(function(){
                	dauthFilterGroupGrid.grid.datagrid('fixDetailRowHeight',index);
                },0);
            },
            onClickRow: function (index, row) {
                $(this).datagrid('unselectRow', index);
            }
        }
        dauthFilterGroupGrid_subGrid.init();
        dauthFilterGroupGrid.grid.datagrid('fixDetailRowHeight',index);
    }
};
$.extend(dauthFilterGroupGrid.options,dauthFilterGroupGrid.subGridOptions);

dauthFilterGroupGrid.init();
dauthFilterGroupGrid.grid.datagrid("enableFilter");
dauthFilterGroupGrid.bindDefaultToolbarEvent();

// --------------------------保存数据------------------------------------------------------------------
dauthFilterGroupGrid.toolbar.find("[tag=save]").click(function() {
	if (dauthFilterGroupGrid.isEditing == true) {
		if (dauthFilterGroupGrid.grid.datagrid("validateRow", dauthFilterGroupGrid.editingIndex)) {
			var data = dauthFilterGroupGrid.makeSubmitData();
			var editRow = dauthFilterGroupGrid.grid.datagrid("getRows")[dauthFilterGroupGrid.editingIndex];
			var submitUrl = "/sys/dauthFilter/addFilterGroup";
			if (editRow.filterGroupId) {
				submitUrl = "/sys/dauthFilter/updateFilterGroup";
				data.filterGroupId = editRow.filterGroupId;
			} else {
				data.dauthId = dauthGrid.selectedRow.dauthId;
			}
			if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
			HgUtil.post(submitUrl, data, function(data) {
				if (!data.success) {
					dauthFilterGroupGrid.showMsgbox("error",data.data,330);
				} else {
					HgUi.ok("保存成功!",function(){
						dauthFilterGroupGrid.grid.datagrid("reload");
					});	
				}
			});

		} else {
			dauthFilterGroupGrid.showMsgbox("alert","有一条数据未校验通过!",180);
		}
	}

});


//-------------------------删除-----------------------------------------------------------------------
dauthFilterGroupGrid.toolbar.find("[tag=del]").click(function(){
	var row = dauthFilterGroupGrid.grid.datagrid("getSelected");
	var rowIndex = dauthFilterGroupGrid.grid.datagrid('getRowIndex', row);
	if (dauthFilterGroupGrid.isEditing == true && rowIndex == 0){
		HgUi.alert("未保存的数据无法删除");
		return;
	}
	if (!row) {
		HgUi.alert("请选择一条过滤器组数据");
		return;
	}
	$.messager.confirm("确认删除", "确认将选中的过滤器组删除?", function(r){
		if (r) {
			HgUtil.getJson("/sys/dauthFilter/deleteFilterGroup",{filterGroupId:row.filterGroupId},function(data){
				if (!data.success) {
					HgUi.alert("删除失败,"+data.data);
				} else {
					HgUi.ok("删除成功!",function(){
						dauthFilterGroupGrid.grid.datagrid("reload");
					});	
				}
			});
			
		}
	});
	
	
});






// 组织提交数据
dauthFilterGroupGrid.makeSubmitData = function() {
	var data = dauthFilterGroupGrid.getEditorsData();
	return data;
};








//撤销---------------------------------------------------------------------------------------------------
dauthFilterGroupGrid.toolbar.find("[tag=undo]").click(function() {
	dauthFilterGroupGrid.grid.datagrid("reload");
});

//清空查询---------------------------------------------------------------------------------------------------
dauthFilterGroupGrid.toolbar.find("[tag=clear]").click(function() {
	dauthFilterGroupGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	dauthFilterGroupGrid.grid.datagrid("removeFilterRule");
	dauthFilterGroupGrid.grid.datagrid("load", {});
});


//过滤器项配置---------------------------------------------------------------------------------------------------
dauthFilterGroupGrid.toolbar.find("[tag=dauthFilterJoin]").click(function() {
	var rows = $("#dauthFilterGroup_grid").datagrid('getPanel').find('.datagrid-row-editing');
	if(rows.length>0){
		HgUi.alert("当前存在未保存信息,请先进行保存!");
		return;
	}
	var row = dauthFilterGroupGrid.grid.datagrid("getSelected");
	if (!row) {
		HgUi.alert("请选择一条过滤器组数据");
		return;
	}
	var iconCls = $(this).linkbutton("options").iconCls;
	HgUi.window({id:"dauthFilterJoinWin",title:"过滤器项配置",width:850,height:400,iconCls:iconCls,
		url:"/sys/dauthFilter/filterJoinView/" + row.sysDauth.entityId + "/" + row.filterGroupId});

});

