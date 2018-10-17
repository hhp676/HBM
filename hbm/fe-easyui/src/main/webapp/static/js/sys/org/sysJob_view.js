/**
 * 组织架构。 Created by qiujingde on 2016/12/22. / /
 */
var sysJobGrid = new HgUi.Datagrid("sysJobGrid");
sysJobGrid.toolbar = $("#sysJobToolbar");
sysJobGrid.mode = "rowEdit"; //行编辑模式
sysJobGrid.options.isShowContextMenu = true;

sysJobGrid.init();
sysJobGrid.grid.datagrid("enableFilter");

sysJobGrid.bindDefaultToolbarEvent();

// --------------------------保存数据------------------------------------------------------------------
sysJobGrid.toolbar.find("[tag=save]").click(function() {
	if (!sysJobGrid.isEditing){
		return;
	}
	if (sysJobGrid.grid.datagrid("validateRow", sysJobGrid.editingIndex)){
		var data = sysJobGrid.makeSubmitData();
		var editRow = sysJobGrid.grid.datagrid("getRows")[sysJobGrid.editingIndex];
		var submitUrl = "/sys/org/addJob";
		if (editRow.jobId){
			submitUrl = "/sys/org/updJob";
			data.jobId = editRow.jobId;
		}
		if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
			return;
		}
		HgUtil.post(submitUrl, data, function(data) {
			if (!data.success){
				sysJobGrid.showMsgbox("error", data.data, 330);
			}
			else{
				HgUi.ok("保存成功!", function() {
					sysJobGrid.grid.datagrid('reload');
				});
			}
		});
	}
	else{
		sysJobGrid.showMsgbox("alert", "有一条数据未校验通过!", 180);
	}
});

//-------------------------删除-----------------------------------------------------------------------
sysJobGrid.toolbar.find("[tag=del]").click(function() {
	var row = sysJobGrid.grid.datagrid("getSelected");
	var rowIndex = sysJobGrid.grid.datagrid('getRowIndex', row);
	if (sysJobGrid.isEditing == true && rowIndex == 0){
		HgUi.alert("未保存的数据无法删除");
		return;
	}
	if (!row){
		HgUi.alert("请选择一条职位数据");
		return;
	}
	$.messager.confirm("确认删除", "确认将选中的职位删除?", function(r) {
		if (r){
			HgUtil.getJson("/sys/org/delJob", {
				jobId: row.jobId
			}, function(data) {
				if (!data.success){
					HgUi.alert("删除失败," + data.data);
				}
				else{
					HgUi.ok("删除成功!", function() {
						sysJobGrid.grid.datagrid("reload");
					});
				}
			});
		}
	});
});

// 组织提交数据
sysJobGrid.makeSubmitData = function() {
	var jobCode = sysJobGrid.grid.datagrid('getEditor', {
	    index: sysJobGrid.editingIndex,
	    field: "jobCode"
	});
	var jobName = sysJobGrid.grid.datagrid('getEditor', {
	    index: sysJobGrid.editingIndex,
	    field: "jobName"
	});
	var engName = sysJobGrid.grid.datagrid('getEditor', {
	    index: sysJobGrid.editingIndex,
	    field: "engName"
	});
	var i18nCode = sysJobGrid.grid.datagrid('getEditor', {
	    index: sysJobGrid.editingIndex,
	    field: "i18nCode"
	});
	var descr = sysJobGrid.grid.datagrid('getEditor', {
	    index: sysJobGrid.editingIndex,
	    field: "descr"
	});
	
	return {
	    jobCode: $(jobCode.target).textbox("getValue"),
	    jobName: $(jobName.target).textbox("getValue"),
	    engName: $(engName.target).textbox("getValue"),
	    i18nCode: $(i18nCode.target).textbox("getValue"),
	    descr: $(descr.target).textbox("getValue")
	};
};

// 清空查询---------------------------------------------------------------------------------------------------
sysJobGrid.toolbar.find("[tag=clear]").click(function() {
	sysJobGrid.grid.datagrid("getPanel").find("tr.datagrid-filter-row td input").each(function() {
		$(this).val("");
	});
	sysJobGrid.grid.datagrid("removeFilterRule");
	sysJobGrid.grid.datagrid("load", {});
});
