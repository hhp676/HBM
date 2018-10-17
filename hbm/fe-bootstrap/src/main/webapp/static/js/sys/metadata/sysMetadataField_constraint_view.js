var sysMetadataFieldConstraintGrid = new HgUi.Datagrid("sysMetadataField_constraint_grid");
sysMetadataFieldConstraintGrid.options.isShowContextMenu = true;
sysMetadataFieldConstraintGrid.options.tipCells = ["fieldCode","fieldName","sysDauthFilterType.filterTypeName","columnName"];

sysMetadataFieldConstraintGrid.options.onSelect = function(index,row) {
	//刷新字段列表
	if (row && row.fieldId){
		sysMetadataFieldConstraintGrid.selectedRow = row;
		if ($('#sysMetaConstraint_grid').length > 0) {
			$("#sysMetaConstraint_grid").datagrid("options").url = G_CTX_PATH+"/sys/meta/constraintList?entityId=" + row.entityId;
			$("#sysMetaConstraint_grid").datagrid("reload");
		}
	}
};

sysMetadataFieldConstraintGrid.options.onLoadSuccess = function(data) {
};

/*if (sysMetadataEntityConstraintGrid && sysMetadataEntityConstraintGrid.selectedRow) {
	sysMetadataFieldConstraintGrid.options.url = G_CTX_PATH+"/sys/sysMetadata/fieldList/" + sysMetadataEntityConstraintGrid.selectedRow.entityId;
}*/

sysMetadataFieldConstraintGrid.init();

sysMetadataFieldConstraintGrid.bindDefaultToolbarEvent();




