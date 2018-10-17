var chooseMainAttachAuth = {};
chooseMainAttachAuth.type = chooseMainAttachAuth_type;
chooseMainAttachAuth.init = function() {
	_param = {type : chooseMainAttachAuth.type, authId : chooseMainAttachAuth_authId};
	
	chooseMainAttachAuth.checkedIds = [];
	HgUtil.getJson("/sys/sysAuthMenu/getMainAttachJoinedList",_param,function(data){
		for (var index=0; index<data.length; index++){
			if (chooseMainAttachAuth.type == '1') {
				chooseMainAttachAuth.checkedIds.push(data[index].attachAuthId);
			} else {
				chooseMainAttachAuth.checkedIds.push(data[index].mainAuthId);
			}
		}
		_authParam = {};
		//1：主权限设置附属权限 需要 选择附属权限  2：附属权限设置关联主权限 需要 选择主权限
		if (chooseMainAttachAuth.type == '1') {
			_authParam = {authCategory : 2};
		} else {
			_authParam = {authCategory : 1};
		}
		
		$("#chooseMainAttachAuth_grid").treegrid({
			url: G_CTX_PATH+ "/sys/sysAuthMenu/chooseMainAttachAuthList",
			queryParams:_authParam,
			onLoadSuccess:function(row, authData){
				$("#chooseMainAttachAuth_grid").treegrid('loading');
				for(var index in chooseMainAttachAuth.checkedIds){
					$("#chooseMainAttachAuth_grid").treegrid('checkNode',chooseMainAttachAuth.checkedIds[index]);
				}
				$("#chooseMainAttachAuth_grid").treegrid('loaded');
			},
			checkbox:function(row){
	    		if (row['authShowType'] != '2'){
	    			return false;
	    		}
	    		return true;
	    	},
			
		});
		
	});
}

chooseMainAttachAuth.init();

chooseMainAttachAuth.grid = $ ("#chooseMainAttachAuth_layout #chooseMainAttachAuth_grid");

/**
 * 查询匹配字段值
 * @author yinyanzhen
 */
chooseMainAttachAuth.searchStr = function(){
	chooseMainAttachAuth.sysAuthLocation = new sysAuthLocation(chooseMainAttachAuth.grid, 
			$("#chooseMainAttachAuth_layout #authName").val(), $("#chooseMainAttachAuth_layout #treeGridShowNext"));
	chooseMainAttachAuth.sysAuthLocation.searchStr();
}
/**
 * 定位下一个匹配值
 */
chooseMainAttachAuth.showNext = function (){
	chooseMainAttachAuth.sysAuthLocation.showNext();
}


chooseMainAttachAuth.onSave = function(callback) {
	var checkedNodes = $("#chooseMainAttachAuth_grid").treegrid("getCheckedNodes");
	var checkedAuthNodes = [];
	for(var index in checkedNodes){
		if (checkedNodes[index].authShowType==2){
			checkedAuthNodes.push(checkedNodes[index]);
		}
	}
	return callback(checkedAuthNodes);
}

$("#chooseMainAttachAuth_layout [tag=ok]").click(function(){
	var flag = chooseMainAttachAuth.onSave(sysAuth.chooseMainAttachAuthCallback);
	if(flag){
		$('#chooseMainAttachAuthViewDialog').dialog('close');
	}
});


$("#chooseMainAttachAuth_layout [tag=cancel]").click(function(){
	$('#chooseMainAttachAuthViewDialog').dialog('close');
});