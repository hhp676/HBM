/**
 * 组织架构。 Created by qiujingde on 2016/12/22. / / /
 */
var sysPositionList = {};

var sysPositionListGrid = new HgUi.Datagrid("sysPositionList_grid");
sysPositionListGrid.toolbar = $("#sysPositionList_toolbar");
sysPositionListGrid.options.isShowContextMenu = true;
sysPositionListGrid.init();
sysPositionListGrid.bindDefaultToolbarEvent();
sysPositionListGrid.options.onLoadSuccess = function() { };

sysPositionList.layout = $("#sysPositionListLayout");
sysPositionList.grid = sysPositionListGrid.grid;

sysPositionList.layout.find("[tag='ok']").click(function() {
	var row = sysPositionList.grid.datagrid("getSelected");
	if (!row){
		$.messager.alert("提示", "请选择一条数据", "warning");
		return;
	}
	sysPositionListCallback(row);
	sysPositionList.layout.parent().window("close");
});

sysPositionList.layout.find("[tag='cancel']").click(function() {
	sysPositionList.layout.parent().window("close");
});

sysPositionListGrid.toolbar.find("[tag='search']").click(function () {
    sysPositionList.grid.datagrid("load", {
        positionName: $.trim(sysPositionListGrid.toolbar.find("[name=name]").val()),
        positionCode: $.trim(sysPositionListGrid.toolbar.find("[name=code]").val())
    });
});

sysPositionListGrid.toolbar.find("[tag='clear']").click(function () {
    sysPositionListGrid.toolbar.form("clear");
    sysPositionList.grid.datagrid("load", {});
});
