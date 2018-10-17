var sysNoticeDatagrid = new HgUi.Datagrid("sysNotice_datagrid");
sysNoticeDatagrid.toolbar = $("#sysNotice_toolbar");
sysNoticeDatagrid.options.isShowContextMenu = true;
sysNoticeDatagrid.options.tipCells = ["title"];
sysNoticeDatagrid.options.onLoadSuccess = function(data) {
    sysNoticeDatagrid.grid.datagrid("selectRow",0);
};
sysNoticeDatagrid.init();
//绑定展开,闭合按钮事件
HgUi.toggleSearchBar("sysNotice_toolbar",
	function(){
		sysNoticeDatagrid.grid.datagrid("resize");
	},function(){
		sysNoticeDatagrid.grid.datagrid("resize");
});

//查询---------------------------------------------------------------------------------------------------
sysNoticeDatagrid.toolbar.find("[tag=search]").click(function() {
	var paramMap = HgUtil.paramArrayToMap($("#sysNotice_toolbar #sysNoticeSearchForm").serializeArray());
	paramMap = HgUtil.paramMapTrim(paramMap);
	sysNoticeDatagrid.grid.datagrid("load", paramMap);
});
// 清空---------------------------------------------------------------------------------------------------
sysNoticeDatagrid.toolbar.find("[tag=clear]").click(function() {
	$("#sysNotice_toolbar #sysNoticeSearchForm").form('clear');
	sysNoticeDatagrid.grid.datagrid("load", {});
});

//---------------------新增--------------------------------------------------------
sysNoticeDatagrid.toolbar.find("[tag=add]").click(function() {
	var iconCls = $(this).attr("iconCls");
	var addUrl = "/sys/sysNotice/sysNoticeDetail?noticeId=0&mode=add";
	new HgUi.window({
	    id: "sysNoticeDetailWin",
	    width: 800,
	    height: 550,
	    title: "通知公告添加",
	    iconCls: iconCls,
	    url: addUrl
	});
});
//---------------------修改--------------------------------------------------------
sysNoticeDatagrid.toolbar.find("[tag=edit]").click(function() {
	var row = sysNoticeDatagrid.grid.datagrid("getSelected");
    if (!row) {
    	HgUi.notice("请先选择一条数据!");
        return;
    }
	var iconCls = $(this).attr("iconCls");
	var addUrl = "/sys/sysNotice/sysNoticeDetail?noticeId="+row.id+"&mode=add";
	new HgUi.window({
		id: "sysNoticeDetailWin",
		width: 800,
		height: 550,
		title: "通知公告修改",
		iconCls: iconCls,
		url: addUrl
	});
});

//发布or取消发布
sysNoticeDatagrid.pub = function(pubType){
	var row = sysNoticeDatagrid.grid.datagrid("getSelected");
	if (!row) {
		HgUi.notice("请先选择一条数据!");
		return;
	}
	var msg = (pubType=='1'?'发布':'取消发布');
	$.messager.confirm("操作确认", "确认将选中的数据"+msg+"?", function(r){
		if (r) {
			HgUtil.getJson("/sys/sysNotice/pubNotice",{id:row.id,pubType:pubType}, function(data){
				if (!data.success) {
					HgUi.error("操作失败,"+data.data,function(){
					});
				} else {
					HgUi.ok("操作成功!",function(){
						sysNoticeDatagrid.grid.datagrid("reload");
					});
				}
			});
		}
	});
}

//-------------------------删除-----------------------------------------------------------------------
sysNoticeDatagrid.toolbar.find("[tag=del]").click(function(){
    var row = sysNoticeDatagrid.grid.datagrid("getSelected");
    if (!row) {
    	HgUi.notice("请先选择一条数据!");
        return;
    }
    $.messager.confirm("确认删除", "确认将选中的数据删除?", function(r){
        if (r) {
            HgUtil.getJson("/sys/sysNotice/delNotice",{id:row.id}, function(data){
                if (!data.success) {
                	HgUi.error("删除失败,"+data.data,function(){
                	});
                } else {
                    HgUi.ok("删除成功!",function(){
                        sysNoticeDatagrid.grid.datagrid("reload");
                    });
                }
            });
        }
    });
});
