var sysAuth = {};
var sysModel = {};

$("#sysAuth_toolbar #treeGridShowNext").hide();
sysAuth.grid = $("#sysAuth_layout #sysAuth_grid");
/**
 * 查询匹配字段值
 * @author yinyanzhen
 */
sysAuth.searchStr = function(){
	sysAuth.sysAuthLocation = 
		new sysAuthLocation(sysAuth.grid, 
			 $("#sysAuth_toolbar #authName").val(), 
			 $("#sysAuth_toolbar #treeGridShowNext"));
	sysAuth.sysAuthLocation.searchStr();
}
/**
 * 定位下一个匹配值
 */
sysAuth.showNext = function (){
	sysAuth.sysAuthLocation.showNext();
}

HgUi.toggleSearchBar("sysAuth_toolbar", function() {
	$('#sysAuth_layout').layout('collapse', 'south');
}, function() {
	$('#sysAuth_layout').layout('expand', 'south');
});

/*sysAuth.centerPanelOnResize = function() {
	sysAuth.fixToolPanelHeight();
	return true;
}

sysAuth.fixToolPanelHeight = function() {
    //修改ToolPanel的高度
	$("#sysAuth_layout .panel-tool").height(20);
}*/

sysAuth.authCategoryOnChange = function(newValue,oldValue) {
	sysAuth.authJoinTabChange();
	$("#sysAuthSearchForm [tag='submit']").click();
}

sysAuth.authJoinTabChange = function() {
	var sysAuth_authCategroy = $("#sysAuth_authCategroy").combobox("getValue");
	$("#sysAuth_tabs").tabs('close','附属权限');
	$("#sysAuth_tabs").tabs('close','主权限');
	
	if (sysAuth_authCategroy == 1) {
		$('#sysAuth_tabs').tabs('enableTab','授予角色');
		$('#sysAuth_tabs').tabs('enableTab','授予用户');
		$('#sysAuth_tabs').tabs('enableTab','负授予用户');
		$('#sysAuth_tabs').tabs('select','授予角色');
	} else {
		$('#sysAuth_tabs').tabs('disableTab','授予角色');
		$('#sysAuth_tabs').tabs('disableTab','授予用户');
		$('#sysAuth_tabs').tabs('disableTab','负授予用户');
	}
	
	$('#sysAuth_tabs').tabs('add',{
		title: sysAuth_authCategroy == 1 ? "附属权限" : "主权限",
		selected: sysAuth_authCategroy == 1 ? false : true,
		href:G_CTX_PATH+"/sys/sysAuthMenu/mainAttachAuthJoinView/" + sysAuth_authCategroy
	})
}

sysAuth.authShowTypeFormatter = function(value,row,index){
	if(value == 1) {
		return '模块';
	}else if(value == 2) {
		return HgUtil.getDictItemName('AUTH_CATEGORY', row.authCategory);
	}
}

sysAuth.authGridOnLoadSuccess = function(row, data){
	/*sysAuth_grid.data = data;//记录数据
	$("#sysAuth_grid").treegrid("clearSelections");*/
	HgUi.showGridCellTip("sysAuth_grid", ['authName','authShowType','authCode','engName','uri','descr']);
}

