var sysMenuSet = {};
sysMenuSet._createCombbox = function() {
	return "<select class='easyui-combobox' style='width: 100%;'><option value='1'>一级</option><option value='2'>二级</option><option value='3'>三级</option></select>";
}
sysMenuSet._format_edit = function(value, row, index) {
	return '<a href=\"#\" class=\"easyui-menubutton\" onclick=\"sysMenuSet._edit(\'' + value + '\');\">编辑</a>&nbsp;&nbsp;'
	        + '<a href=\"#\" class=\"easyui-menubutton\" onclick=\"sysMenuSet._confirm(\'' + value + '\');\">确认</a>';
}
sysMenuSet._edit = function(rowId) {
	$('#menu_grid').treegrid('select', rowId);
	var row = $('#menu_grid').treegrid('getSelected');
	if (row){
		if (row.isFinal ==1){
			HgUi.notice("该记录已锁定。");
			return;
		}
		$('#menu_grid').treegrid('beginEdit', row.id);
	}
}
sysMenuSet._confirm = function(rowId) {
	if (!rowId){
		return;
	}
	var url ='/sys/model/update';
	var data ={};
	data.modelId = rowId;
	/*获取编辑器,读取编辑器值*/
	var editor = $('#menu_grid').treegrid('getEditor', {id:rowId,field:'isTopMenu'});
	data.isTopMenu = $(editor.target).combobox('getValue');
	/*获取编辑器,读取编辑器值*/
	editor = $('#menu_grid').treegrid('getEditor', {id:rowId,field:'isSubMenu'});
	data.isSubMenu = $(editor.target).combobox('getValue');
	HgUtil.post(url, data, function(data){
		$('#menu_grid').treegrid('endEdit', rowId);
	},function(XMLHttpRequest, textStatus, errorThrown){
		HgUi.notice(JSON.parse(XMLHttpRequest.responseText).data);
	});
}
/*function _save() {
	return $('#menu_grid').treegrid('getChildren');
}*/

sysMenuSet._search = function() {
	var params={
	    authName: $("#menusetSearchForm [name='authName']").val(),
	    fid: $("#fidlevel").combobox('getValue')
	};
	$('#menu_grid').treegrid('load', HgUtil.paramMapTrim(params));
	
}
sysMenuSet._clear = function() {
	$("#menusetSearchAuthName").textbox("setValue","");
	$("#fidlevel").combobox('setValue', '');
	$('#menu_grid').treegrid('load', {
	    authName: $("#menusetSearchForm [name='authName']").val(),
	    fid: $("#fidlevel").combobox('getValue')
	});
}
