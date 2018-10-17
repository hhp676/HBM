var dauthChooseGrid = {};

dauthChooseGrid.clickUserBtn = function() {
	HgUtil.chooseSysUser(function(rows) {
		if (rows && rows.length > 0){
			$("#dauthCheck_userId").textbox('setValue', rows[0].userId);
			$("#dauthCheck_userId").textbox('setText', rows[0].userName);
		}
	})
}

// -------------------------校验-----------------------------------------------------------------------
$("#dauthCheck_checkBtn").click(function() {
	var userId = $("#dauthCheck_userId").textbox('getValue');
	if (!userId){
		$.messager.alert("提示", "请选择校验人员后再进行校验！", "warning");
		return;
	}
	HgUtil.getJson("/sys/dauth/checkDauth", {dauthId: $("#dauthCheck_dauthId").val(),userId: userId}, function(data) {
		if (!data.success){
			$.messager.alert("提示", "校验失败!", "warning");
			$("#dauthCheck_result").textbox('setValue', data.errorMsg);
		} else {
			HgUi.ok("校验成功!", function() {
				$("#dauthCheck_result").textbox('setValue', data.data);
			});
		}
	});
});
