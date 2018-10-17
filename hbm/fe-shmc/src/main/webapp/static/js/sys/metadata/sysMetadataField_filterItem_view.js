var sysMetadataFieldFilterItemGrid = new HgUi.Datagrid("sysMetadataField_filterItem_grid");
sysMetadataFieldFilterItemGrid.options.isShowContextMenu = true;
sysMetadataFieldFilterItemGrid.options.tipCells = ["fieldCode","fieldName","sysDauthFilterType.filterTypeName","columnName"];

sysMetadataFieldFilterItemGrid.options.onSelect = function(index,row) {
	//刷新字段列表
	if (row && row.fieldId){
		sysMetadataFieldFilterItemGrid.selectedRow = row;
		if ($('#dauthFilterItem_grid').length > 0) {
			$("#dauthFilterItem_grid").datagrid("options").url = G_CTX_PATH+"/sys/dauthFilter/filterItemList?fieldId=" + row.fieldId;
			$("#dauthFilterItem_grid").datagrid("reload");
		}
	}
};

sysMetadataFieldFilterItemGrid.options.onLoadSuccess = function(data) {
};

/*if (sysMetadataEntityFilterItemGrid && sysMetadataEntityFilterItemGrid.selectedRow) {
	sysMetadataFieldFilterItemGrid.options.url = G_CTX_PATH+"/sys/sysMetadata/fieldList/" + sysMetadataEntityFilterItemGrid.selectedRow.entityId;
}*/

sysMetadataFieldFilterItemGrid.init();

sysMetadataFieldFilterItemGrid.bindDefaultToolbarEvent();




