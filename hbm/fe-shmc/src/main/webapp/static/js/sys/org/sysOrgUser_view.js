/**
 * 组织架构。 Created by qiujingde on 2016/12/22. / /
 */
var sysOrgUserListGrid = new HgUi.Datagrid("sysOrgUserList_grid");
sysOrgUserListGrid.toolbar = $("#sysOrgUserList_toolbar");
sysOrgUserListGrid.options.tipCells
	= ["sysUser.userName","sysUser.engName","sysUser.mobile","sysUser.email",
	   "sysPosition.sysOrganization.orgName","sysPosition.positionName","isMajor"];
sysOrgUserListGrid.options.isShowContextMenu = true;
sysOrgUserListGrid.init();
sysOrgUserListGrid.grid.datagrid("enableFilter",[
 	{
	    field: 'sysUser.gender',
	    type: 'combobox',
	    options: {
	    	panelHeight:'auto',
	    	editable:false,
	    	prompt: '---请选择---',
            data:HgUtil.getDictComboboxData('maleOrFemale'),
	        onChange: function(value) {
		        if (value == ''){
		        	sysOrgUserListGrid.grid.datagrid('removeFilterRule', 'sysUser.gender');
		        }
		        else{
		        	sysOrgUserListGrid.grid.datagrid('addFilterRule', {
			            field: 'sysUser.gender',
			            op: 'equal',
			            value: value
			        });
		        }
		        sysOrgUserListGrid.grid.datagrid('doFilter');
	        }
	    }
	},
	{
	    field: 'isMajor',
	    type: 'combobox',
	    options: {
	    	panelHeight:'auto',
	    	editable:false,
	    	prompt: '---请选择---',
            data:HgUtil.getDictComboboxData('isMajorPztn'),
	        onChange: function(value) {
		        if (value == ''){
		        	sysOrgUserListGrid.grid.datagrid('removeFilterRule', 'isMajor');
		        }
		        else{
		        	sysOrgUserListGrid.grid.datagrid('addFilterRule', {
			            field: 'isMajor',
			            op: 'equal',
			            value: value
			        });
		        }
		        sysOrgUserListGrid.grid.datagrid('doFilter');
	        }
	    }
	}
]);

sysOrgUserListGrid.bindDefaultToolbarEvent();
sysOrgUserListGrid.options.onLoadSuccess = function() {
};
sysOrgUserListGrid.reload = function(){
	sysOrgUserListGrid.grid.datagrid("reload");
}

function choosePosition(callback) {
	sysOrgTree.sysOrgPopWin({width:600,height:400}).window("setTitle", "岗位列表").window("refresh",
	        G_CTX_PATH + "/sys/org/posView/" + sysOrgUserListOrgId);
	window.sysPositionListCallback = callback;
}

(function() {
	//-----------------------------添加-----------------------------
	sysOrgUserListGrid.toolbar.find("[tag=addUser]").click(function() {
		
		// 组织下的人员列表，添加时首先选择岗位
		if (sysOrgUserListOrgId){
			choosePosition(function(row) {
				addUser(row["id"]);
			})
		}
		else{
			addUser(sysOrgUserListPosId);
		}
		
		function addUser(posId) {
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
				// 添加用户岗位
				HgUtil.post("/sys/org/posUser/addPosToUsers", {
				    positionId: posId,
				    userIds: userIds.join(',')
				}, function() {
					HgUi.ok("添加成功!", function() {
						sysOrgUserListGrid.grid.datagrid("reload");
					});
				});
			}, 'multiple');
		}
	});
	
	function rowCheckFunc(callback) {
		return function() {
			var row = sysOrgUserListGrid.grid.datagrid("getSelected");
			if (!row){
				$.messager.alert("提示", "请选择一条数据", "warning");
				return;
			}
			callback(row);
		};
	}
	
	//-----------------------------删除-----------------------------
	sysOrgUserListGrid.toolbar.find("[tag=del]").click(rowCheckFunc(function(row) {
		var rows = $("#sysOrgUserList_grid").datagrid("getSelections");
		if (rows.length ==0){
			$.messager.alert("提示", "需要至少选择一条数据!", "warning");
			return;
		}
		$.messager.confirm("确认删除", "确认将选中的数据删除?", function(r) {
			if (r){
				var userPositionIds = [];
				if (rows instanceof Array){
					for ( var index=0; index<rows.length; index++){
						userPositionIds.push(rows[index].userPositionId);
					}
				}else{
					userPositionIds.push(rows.userPositionId);
				}
				HgUtil.post("/sys/org/posUser/del", {
					userPositionIds: userPositionIds.join(',')
				}, function() {
					HgUi.ok("删除成功!", function() {
						sysOrgUserListGrid.grid.datagrid("reload");
					});
				});
			}
		});
	}));
	
	//----------------------------设置主岗--------------------------------
	sysOrgUserListGrid.toolbar.find("[tag=setMajor]").click(rowCheckFunc(function(row) {
		var rows = $("#sysOrgUserList_grid").datagrid("getSelections");
		if (rows.length != 1){
			$.messager.alert("提示", "此操作需要且仅能选择一条数据!", "warning");
			return;
		}
		if (row["isMajor"] == 1){
			$.messager.alert("提示", "当前岗位已经是主岗！", "warning");
			return;
		}
		$.messager.confirm("确认调整", "确认将选中的岗位设为主岗?", function(r) {
			if (r){
				HgUtil.post("/sys/org/posUser/setMajor", {
				    userPositionId: row["userPositionId"],
				    userId: row["userId"],
				    positionId: row["positionId"]
				}, function() {
					HgUi.ok("修改成功!", function() {
						sysOrgUserListGrid.grid.datagrid("reload");
					});
				});
			}
		});
	}));
	
})();

//清空查询---------------------------------------------------------------------------------------------------
sysOrgUserListGrid.toolbar.find("[tag=clear]").click(function() {
	sysOrgUserListGrid.grid.datagrid("removeFilterRule");
	sysOrgUserListGrid.grid.datagrid("load");
});
