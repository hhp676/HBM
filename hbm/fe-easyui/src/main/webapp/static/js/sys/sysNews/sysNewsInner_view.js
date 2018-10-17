var sysNewsInnerDatagrid = new HgUi.Datagrid("sysNewsInner_datagrid");
sysNewsInnerDatagrid.toolbar = $("#sysNewsInner_toolbar");
sysNewsInnerDatagrid.options.tipCells = ["newsTitle"];

sysNewsInnerDatagrid.options.onLoadSuccess = function(data) {
    sysNewsInnerDatagrid.grid.datagrid("selectRow",0);
};
sysNewsInnerDatagrid.init();
//绑定展开,闭合按钮事件
HgUi.toggleSearchBar("sysNewsInner_toolbar",
		function(){
			sysNewsInnerDatagrid.grid.datagrid("resize");
		},function(){
			sysNewsInnerDatagrid.grid.datagrid("resize");
});

//查询---------------------------------------------------------------------------------------------------
sysNewsInnerDatagrid.toolbar.find("[tag=search]").click(function() {
	var paramMap = HgUtil.paramArrayToMap($("#sysNewsInner_toolbar #sysNewsInnerSearchForm").serializeArray());
	paramMap = HgUtil.paramMapTrim(paramMap);
	sysNewsInnerDatagrid.grid.datagrid("load", paramMap);
});
// 清空---------------------------------------------------------------------------------------------------
sysNewsInnerDatagrid.toolbar.find("[tag=clear]").click(function() {
	$("#sysNewsInner_toolbar #sysNewsInnerSearchForm").form('clear');
//	$("#sysNewsInnerSearchForm #taskTypeId").combobox("setValue","");
	sysNewsInnerDatagrid.grid.datagrid("load", {});
});

//---------------------查看--------------------------------------------------------
sysNewsInnerDatagrid.toolbar.find("[tag=edit]").click(function() {
	var row = sysNewsInnerDatagrid.grid.datagrid("getSelected");
    if (!row) {
    	HgUi.notice("请先选择一条数据!");
        return;
    }
	var iconCls = $(this).attr("iconCls");
	var addUrl = "/sys/sysNewsInner/detailSysNewsInner?id="+row.id;
	new HgUi.window({
		id: "sysNewsInnerDetailWin",
		width: 800,
		height: 550,
		title: "消息查看",
		iconCls: iconCls,
		url: addUrl
	});
});

//-------------------------删除-----------------------------------------------------------------------
sysNewsInnerDatagrid.toolbar.find("[tag=del]").click(function(){
    var row = sysNewsInnerDatagrid.grid.datagrid("getSelected");
    if (!row) {
    	HgUi.notice("请先选择一条数据!");
        return;
    }
    $.messager.confirm("确认删除", "确认将选中的数据删除?", function(r){
        if (r) {
            HgUtil.getJson("/sys/sysNewsInner/deleteSysNewsInner",{id:row.id}, function(data){
                if (!data.success) {
                	HgUi.error("删除失败,"+data.data,function(){
                	});
                } else {
                    HgUi.ok("删除成功!",function(){
                    	sysNewsInnerDatagrid.grid.datagrid("reload");
                    });
                }
            });
        }
    });
});
