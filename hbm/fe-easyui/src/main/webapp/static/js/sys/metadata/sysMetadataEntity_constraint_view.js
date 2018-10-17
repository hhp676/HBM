var sysMetadataEntityConstraintGrid = new HgUi.Datagrid("sysMetadataEntity_constraint_grid");
sysMetadataEntityConstraintGrid.toolbar = $("#sysMetadataEntity_constraint_toolbar");
sysMetadataEntityConstraintGrid.options.isShowContextMenu = true;
sysMetadataEntityConstraintGrid.options.tipCells = ["entityCode", "entityName", "tableName", "tableAlias"];

sysMetadataEntityConstraintGrid.options.onSelect = function(index,row) {
	//刷新字段列表
	if (row && row.entityId){
		sysMetadataEntityConstraintGrid.selectedRow = row;
		
		$("#sysMetadataField_constraint_grid").datagrid({url:G_CTX_PATH+"/sys/sysMetadata/fieldList/" + row.entityId});	
		if ($('#sysMetaConstraint_grid').length > 0) {
			$("#sysMetaConstraint_grid").datagrid("options").url = G_CTX_PATH+"/sys/meta/constraintList?entityId=" + row.entityId;
			$("#sysMetaConstraint_grid").datagrid("reload");
		}
	}
};

sysMetadataEntityConstraintGrid.options.onLoadSuccess = function(data) {
	sysMetadataEntityConstraintGrid.grid.datagrid("selectRow",0);
};

sysMetadataEntityConstraintGrid.init();
sysMetadataEntityConstraintGrid.grid.datagrid("enableFilter");


sysMetadataEntityConstraintGrid.bindDefaultToolbarEvent();


// 清空查询---------------------------------------------------------------------------------------------------

sysMetadataEntityConstraintGrid.toolbar.find("[tag=clear]").click(function() {
	sysMetadataEntityConstraintGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function(){
		$(this).val("");
	});	
	sysMetadataEntityConstraintGrid.grid.datagrid("removeFilterRule");
	sysMetadataEntityConstraintGrid.grid.datagrid("load", {});
});

