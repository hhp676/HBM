/**
 * 
 */
(function() {
	
	var sysUserTabPosGrid = new HgUi.Datagrid("sysUserTabPosView_grid");
	//sysUserTabPosGrid.grid = $("#sysUserTabPosView_grid");
	sysUserTabPosGrid.toolbar = $("#sysUserTabPosView_toolbar");
	sysUserTabPosGrid.options.tipCells = ["sysPosition.positionName","sysPosition.descr","sysPosition.sysOrganization.orgName","sysPosition.sysJob.jobName","sysPosition.positionCode","isMajor"];

	sysUserTabPosGrid.init();
	function rowPosCheckFunc(callback) {
		return function() {
			var row = sysUserTabPosGrid.grid.datagrid("getSelected");
			if (!row){
				$.messager.alert("提示", "请选择一条岗位数据", "warning");
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
	sysUserTabPosGrid.toolbar.find("a[tag='edit']").click(rowUserCheckFunc(function(row) {
		var rows = sysUserTabPosGrid.grid.datagrid('getRows');
		HgUtil.chooseSysPosition('multiple', rows, function(positionIds) {
			var positionIdstr = positionIds.join(',');
			HgUtil.post("/sys/org/updateUserPosition", {
			    userId: row['userId'],
			    "positionIds": positionIdstr
			}, function() {
				sysUserTabPosGrid.grid.datagrid("reload");
			});
		});
	}));
	
	/**
	 * 设置主岗
	 */
	sysUserTabPosGrid.toolbar.find("[tag=setMajor]").click(rowPosCheckFunc(function(row) {
		if (row["isMajor"] == 1){
			$.messager.alert("提示", "当前岗位为主岗！", "warning");
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
						sysUserGrid.grid.datagrid("reload");
						sysUserTabPosGrid.grid.datagrid("reload");
					});
				});
			}
		});
	}));
	
})();
