$("#sysRoleAuth_toolbar #sysRoleAuthGridShowNext").hide();
var sysRoleAuthGrid = {};
sysRoleAuthGrid.grid = $ ("#sysRoleAuth_grid");
sysRoleAuthGrid.toolbar = $ ("#sysRoleAuth_toolbar");
sysRoleAuthGrid._selectedRow = sysRoleGrid.grid.datagrid ("getSelected");

/**
 * 查询匹配字段值
 * @author yinyanzhen
 */
sysRoleAuthGrid.searchStr = function(){
	sysRoleAuthGrid.sysAuthLocation = new sysAuthLocation(sysRoleAuthGrid.grid, 
			 $("#sysRoleAuth_toolbar #authName").val(), $("#sysRoleAuth_toolbar #sysRoleAuthGridShowNext"));
	sysRoleAuthGrid.sysAuthLocation.searchStr();
}
/**
 * 定位下一个匹配值
 */
sysRoleAuthGrid.showNext = function (){
	sysRoleAuthGrid.sysAuthLocation.showNext();
}

if (sysRoleAuthGrid._selectedRow != null)
{
	sysRoleAuthGrid.grid.treegrid (
	{
		url : G_CTX_PATH + '/sys/sysAuthMenu/getRoleAuthList?roleId='+sysRoleAuthGrid._selectedRow['roleId']
//	    url : G_CTX_PATH + '/sys/sysRole/authList',
//	    onBeforeCheckNode : sysRoleAuthGrid.onBeforeCheckNode
	});
}
else
{
	sysRoleAuthGrid.grid.treegrid ({});
}

sysRoleAuthGrid.toolbar.find ("[tag=manage]").click (function ()
{
	var _selectedRow = sysRoleGrid.grid.datagrid ('getSelected');
	if (_selectedRow == null)
	{
		HgUi.error ("请首先选择角色。", function ()
		{
		});
		return;
	} else if (_selectedRow.roleId == null){
    	HgUi.error ("请先保存新建角色。");
	    return;
	}
	if (_selectedRow.isFinal==1) {
		HgUi.alert ("所选角色已经被锁定");
		return;
	}
	
	HgUtil.chooseSysAuth (
	{
		queryParams :
		{
			roleId : _selectedRow['roleId']
		}
	}, function (checkedAuthIds)
	{
		var checkedAuthIdsStr = checkedAuthIds.join (',');
		HgUtil.post ("/sys/sysRoleAuth/refresh",
		{
		    roleId : _selectedRow['roleId'],
		    authIds : checkedAuthIdsStr
		}, function ()
		{
			$ ("#sysRoleAuthView").panel ('refresh');
		})
	});
	
})
