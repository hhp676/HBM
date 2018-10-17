$("#sysUserTabAuth_toolbar #sysUserTabAuthGridShowNext").hide();
var sysUserTabAuthGrid = {};
sysUserTabAuthGrid.grid = $("#sysUserTabAuth_grid");
sysUserTabAuthGrid.toolbar = $("#sysUserTabAuth_toolbar");
/*sysUserTabAuthGrid._selectedRow = sysUserGrid.grid.datagrid("getSelected");*/

sysUserTabAuthGrid.onLoadSuccess = function(row, data) {
	sysUserTabAuthGrid.data = data;
	HgUi.showGridCellTip("sysUserTabAuth_grid", ['authName','userAuthFrom','authShowType']);
}
/**
 * 查询匹配字段值
 * @author yinyanzhen
 */
sysUserTabAuthGrid.searchStr = function(){
	sysUserTabAuthGrid.sysAuthLocation = 
		new sysAuthLocation(sysUserTabAuthGrid.grid, 
			 $("#sysUserTabAuth_toolbar #authName").val(), 
			 $("#sysUserTabAuth_toolbar #sysUserTabAuthGridShowNext"));
	sysUserTabAuthGrid.sysAuthLocation.searchStr();
}
/**
 * 定位下一个匹配值
 */
sysUserTabAuthGrid.showNext = function (){
	sysUserTabAuthGrid.sysAuthLocation.showNext();
}

/*if (sysUserTabAuthGrid._selectedRow != null){
	sysUserTabAuthGrid.grid.treegrid({
		url: G_CTX_PATH + '/sys/sysAuthMenu/getUserAuthList?userId='+sysUserTabAuthGrid._selectedRow['userId']
	});
}
else{
	sysUserTabAuthGrid.grid.treegrid({});
}*/

