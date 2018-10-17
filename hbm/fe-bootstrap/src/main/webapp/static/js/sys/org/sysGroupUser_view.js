/**
 * 组织架构。 Created by qiujingde on 2016/12/22. / /
 */
var sysGroupUserListGrid = new HgUi.Datagrid("sysGroupUserList_grid");
sysGroupUserListGrid.toolbar = $("#sysGroupUserList_toolbar");
sysGroupUserListGrid.options.isShowContextMenu = true;
sysGroupUserListGrid.init();
sysGroupUserListGrid.bindDefaultToolbarEvent();
sysGroupUserListGrid.options.onLoadSuccess = function() {
};
sysGroupUserListGrid.reload = function() {
	sysGroupUserListGrid.grid.datagrid("reload");
};

(function() {
	//-----------------------------添加-----------------------------
	sysGroupUserListGrid.toolbar.find("[tag=addUser]").click(function() {
		HgUtil.chooseSysUser(function(rows) {
			var userIds = [];
			if (rows instanceof Array){
				for ( var index=0; index<rows.length; index++){
					userIds.push(rows[index].userId);
				}
			}
			else{
				userIds.push(rows.userId);
			}
			// 添加用户
			HgUtil.post("/sys/org/groupUser/addGroupToUsers", {
			    groupId: sysGroupUserListGroupId,
			    userIds: userIds.join(',')
			}, function() {
				HgUi.ok("添加成功!", function() {
					sysGroupUserListGrid.grid.datagrid("reload");
				});
			});
		}, 'multiple');
	});
	
	function rowCheckFunc(callback) {
		return function() {
			var row = sysGroupUserListGrid.grid.datagrid("getSelected");
			if (!row){
				$.messager.alert("提示", "请选择一条数据", "warning");
				return;
			}
			callback(row);
		};
	}
	
	//-----------------------------删除-----------------------------
	sysGroupUserListGrid.toolbar.find("[tag=del]").click(rowCheckFunc(function(row) {
		var rows = $("#sysGroupUserList_grid").datagrid("getSelections");
		if (rows.length ==0){
			$.messager.alert("提示", "需要至少选择一条数据!", "warning");
			return;
		}
		$.messager.confirm("确认删除", "确认将选中的数据删除?", function(r) {
			if (r){
				var groupUserIds = [];
				if (rows instanceof Array){
					for ( var index=0; index<rows.length; index++){
						groupUserIds.push(rows[index].groupUserId);
					}
				}else{
					groupUserIds.push(rows.groupUserId);
				}
				HgUtil.post("/sys/org/groupUser/del", {
					groupUserIds: groupUserIds.join(',')
				}, function() {
					HgUi.ok("删除成功!", function() {
						sysGroupUserListGrid.grid.datagrid("reload");
					});
				});
			}
		});
	}));
	
	//-----------------------------设置组长-----------------------------
	sysGroupUserListGrid.toolbar.find("[tag=setLeader]").click(rowCheckFunc(function(row) {
		var rows = $("#sysGroupUserList_grid").datagrid("getSelections");
		if (rows.length != 1){
			$.messager.alert("提示", "此操作需要且仅能选择一条数据!", "warning");
			return;
		}
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
						sysGroupUserListGrid.grid.datagrid("reload");
					});
				});
			}
		});
	}));
	
})();