sysAuth.initSysAuthShow = function() {
	
	//----------------------------------数据加载------------------------------
	$("#sysAuth_authCategroy").combobox();//初始化组件
	$('#sysAuth_grid').treegrid({
		url: G_CTX_PATH+'/sys/sysAuthMenu/list',
		queryParams: {
			authCategory:$("#sysAuth_authCategroy").combobox("getValue")
		}
	});
	
	// ----------------------------------查询-----------------------------------------------------
	$("#sysAuthSearchForm [tag='submit']").click(function() {
		var paramMap={
			    authName: $("#sysAuthSearchForm [name='authName']").val(),
			    authCodeLike: $("#sysAuthSearchForm [name='authCodeLike']").val(),
			    engName: $("#sysAuthSearchForm [name='engName']").val(),
			    i18nCode: $("#sysAuthSearchForm [name='i18nCode']").val(),
			    iconId: $("#sysAuthSearchForm [name='iconId']").val(),
			    authShowType: $("#searchAuthType").combobox('getValue'),
			    style: $("#sysAuthSearchForm [name='style']").val(),
			    uriLike: $("#sysAuthSearchForm [name='uriLike']").val(),
			    tip: $("#sysAuthSearchForm [name='tip']").val(),
			    descr: $("#sysAuthSearchForm [name='descr']").val(),
			    authCategory:$("#sysAuth_authCategroy").combobox("getValue")
			};
		paramMap=HgUtil.paramMapTrim(paramMap);
		$('#sysAuth_grid').treegrid('load', paramMap);
		
	});
	
	// ----------------------------------清空-----------------------------------------------------
	$("#sysAuthSearchForm [tag='clear']").click(function() {
		$('#sysAuthSearchForm').form('clear');
		$("#searchAuthType").combobox('setValue','');
		$('#sysAuth_grid').treegrid("load", {authCategory:$("#sysAuth_authCategroy").combobox("getValue")});
	});
	
	// ---------------------新增--------------------------------------------------------
	$("#auth_toolbar_menu [tag='modelAdd']").click(function() {
		sysModel.mode = "add";
		var row = $("#sysAuth_grid").treegrid("getSelected");
		if (!row){
			$.messager.alert("提示", "请选择父模块!", "warning");
			return;
		}
		if (row.authShowType != 1){
			$.messager.alert("提示", "非模块权限不可添加子权限!", "warning");
			return;
		}
		var iconCls = $(this).find("i").attr("class");
		var addUrl = "/sys/sysAuthMenu/detail/1/0/" + row.authId;
		var authDetailWin = new HgUi.window({
		    id: "authDetailWin",
		    width: 800,
		    height: 480,
		    title: "添加模块",
		    iconCls: iconCls,
		    url: addUrl
		});
	});
	
	$("#auth_toolbar_menu [tag='authAdd']").click(function() {
		sysAuth.mode = "add";
		var row = $("#sysAuth_grid").treegrid("getSelected");
		if (!row){
			$.messager.alert("提示", "请选择所属模块!", "warning");
			return;
		}
		if (row.authShowType != 1){
			$.messager.alert("提示", "非模块权限不可添加子权限!", "warning");
			return;
		}
		var iconCls = $(this).find("i").attr("class");
		var addUrl = "/sys/sysAuthMenu/detail/2/0/" + row.authId;
		var authDetailWin = new HgUi.window({
		    id: "authDetailWin",
		    width: 800,
		    height: 485,
		    title: "添加权限",
		    iconCls: iconCls,
		    url: addUrl
		});
	});
	
	// -------------------------------------------修改---------------------------------------------------
	$("#sysAuth_toolbar [tag='edit'],#sysAuth_contextMenu [tag='edit']").click(function() {
		sysAuth.mode = "edit";
		sysModel.mode = "edit";
		var row = $("#sysAuth_grid").treegrid("getSelected");
		if (!row){
			$.messager.alert("提示", "请选择一条数据!", "warning");
			return;
		}
		if (row.isFinal == 1){
			$.messager.alert("提示", "此条数据不可被修改!", "warning");
			return;
		}
		var id = row.authId;
		var authShowType = row.authShowType;
		var editUrl = "/sys/sysAuthMenu/detail/" + authShowType + "/" + id + "/0";
		var winHeight = 480, winTitle = "";
		if (authShowType == 1){// 模块权限
			winHeight = 480, winTitle = "修改模块";
		}
		else if (authShowType == 2){// 操作权限
			winHeight = 480, winTitle = "修改权限";
		}
		
		var iconCls = $(this).find("i").attr("class");
		var authDetailWin = new HgUi.window({
		    id: "authDetailWin",
		    width: 800,
		    height: winHeight,
		    title: winTitle,
		    iconCls: iconCls,
		    url: editUrl + id
		});
	});
	
	// -------------------------------------------删除---------------------------------------------------
	$("#sysAuth_toolbar [tag='del']").click(function() {
		var row = $("#sysAuth_grid").treegrid("getSelected");
		if (!row){
			$.messager.alert("提示", "请选择一条数据!", "warning");
			return;
		}
		if (row.isFinal == 1){
			$.messager.alert("提示", "此条数据不可被删除!", "warning");
			return;
		}
		$.messager.confirm("删除确认", "确认删除此条数据?", function(r) {
			if (r){
				_checkAuthRelation(row.authId, row.authShowType);
			}
		});
		
	});
	
	// 操作类型
	$("#sysAuth_toolbar [tag='oper']").click(function() {
		var iconCls = $(this).find("i").attr("class");
		var url = "/sys/sysOperation/view";
		var sysAuthWin = new HgUi.window({
		    id: "sysAuthWin",
		    width: 800,
		    height: 480,
		    title: "操作类型配置",
		    iconCls: iconCls,
		    url: url
		});
	});
	
	// 首页MENU配置
	$("#sysAuth_toolbar [tag='menuset']").click(function() {
		var url = "/sys/sysAuthMenu/menuset_view";
		var iconCls = $(this).find("i").attr("class");
		HgUi.dialog({
		    id: 'menusetwin',
		    url: url,
		    queryParams: {},
		    width: 800,
		    height: 480,
		    title: "首页MENU配置",
		    iconCls: iconCls
		});
	});
	
	// 右键菜单新增模块
	$("#modelTreeContextMenu [tag='addModel']").click(function() {
		$("#auth_toolbar_menu [tag=modelAdd]").click();
	});
	// 右键菜单新增权限
	$("#modelTreeContextMenu [tag='addAuth']").click(function() {
		$("#auth_toolbar_menu [tag=authAdd]").click();
	});
	// 右键关于
	$("#modelTreeContextMenu [tag='aboutModel'],#authTreeContextMenu [tag='aboutAuth']").click(function() {
		var row = $("#sysAuth_grid").treegrid("getSelected");
		HgUtil.aboutDialog('/sys/sysAuthMenu/aboutDialogView', {
		    authId: row.authId,
		    authShowType: row.authShowType
		});
	});
	// 右键菜单授予角色
	$("#authTreeContextMenu [tag='toRole']").click(function() {
		sysAuth.toRoleEdit();
	});
	// 右键菜单授予用户
	$("#authTreeContextMenu [tag='toUser']").click(function() {
		_grantSysUserAuthView(1);
	});
	
	// 右键菜单负授予用户
	$("#authTreeContextMenu [tag='unUser']").click(function() {
		_grantSysUserAuthView(-1);
	});
}

