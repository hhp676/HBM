sysUserDetail.toEdit = function(){
	$("#userDetailWin").window("close");
	$("#sysUser_toolbar [tag=edit]").click();
}

sysUserDetail.toDel = function(){
	$("#sysUser_toolbar [tag=del]").click();
}

//校验性别
sysUserDetail.genderOnChange = function(newValue,oldValue) {
	$("#userInfoForm").validate().element($("#userInfoForm [name='gender']"));
}
//校验人员状态
sysUserDetail.staffStatusOnChange = function(newValue,oldValue) {
	$("#userStaffForm").validate().element($("#userStaffForm [name='staffStatus']"));
}

sysUserDetail.initSysUserDetail = function(mode) {
	var authManage = new sysAuthManage(1,"userAuth");
	authManage.init({userId: sysUserDetail.userId});
	var authNManage = new sysAuthManage(-1,"userNAuth");
	authNManage.init({userId: sysUserDetail.userId});

	//初始化角色grid
	$("#userRole_grid").datagrid({checkOnSelect:true,selectOnCheck:false,singleSelect:true,onLoadSuccess:function(data){
		var roleIdAry = sysUserDetail.roleIds.split(",");
		for (var index in roleIdAry) {
			for (var rowIndex in data.rows) {
				if (data.rows[rowIndex].roleId == roleIdAry[index]) {
					$("#userRole_grid").datagrid("checkRow", rowIndex);
				}
			}			
		}
	}});
	//初始化岗位tree
	$("#userposition_tree").treegrid({onLoadSuccess:function(data){
		var positionIdAry = sysUserDetail.positionIds.split(",");
		 for(var index in positionIdAry){
			 $("#userposition_tree").treegrid ('checkNode', "p_"+positionIdAry[index]);
	     }
	}});
	
	//初始化用户组tree
	$("#usergroup_tree").treegrid({onLoadSuccess:function(data){
		var groupIdAry = sysUserDetail.groupIds.split(",");
		 for(var index in groupIdAry){
			 $("#usergroup_tree").treegrid ('checkNode', "g_"+groupIdAry[index]);
	     }
	}});
	
	
	if (mode == "view"){
		// 查看详情时移除按钮
		$("#sysUserDetail_layout [tag='ok']").parent().remove();
	} else if (mode == "add") {
		$('#userAccountForm [tag=pwd]').show();
	}

	$('#userAccountForm').validate({
		rules: { 
			loginName : {required: true, rangelength: [1, 25]},
			loginPwd : {required: true, rangelength: [8, 20]},
			descr : {rangelength: [0, 500]}
		}
	});
	
	$("#userInfoForm").validate({
		rules: { 
			userName : {required: true, rangelength: [1, 20]},
			engName : {onlyEng: true, rangelength: [0, 60]},
			gender : {required: true},
			mobile : {mobile: true},
			telephone : {telephone: true},
			email : {email:true,rangelength: [1, 100]},
			address : {rangelength: [1, 200]},
			descr : {rangelength: [0, 500]}
		}
	});
	$("#userStaffForm").validate({
		rules: { 
			staffCode : {required: true, rangelength: [1, 32]},
			staffStatus : {required: true},
			entryTime : {required: true},
			idCard : {idCard: true},
			bankCard : {number: true, rangelength:[16,20]},
			descr : {rangelength: [0, 500]}
		}
	});

	$("#sysUserDetail_layout [tag='ok']").click(function() {
		if (mode == 'add') {
			_saveSysUser(true);
		} else {
			_saveSysUser();
		}
		
	});
	
	$("#sysUserDetail_layout [tag='cancel']").click(function() {
		$("#sysUserDetail_layout").parent().window("close");
	});
	
	
	
	
	

	
	// 私有页面方法------------------------------------------------------------------------------------------------------
	function _saveSysUser(isAdd) {
		// 验证表单--------------------------------------------------
		var accountCheck = $('#userAccountForm').validate().form();
		var infoCheck = $('#userInfoForm').validate().form();
		var staffCheck = $('#userStaffForm').validate().form();
		
		var staffStatus = $("#userStaffForm [name='staffStatus']").val();
		var sysUserDetailQuitTime = $("#sysUserDetailQuitTime").val();
		if(staffStatus == '0' && sysUserDetailQuitTime ==''){
			HgUi.notice("员工状态设置为离职时,离职时间不能为空!");
			return false;
		}
		if (accountCheck && infoCheck && staffCheck) {
			$("#sysUserDetail_layout").block();
			_commitSysUser(isAdd);
		}
	
		
	};
	
	
	
	function _commitSysUser(isAdd) {
		var submitData = {};
		submitData["userName"] = $.trim($("#userInfoForm [name='userName']").val());
		submitData["engName"] = $.trim($("#userInfoForm [name='engName']").val());
		submitData["gender"] = $("#userInfoForm [name='gender']").val();
		submitData["mobile"] = $.trim($("#userInfoForm [name='mobile']").val());
		submitData["birthday"] = $("#userInfoForm [name='birthday']").val();
		submitData["telephone"] = $.trim($("#userInfoForm [name='telephone']").val());
		submitData["email"] = $.trim($("#userInfoForm [name='email']").val());
		submitData["address"] = $.trim($("#userInfoForm [name='address']").val());
		submitData["descr"] = $.trim($("#userInfoForm [name='descr']").val());
		
		submitData["userAccount.loginName"] = $.trim($("#userAccountForm [name='loginName']").val());
		submitData["userAccount.loginPwd"] = $.trim($("#userAccountForm [name='loginPwd']").val());
		submitData["userAccount.descr"] = $.trim($("#userAccountForm [name='descr']").val());		
		submitData["staffInfo.staffCode"] = $.trim($("#userStaffForm [name='staffCode']").val());
		submitData["staffInfo.staffStatus"] = $("#userStaffForm [name='staffStatus']").val();
		submitData["staffInfo.entryTimeStr"] = $("#userStaffForm [name='entryTime']").val();
		submitData["staffInfo.quitTimeStr"] = $("#userStaffForm [name='quitTime']").val();
		submitData["staffInfo.idCard"] = $.trim($("#userStaffForm [name='idCard']").val());
		submitData["staffInfo.bankCard"] = $.trim($("#userStaffForm [name='bankCard']").val());
		submitData["staffInfo.descr"] = $.trim($("#userStaffForm [name='descr']").val());
		
		//tab中数据
		var checkedRoleRows = $("#userRole_grid").datagrid("getChecked");
		var checkedRoleIds = [];
		for(var index in checkedRoleRows){
			checkedRoleIds.push(checkedRoleRows[index].roleId);
		}
		submitData["roleIds"] = checkedRoleIds.join(",");
		
		authManage.onSave(function(checkedAuthIds){
			submitData["authIds"] = checkedAuthIds.join(',');
			
		});
		authNManage.onSave(function(checkedAuthIds){
			submitData["nAuthIds"] = checkedAuthIds.join(',');
		})
		
		var positionRows = $("#userposition_tree").treegrid("getCheckedNodes");
		var positionCheckedIds = [];
		for(var index in positionRows){
			positionCheckedIds.push(positionRows[index].baseId);
		}
		
		var groupRows = $("#usergroup_tree").treegrid("getCheckedNodes");
		var groupCheckedIds = [];
		for(var index in groupRows){
			groupCheckedIds.push(groupRows[index].baseId);
		}
		submitData["positionIds"] = positionCheckedIds.join(',');
		submitData["groupIds"] = groupCheckedIds.join(',');
		
		var submitUrl = "/sys/sysUser/addUser";
		if (!isAdd) {
			submitUrl = "/sys/sysUser/updUser";
			submitData["userId"] = sysUserDetail.userId;
		}
			
		
		HgUtil.post(submitUrl, submitData, function(data) {	
			HgUi.ok("保存数据成功!", function() {
				var _editCallback = $("#sysUserDetail_layout").parent().window("options").editCallback;
				
				$("#sysUserDetail_layout").parent().window("close");
				
				//2017-03-28 需要支持其他功能中修改用户信息，获取是否有editCallback
				if (_editCallback) {
					_editCallback();
				} else {
					$('#sysUser_grid').datagrid("reload");
				}
			});
		},function(data){
			HgUi.error(JSON.parse(data.responseText).data,function(){
				$("#sysUserDetail_layout").unblock();
			});			
		});
	}
	
};

