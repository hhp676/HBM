/**
 * 
 */
var sysPersonalTabAuthGrid = {};
sysPersonalTabAuthGrid.grid = $("#sysPersonalTabAuthView #sysPersonalTabAuth_grid");
sysPersonalTabAuthGrid.onLoadSuccess = function(row, data) {
	/*sysPersonalTabAuthGrid.data = data;*/
}

sysPersonalTabAuthGrid.grid.treegrid({
	url: G_CTX_PATH + '/sys/sysPersonal/authList',
});

$("#sysPersonalTabAuthView #treeGridShowNext").hide();

/**
 * 查询匹配字段值
 * @author yinyanzhen
 */
sysPersonalTabAuthGrid.searchStr = function(){
	sysPersonalTabAuthGrid.sysAuthLocation = new sysAuthLocation(sysPersonalTabAuthGrid.grid, 
			 $("#sysPersonalTabAuthView #authName").val(), $("#sysPersonalTabAuthView #treeGridShowNext"));
	sysPersonalTabAuthGrid.sysAuthLocation.searchStr(); 
}
/**
 * 定位下一个匹配值
 */
sysPersonalTabAuthGrid.showNext = function (){
	sysPersonalTabAuthGrid.sysAuthLocation.showNext();
}
