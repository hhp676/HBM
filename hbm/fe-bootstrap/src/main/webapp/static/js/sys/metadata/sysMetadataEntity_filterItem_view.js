var sysMetadataEntityFilterItemGrid = new HgUi.Datagrid("sysMetadataEntity_filterItem_grid");
sysMetadataEntityFilterItemGrid.toolbar = $("#sysMetadataEntity_filterItem_toolbar");
sysMetadataEntityFilterItemGrid.options.isShowContextMenu = true;
sysMetadataEntityFilterItemGrid.options.tipCells = ["entityCode", "entityName", "tableName", "tableAlias"];

sysMetadataEntityFilterItemGrid.options.onSelect = function(index,row) {
	//刷新字段列表
	if (row && row.entityId){
		sysMetadataEntityFilterItemGrid.selectedRow = row;
		
		$("#sysMetadataField_filterItem_grid").datagrid({url:G_CTX_PATH+"/sys/sysMetadata/fieldList/" + row.entityId});	
		if ($('#dauthFilterItem_grid').length > 0) {
			$("#dauthFilterItem_grid").datagrid("options").url = G_CTX_PATH+"/sys/dauthFilter/filterItemList?entityId=" + row.entityId;
			$("#dauthFilterItem_grid").datagrid("reload");
		}
	}
};

sysMetadataEntityFilterItemGrid.options.onLoadSuccess = function(data) {
	sysMetadataEntityFilterItemGrid.grid.datagrid("selectRow",0);
};

sysMetadataEntityFilterItemGrid.init();
sysMetadataEntityFilterItemGrid.grid.datagrid("enableFilter");


sysMetadataEntityFilterItemGrid.bindDefaultToolbarEvent();


// 清空查询---------------------------------------------------------------------------------------------------

sysMetadataEntityFilterItemGrid.toolbar.find("[tag=clear]").click(function() {
	sysMetadataEntityFilterItemGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	sysMetadataEntityFilterItemGrid.grid.datagrid("removeFilterRule");
	sysMetadataEntityFilterItemGrid.grid.datagrid("load", {});
});

