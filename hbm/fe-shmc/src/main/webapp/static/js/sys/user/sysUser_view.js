var sysUserGrid = new HgUi.Datagrid ("sysUser_grid");
sysUserGrid.toolbar = $ ("#sysUser_toolbar");
sysUserGrid.options = {
		tipCells:["staffInfo.staffCode","userName","userAccount.loginName","gender","mobile","email",
		          "userPosition.sysOrganization.orgName","userPosition.positionName","userPosition.sysJob.jobName",
		          "staffInfo.staffStatus","staffInfo.entryTime"],
		onSelect:function(index,row){
			fresh_sysUser_tabs();
			//tabs在没有直接进行操作时,update不会发出请求,此时需要手动刷新一次
			$('#sysUser_tabs').tabs('getSelected').panel('refresh');
		},
		onDblClickRow:function(index,row){
			new HgUi.window({
				id : "userDetailWin",
				width : 1000,
				height : 560,
				title : "用户详情",
				iconCls : 'icon_auto_colorful__businessman',
				url : "/sys/sysUser/detail/view/view/"+row.userId
			});
		}
};
sysUserGrid.options.isShowContextMenu = true;
sysUserGrid.options.contextMenuAboutHidden = false;
sysUserGrid.options.aboutUrl = "/sys/sysUser/aboutOne";
sysUserGrid.init();

(function(){

		//-------------------------删除-----------------------------------------------------------------------
		sysUserGrid.toolbar.find("[tag=del]").click(function(){
			var row = sysUserGrid.grid.datagrid("getSelected");
			if (!row) {
				$.messager.alert("提示","请选择一条数据","warning");
				return;
			}
			
			HgCommon.delSysUser(row.userId, function() {
				sysUserGrid.grid.datagrid("reload");
			});
			
		});


		//查询------------------------------------------------------------------------------------------------------
		$("#sysUserSearchForm").find("[tag=submit]").click(function(){
			var searchData = {};
			searchData["userNameForQuery"] =  $("#sysUserSearchForm").find("[name=userName]").val();
			searchData["emailForQuery"] =  $("#sysUserSearchForm").find("[name=email]").val();
			searchData["staffInfo.staffCode"] =  $("#sysUserSearchForm").find("[name=staffCode]").val();
			searchData["staffInfo.staffStatus"] = $("#sysUserSearchForm").find("[name=staffStatus]").val();
			searchData["staffInfo.bo.entryStartTime"] =  $("#sysUserSearchForm").find("[name=startTime]").val();
			searchData["staffInfo.bo.entryEndTime"] =  $("#sysUserSearchForm").find("[name=endTime]").val();
			searchData["userAccount.loginName"] =  $("#sysUserSearchForm").find("[name=loginName]").val();
			searchData["userPosition.positionName"] = $("#sysUserSearchForm").find("[name=positionName]").val();
			
			searchData["userPosition.sysJob.jobName"] = $("#sysUserSearchForm").find("[name=jobName]").val();
			searchData["userPosition.sysOrganization.orgName"] = $("#sysUserSearchForm").find("[name=orgName]").val();			
			searchData=HgUtil.paramMapTrim(searchData);
			sysUserGrid.grid.datagrid('load',searchData);
		});
		
		

		//清空查询---------------------------------------------------------------------------------------------------
		$("#sysUserSearchForm").find("[tag=clear]").click(function() {
			$("#sysUserSearchForm").form("clear");
			//清空后combobox选中第一条“请选择”数据
			$("#sysUserSearchForm #staffStatus").combobox("setValue",''); 
			sysUserGrid.grid.datagrid("load", {});
		});
	
		
		
		
		
		
		
		
		



		//新增-----------------------------------------------------------------------------------------------------
		sysUserGrid.toolbar.find("[tag=add]").click(function(){
			var userDetailWin = new HgUi.window({
				id : "userDetailWin",
				width : 1000,
				height : 560,
				title : "新增用户",
				url : "/sys/sysUser/detail/view/add/0"
			});
		});

		//修改-----------------------------------------------------------------------------------------------------
		sysUserGrid.toolbar.find("[tag=edit]").click(function(){
			var row = $("#sysUser_grid").treegrid("getSelected");
			if (!row){
				$.messager.alert("提示", "请选择一条记录!", "warning");
				return;
			}
			//var iconCls = $(this).attr("iconCls");
			var userDetailWin = HgCommon.editSysUser(row.userId, function() {
				sysUserGrid.grid.datagrid("reload");
			});
		});



		//改密-----------------------------------------------------------------------------------------------------
		sysUserGrid.toolbar.find("[tag=changePwd]").click(function(){
			var row = $("#sysUser_grid").treegrid("getSelected");
			if (!row){
				$.messager.alert("提示", "请选择一条记录!", "warning");
				return;
			}
			var iconCls = $(this).attr("iconCls");
			var userChangePwdWin = new HgUi.window({
				id : "userChangePwdWin",
				width : 400,
				height : 150,
				title : "改密",
				iconCls : iconCls,
				url : "/sys/sysUser/sysUserChangePwdView/"+row.userId
			});
		});


	
})();

//刷新下方tab页面
function fresh_sysUser_tabs(){
	var userId=0;
	var row = sysUserGrid.grid.datagrid("getSelected");
	if(row != null){
		userId=row.userId;
	}
	var url='';
	var sysUser_select_tab = $('#sysUser_tabs').tabs('getSelected');
	var sysUser_select_index = $('#sysUser_tabs').tabs('getTabIndex',sysUser_select_tab);
	if(sysUser_select_index=="0"){//日志tab被选中时
		url= G_CTX_PATH+"/sys/sysUser/sysUserTabLogView?userId="+userId;
	} else if(sysUser_select_index=="1"){//用户角色tab
		url= G_CTX_PATH+"/sys/sysUser/sysUserTabRoleView?userId="+userId;
	} else if(sysUser_select_index=="2"){//用户权限tab
		url= G_CTX_PATH+"/sys/sysUser/sysUserTabAuthView?userId="+userId;
	} else if(sysUser_select_index=="3"){//用户负授权tab
		url= G_CTX_PATH+"/sys/sysUser/sysUserTabNAuthView?userId="+userId;
	} else if(sysUser_select_index=="4"){//用户岗位tab
		url= G_CTX_PATH+"/sys/sysUser/sysUserTabPosView?userId="+userId;
	} else if(sysUser_select_index=="5"){//用户小组tab
		url= G_CTX_PATH+"/sys/sysUser/sysUserTabGroupView?userId="+userId;
	}
	//直接操作tabs时,该方法可以发出请求,非直接操作时,需要手动刷新panel
	$('#sysUser_tabs').tabs('update', {
		tab: sysUser_select_tab,
		options: {
			href: url  
		}
	});
} 
//设置页面下方tabs的选中触发事件
$("#sysUser_tabs").tabs({
	onSelect:function(title,index){
		fresh_sysUser_tabs();
	}
});

//员工状态combobox
$("#sysUserSearchForm").find("#staffStatus").combobox({  
	panelHeight:'auto',
	editable:false,
	textField:'text',
	valueField:'value',
	prompt: '---请选择---',
	data:HgUtil.getDictComboboxData('STAFF_STATUS')
});  



