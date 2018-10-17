$("#sysUserTabNAuth_toolbar #sysUserTabNAuthGridShowNext").hide();
var sysUserTabNAuthGrid = {};
sysUserTabNAuthGrid.grid = $("#sysUserTabNAuth_grid");
sysUserTabNAuthGrid.toolbar = $("#sysUserTabNAuth_toolbar");
/*sysUserTabNAuthGrid._selectedRow = sysUserGrid.grid.datagrid("getSelected");*/
sysUserTabNAuthGrid.onLoadSuccess = function(row, data) {
	sysUserTabNAuthGrid.data = data;
	HgUi.showGridCellTip("sysUserTabNAuth_grid", ['authId','authName','authShowType']);
}

/**
 * 查询匹配字段值
 * @author yinyanzhen
 */
sysUserTabNAuthGrid.searchStr = function(){
	sysUserTabNAuthGrid.sysAuthLocation = 
		new sysAuthLocation(sysUserTabNAuthGrid.grid, 
			 $("#sysUserTabNAuth_toolbar #authName").val(), 
			 $("#sysUserTabNAuth_toolbar #sysUserTabNAuthGridShowNext"));
	sysUserTabNAuthGrid.sysAuthLocation.searchStr();
}
/**
 * 定位下一个匹配值
 */
sysUserTabNAuthGrid.showNext = function (){
	sysUserTabNAuthGrid.sysAuthLocation.showNext();
}
/*

if (sysUserTabNAuthGrid._selectedRow != null){
	sysUserTabNAuthGrid.grid.treegrid({
		url: G_CTX_PATH + '/sys/sysAuthMenu/getUserNAuthList?userId='+sysUserTabNAuthGrid._selectedRow['userId']
	});
}
else{
	sysUserTabNAuthGrid.grid.treegrid({});
}*/