sysAuth.initSysAuthShow();

sysAuth.toRoleEdit = function(){
	var _selectedRow = $("#sysAuth_grid").treegrid("getSelected");
	if (_selectedRow == null || _selectedRow.authShowType !='2'){
		HgUi.error("请首先选择权限!", function() {
		});
		return;
	}
	
	HgUtil.chooseSysRole(function(rows) {
		var roleIds = [];
		if (rows instanceof Array){
			for ( var index=0; index<rows.length; index++){
				if(rows[index].roleId != null){
					roleIds.push(rows[index].roleId);
				}
			}
		}
		else{
			roleIds.push(rows.roleId);
		}
		var existRole="";
		var seRoleRows=$("#sysRole_grid_view").datagrid("getRows");
		for(var i=0;i<seRoleRows.length;i++){
			for(var j = 0;j<rows.length;j++){
				if (seRoleRows[i].roleId == rows[j].roleId){
					existRole = existRole + seRoleRows[i].roleName+",";
				}
			}
		}
		if(existRole != ""){
			HgUi.error("角色 :" + existRole + "已被授予!");
			return;
		}
		HgUtil.post("/sys/sysRoleAuth/addBatch", {
		    authId: _selectedRow.authId,
		    roleIds: roleIds.join(',')
		}, function(data) {
			if(!data.success){
				$.messager.alert("提示","保存失败,"+data.data,"warning");
			}else{
				HgUi.ok("保存成功!", function() {
					sysAuthOnClickRow();
				});
			}
		})
	}, 'multiple');
}

sysAuth.delRole = function (){
	var rows = $("#sysRole_grid_view").datagrid("getSelections");
	if (rows.length == 0){
		$.messager.alert("提示", "请选择数据!", "warning");
		return;
	}
	$.messager.confirm("删除确认", "确认删除此条数据?", function(r) {
		if (r){
			var roleIds = [];
			if (rows instanceof Array){
				for ( var index=0; index<rows.length; index++){
					if(rows[index].roleId != null){
						roleIds.push(rows[index].roleId);
					}
				}
			}
			else{
				roleIds.push(rows.roleId);
			}
			var _selectedRow = $("#sysAuth_grid").treegrid("getSelected");
			HgUtil.post("/sys/sysRoleAuth/deleteBatch", {
			    authId: _selectedRow.authId,
			    roleIds: roleIds.join(',')
			}, function() {
				HgUi.ok("删除成功!", function() {
					$("#sysRole_grid_view").datagrid("reload");
				});
			})
		}
	});
}

