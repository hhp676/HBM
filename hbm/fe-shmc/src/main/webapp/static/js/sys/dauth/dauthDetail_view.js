var dauthDetailGrid = new HgUi.Datagrid("dauthDetail_grid");
dauthDetailGrid.toolbar = $("#dauthDetail_toolbar");
dauthDetailGrid.options.isShowContextMenu = false;
dauthDetailGrid.options.tipCells = ["groupCode","groupName","engName","i18nCode","descr"];

dauthDetailGrid.options.onLoadSuccess = function(data) {
	dauthDetailGrid.grid.datagrid("selectRow",0);
};

dauthDetailGrid.options.url = G_CTX_PATH+"/sys/dauthFilter/dauthDetailGroupList?1=1";
if (dauthUsageGrid && dauthUsageGrid.selectedRow && dauthUsageGrid.selectedRow.dauthId) {
	dauthDetailGrid.options.url = dauthDetailGrid.options.url + "&dauthId=" + dauthUsageGrid.selectedRow.dauthId;
} else {
	dauthDetailGrid.options.url = dauthDetailGrid.options.url + "&dauthId=-1";
}

dauthDetailGrid.subGridOptions = {
	view: detailview,
	detailFormatter:function(index,row){
        return '<div style="padding:2px"><table class="ddv" id="dauthDetailGrid_subDetail_'+ row.filterGroupId +'"></table></div>';
    },
    onExpandRow: function(index,row){
        //var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
    	var dauthDetailGrid_subGrid = new HgUi.Datagrid("dauthDetailGrid_subDetail_" + row.filterGroupId);
    	dauthDetailGrid_subGrid.options = {
            url:G_CTX_PATH+"/sys/dauthFilter/dauthDetailFilterJoinList?filterGroupId=" + row.filterGroupId + "&rows=100000",
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
            	dauthDetailGrid.grid.datagrid('fixDetailRowHeight',index);
            },
            onLoadSuccess:function(){
                setTimeout(function(){
                	dauthDetailGrid.grid.datagrid('fixDetailRowHeight',index);
                },0);
            }
        };
    	dauthDetailGrid_subGrid.init();
        dauthDetailGrid.grid.datagrid('fixDetailRowHeight',index);
    }
};
$.extend(dauthDetailGrid.options,dauthDetailGrid.subGridOptions);

dauthDetailGrid.init();
dauthDetailGrid.grid.datagrid("enableFilter");
dauthDetailGrid.bindDefaultToolbarEvent();


//清空查询---------------------------------------------------------------------------------------------------
dauthDetailGrid.toolbar.find("[tag=clear]").click(function() {
	dauthDetailGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	dauthDetailGrid.grid.datagrid("removeFilterRule");
	dauthDetailGrid.grid.datagrid("load", {});
});


