/**
 * 
 */
(function() {
	
	var sysUserTabGroupGrid = new HgUi.Datagrid("sysUserTabGroupView_grid");
	sysUserTabGroupGrid.grid = $("#sysUserTabGroupView_grid");
	sysUserTabGroupGrid.toolbar = $("#sysUserTabGroupView_toolbar");
	sysUserTabGroupGrid.options.tipCells = ["sysGroup.groupName","sysGroup.descr","sysGroup.sysOrganization.orgName","sysGroup.groupCode","isLeader"];

	sysUserTabGroupGrid.init();
	function rowGroupCheckFunc(callback) {
		return function() {
			var row = sysUserTabGroupGrid.grid.datagrid("getSelected");
			if (!row){
				$.messager.alert("提示", "请选择一条小组数据", "warning");
				return;
			}
			callback(row);
		};
	}
	
	function rowUserCheckFunc(callback) {
		return function() {
			var row = sysUserGrid.grid.datagrid("getSelected");
			if (!row){
				$.messager.alert("提示", "请选择一条用户数据", "warning");
				return;
			}
			callback(row);
		};
	}
	
	/**
	 * 管理编辑
	 */
	sysUserTabGroupGrid.toolbar.find("a[tag='edit']").click(rowUserCheckFunc(function(row) {
		var rows = sysUserTabGroupGrid.grid.datagrid('getRows');
		HgUtil.chooseSysGroup(rows, function(groupIds) {
			var groupIdstr = groupIds.join(',');
			HgUtil.post("/sys/org/updateUserGroup", {
			    userId: row['userId'],
			    "groupIds": groupIdstr
			}, function() {
				sysUserTabGroupGrid.grid.datagrid("reload");
			});
		});
	}));
	
	/**
	 * 设置组长
	 */
	sysUserTabGroupGrid.toolbar.find("[tag=setLeader]").click(rowGroupCheckFunc(function(row) {
		if (row["isLeader"] == 1){
			$.messager.alert("提示", "该成员已经是组长", "warning");
			return;
		}
		$.messager.confirm("确认调整", "确认将选中的成员设为组长?", function(r) {
			if (r){
				HgUtil.post("/sys/org/groupUser/setLeader", {
				    groupUserId: row["groupUserId"],
				    groupId: row["groupId"],
				    userId: row["userId"]
				}, function() {
					HgUi.ok("修改成功!", function() {
						sysUserTabGroupGrid.grid.datagrid("reload");
					});
				});
			}
		});
	}));
	
})();