// -------------------------------------------查看详情---------------------------------------------------
function sysAuthOnDblClickRow() {
	sysAuth.mode = "view";
	sysModel.mode = "view";
	var row = $("#sysAuth_grid").datagrid("getSelected");
	if (!row){
		$.messager.alert("提示", "请选择一条数据!", "warning");
		return;
	}
	
	var id = row.authId;
	var authShowType = row.authShowType;
	var winHeight = 400;
	var url = "/sys/sysAuthMenu/detail/" + authShowType + "/" + id + "/0";
	var iconCls = $(this).attr("iconCls");
	var authDetailWin = new HgUi.window({
	    id: "authDetailWin",
	    width: 800,
	    height: winHeight,
	    title: "查看详情",
	    iconCls: iconCls,
	    url: url + id
	});
}

function sysAuthOnClickRow() {
	var row = $("#sysAuth_grid").datagrid("getSelected");
	var authShowType = row.authShowType;
	if (2 == authShowType){
		var authId = row.id;
		$('#sysRole_grid_view').datagrid("load", {
			authId: authId
		});
		$('#sysUser_grid_view').datagrid("load", {
		    authId: authId,
		    authType: 1
		});
		$('#sysUser_grid_neg_view').datagrid("load", {
		    authId: authId,
		    authType: -1
		});
		
		if ($('#mainAttachAuthJoin_grid').length > 0) {
			var _param = {};
			if (row.authCategory == 1) {
				_param.mainAuthId = authId;
			} else {
				_param.attachAuthId = authId;
			}
			$("#mainAttachAuthJoin_grid").datagrid("load", _param);
		}
	} else {
		$('#sysRole_grid_view').datagrid("load", {});
		$('#sysUser_grid_view').datagrid("load", {});
		$('#sysUser_grid_neg_view').datagrid("load", {});
		
		if ($('#mainAttachAuthJoin_grid').length > 0) {
			$("#mainAttachAuthJoin_grid").datagrid("load", {authJoinId:'-1'});
		}
	}
}

function _checkAuthRelation(id, authShowType) {
	HgUtil.getJson("/sys/sysAuthMenu/checkAuthRelation", {
	    authId: id,
	    authShowType: authShowType
	}, function(data) {
		if (data.success){
			_submitDel(id, authShowType);
		}
		else{
			HgUi.error(data.data, function() {
			});
		}
	});
}

function _grantSysUserAuthView(authType) {
	var _selectedRow = $("#sysAuth_grid").treegrid("getSelected");
	if (_selectedRow == null || _selectedRow.authShowType !='2'){
		HgUi.error("请首先选择权限!", function() {
		});
		return;
	}
	
	HgUtil.chooseSysUser(function(rows) {
		var userIds = [];
		if (rows instanceof Array){
			for ( var index=0; index<rows.length; index++){
				if(rows[index].userId != null){
					userIds.push(rows[index].userId);
				}
			}
		}
		else{
			userIds.push(rows.userId);
		}
		var seUserRows=[];
		if (1 == authType){
			var seUserRows=$("#sysUser_grid_view").datagrid("getRows");
		} else if (-1 == authType){
			var seUserRows=$("#sysUser_grid_neg_view").datagrid("getRows");
		}
		var existUser="";
		for(var i=0;i<seUserRows.length;i++){
			for(var j = 0;j<rows.length;j++){
				if (seUserRows[i].userId == rows[j].userId){
					existUser = existUser + seUserRows[i].userName+",";
				}
			}
		}
		if(existUser != ""){
			HgUi.error("用户  :" + existUser + "已被授予!");
			return;
		}
		HgUtil.post("/sys/sysUserAuth/addBatch", {
		    authId: _selectedRow.authId,
		    userIds: userIds.join(','),
		    authType: authType
		}, function(data) {
			if(!data.success){
				$.messager.alert("提示","保存失败,"+data.data,"warning");
			}else{
				HgUi.ok("保存成功!", function() {
					sysAuthOnClickRow();
				});
			}
		})
	}, 'multiple');
}

