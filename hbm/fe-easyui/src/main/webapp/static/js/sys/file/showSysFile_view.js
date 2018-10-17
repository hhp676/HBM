/**
 * 
 */
var fileManageGrid = new HgUi.Datagrid("fileManage_grid");
fileManageGrid.toolbar = $("#fileManage_toolbar");
 
fileManageGrid.options.isShowContextMenu = true;
fileManageGrid.options.aboutUrl ="/sys/sysFile/aboutDialogView";
fileManageGrid.options.tipCells = ["realName","fileName","sysFile.realName","sysFile.fileName","sysFile.fileSize","sysFile.fileType","attCode","attName","bizCode"];
fileManageGrid.init();
fileManageGrid.grid.datagrid("enableFilter");
fileManageGrid.bindDefaultToolbarEvent();
//-------------------------webUpload上传-----------------------------------------------------------------------

fileManageGrid.toolbar.find("[tag=webUpload]").click(function() {
	var iconCls = $(this).attr("iconCls");
	var addUrl = "/sys/sysFile/webUpload";
	var webUploadWin = new HgUi.window({id:"webUploadWin",width:800,height:480,title:"webUpload上传",iconCls:iconCls,url:addUrl,
		onClose:function(){
			fileManageGrid.toolbar.find("[tag=clear]").click();
		}});
});
//清空查询---------------------------------------------------------------------------------------------------
fileManageGrid.toolbar.find("[tag=clear]").click(function() {
	fileManageGrid.grid.datagrid("removeFilterRule");
	fileManageGrid.grid.datagrid("load", {});
});