sysUserDetail.showFormTextboxTips = function() {
	
	showFormTextboxTip("userAccountForm",['descr']);
	showFormTextboxTip("userInfoForm",['email','address','descr']);
	showFormTextboxTip("userStaffForm",['idCard','bankCard','descr']);
	
	/**
	 * form文本框input/textarea显示tip
	 * formId:唯一
	 */
	function showFormTextboxTip(formId, fieldNames) {
		if (!(fieldNames instanceof Array)){
			return;
		}
		for (var index in fieldNames){
			var fieldName = fieldNames[index];
			var itemObj = $("#" + formId).find("input[name='" + fieldName + "'],textarea[name='" + fieldName + "']");
			if(itemObj.length){
    			showTextboxTip(itemObj);
			}
		}
	};
	/**
	 * 数据溢出时文本框上显示tip
	 * input:数据溢出时offsetWidth<scrollWidth
	 * textarea:数据溢出时offsetHeight<scrollHeight
	 */
	function showTextboxTip(itemObj) {
		itemObj.each(function(i) {
			var width = $(this).width();
			var text = $(this).val();
			//将字符转译,防脚本攻击yyzh
			text = text.replace(/[<>&"]/g,function(c){return {'<':'&lt;','>':'&gt;','&':'&amp;','"':'&quot;'}[c];});
			if (text && 
					( this.offsetWidth < this.scrollWidth
	 						|| this.offsetHeight < this.scrollHeight )) {
				//文本框disabled时用title
				$(this).attr("title",text);
				/*
				//文本框未disabled时tooltip可用
				var content = "<div style='width:"+width+"px;word-wrap: break-word; word-break: normal; '>"+text+"</div>";
				$(this).tooltip({
					content : content,
					position :"bottom",
					onShow:function(){
						var tip_ = $(this);
						tip_.tooltip('tip').unbind().bind('mouseenter', function(){
							tip_.tooltip('show');
						}).bind('mouseleave', function(){
							tip_.tooltip('hide');
						});
					}
				});*/
			}
		});
	}
}

$("#sysAuthManage_grid_userAuth_table #treeGridShowNext").hide();
var sysAuthManage_grid_userAuth = {};
sysAuthManage_grid_userAuth.grid = $ ("#sysAuthManage_grid_userAuth");

/**
 * 查询匹配字段值
 * @author yinyanzhen
 */
sysAuthManage_grid_userAuth.searchStr = function(){
	sysAuthManage_grid_userAuth.sysAuthLocation = 
		new sysAuthLocation(sysAuthManage_grid_userAuth.grid, 
			 $("#sysAuthManage_grid_userAuth_table #authName").val(), 
			 $("#sysAuthManage_grid_userAuth_table #treeGridShowNext"));
	sysAuthManage_grid_userAuth.sysAuthLocation.searchStr();
}
/**
 * 定位下一个匹配值
 */
sysAuthManage_grid_userAuth.showNext = function (){
	sysAuthManage_grid_userAuth.sysAuthLocation.showNext();
}

/**************************************负授权定位***************************************/
$("#sysAuthManage_grid_userNAuth_table #treeGridShowNext").hide();
var sysAuthManage_grid_userNAuth = {};
sysAuthManage_grid_userNAuth.grid = $ ("#sysAuthManage_grid_userNAuth");
sysAuthManage_grid_userNAuth.onLoadSuccess = function(row, data){
	sysAuthManage_grid_userNAuth.data = data;
}

/**
 * 查询匹配字段值
 * @author yinyanzhen
 */
sysAuthManage_grid_userNAuth.searchStr = function(){
	sysAuthManage_grid_userNAuth.sysAuthLocation = 
		new sysAuthLocation(sysAuthManage_grid_userNAuth.grid, 
			 $("#sysAuthManage_grid_userNAuth_table #authName").val(), 
			 $("#sysAuthManage_grid_userNAuth_table #treeGridShowNext"));
	sysAuthManage_grid_userNAuth.sysAuthLocation.searchStr();
}
/**
 * 定位下一个匹配值
 */
sysAuthManage_grid_userNAuth.showNext = function (){
	sysAuthManage_grid_userNAuth.sysAuthLocation.showNext();
}