function _grantSysUserAuthNegView(authType) {
	var rows;
	if (1 == authType){
		rows = $("#sysUser_grid_view").datagrid("getSelections");
	}
	else if (-1 == authType){
		rows = $("#sysUser_grid_neg_view").datagrid("getSelections");
	}
	if (rows.length == 0){
		$.messager.alert("提示", "请选择数据!", "warning");
		return;
	}
	$.messager.confirm("删除确认", "确认删除此条数据?", function(r) {
		if (r){
			var _selectedRow = $("#sysAuth_grid").treegrid("getSelected");
			var userIds = [];
			if (rows instanceof Array){
				for ( var index=0; index<rows.length; index++){
					if(rows[index].userId != null){
						userIds.push(rows[index].userId);
					}
				}
			}
			else{
				userIds.push(rows.userId);
			}
			HgUtil.post("/sys/sysUserAuth/deleteBatch", {
			    authId: _selectedRow.authId,
			    userIds: userIds.join(','),
			    authType: authType
			}, function() {
				HgUi.ok("删除成功!",function(){
					if (1 == authType){
						rows = $("#sysUser_grid_view").datagrid("reload");
					} else if (-1 == authType){
						rows = $("#sysUser_grid_neg_view").datagrid("reload");
					}
				});	
			})
		}
	});
}
function _submitDel(id, authShowType) {
	HgUtil.getJson("/sys/sysAuthMenu/delete", {
	    authId: id,
	    authShowType: authShowType
	}, function(data) {
		if (data.success){
			HgUi.ok("删除成功!", function() {
				$('#sysAuth_grid').treegrid("reload");
			});
		}
		else{
			HgUi.error(data.data, function() {
			});
		}
	});
}

function treeContextMenu(e, row) {
	e.preventDefault();
	$(this).treegrid('select', row.id);
	var authShowType = row.authShowType;
	if (1 == authShowType){
		$('#modelTreeContextMenu').menu('show', {
		    left: e.pageX,
		    top: e.pageY
		});
	}
	else if (2 == authShowType){
		if (row.authCategory == 2) {
			$('#authTreeContextMenu').menu('hideItem',$("#authTreeContextMenu [tag='toRole']"));
			$('#authTreeContextMenu').menu('hideItem',$("#authTreeContextMenu [tag='toUser']"));
			$('#authTreeContextMenu').menu('hideItem',$("#authTreeContextMenu [tag='unUser']"));
		} else {
			$('#authTreeContextMenu').menu('showItem',$("#authTreeContextMenu [tag='toRole']"));
			$('#authTreeContextMenu').menu('showItem',$("#authTreeContextMenu [tag='toUser']"));
			$('#authTreeContextMenu').menu('showItem',$("#authTreeContextMenu [tag='unUser']"));
		}
		$('#authTreeContextMenu').menu('show', {
		    left: e.pageX,
		    top: e.pageY
		});
	}
}

function _commitMenuSet(rows) {
	var submitUrl = "/sys/sysAuthMenu/updateMenuSet";
	HgUtil.post(submitUrl, {
		sysAuthJson: JSON.stringify(rows)
	}, function(data) {
		if (!data.success){
			$("#menu_layout").unblock();
			HgUi.error(data.data, function() {
			});
		}
		else{
			$("#menu_layout").unblock();
			HgUi.ok("保存数据成功!", function() {
				$('#menusetwin').dialog('close');
			});
		}
	});
}

/**
 * 主权限、附属权限关联弹窗
 * type 1：主权限设置附属权限  2：附属权限设置关联主权限
 * authId  type=1:主权限ID type=2:附属权限id
 */
sysAuth.chooseMainAttachAuthViewDialog = function(type, authId, callback) {
	HgUi.dialog({
		id:"chooseMainAttachAuthViewDialog",
		url:"/sys/sysAuthMenu/chooseMainAttachAuthView",
		queryParams:{type:type,authId:authId},
		title:type == 1 ? "附属权限配置" : "主权限配置",
		iconCls:"fa fa-cog",
		width : 1000,
		height : 600
	});	
	sysAuth.chooseMainAttachAuthCallback = callback;
}
