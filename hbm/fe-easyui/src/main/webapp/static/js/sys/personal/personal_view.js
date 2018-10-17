$("#personalBasicTb_gender").text(HgUtil.getDictItemName("maleOrFemale",sysPersonal.loginUserGender));
$("#staffinfoTb_staffStatus").text(HgUtil.getDictItemName("STAFF_STATUS",sysPersonal.loginUserStaffStatus));
var personalBasicGrid = new HgUi.Datagrid("personalBasicTb");
var staffinfoGrid = new HgUi.Datagrid("staffinfoTb");
personalBasicGrid.options.tipCells = ["td4","td3","td2","td1"];
staffinfoGrid.options.tipCells = ["td4","td3","td2","td1"];
personalBasicGrid.options.onLoadSuccess = function() {
	$("#personalBasicTb").datagrid("mergeCells", {
		index : 0,
		field : 'td1',
		rowspan : 3,
		colspan : 2
	});
	$("#personalBasicTb").datagrid("mergeCells", {
		index : 5,
		field : 'td2',
		colspan : 3
	});

};
personalBasicGrid.init();
staffinfoGrid.init();

$("#basicPersonal_tools [tag=btn]").click(function(){
	$("#engNameInput").validatebox({
		validType:"length[0,50]"
	}),
	$("#addressInput").validatebox({
		validType:"length[0,200]"
	})
	var addressInput = $("#addressInput").validatebox("isValid");
	var engNameInput = $("#engNameInput").validatebox("isValid");
	if(!addressInput||!engNameInput){
		return personalBasicGrid.showMsgbox("alert","有一条数据未校验通过!", 180);
	}
	var cls = $(this).attr("class");
	if (cls.indexOf('icon-edit') >= 0) {
		$(this).attr("class","icon_save1");
		$("#personalBasicTb").datagrid("getPanel").find("[tag=infoTd]").hide();
		$("#personalBasicTb").datagrid("getPanel").find("[tag=editTd]").show();
		$("#engNameInput").val($("#engNameDisabled").html());
		$("#mobileInput").val($("#mobileDisabled").html());
		$("#addressInput").val($("#addressDisabled").html());
	} else {
		var gridPanel = $("#personalBasicTb").datagrid("getPanel");
		var engName = gridPanel.find("input[name=engName]").val();
		var mobile = gridPanel.find("input[name=mobile]").val();
		var vali = HgUtil.validate("mobile",mobile);
		if (!vali.result) {
			personalBasicGrid.showMsgbox("alert",vali.msg,200);
			return false;
		}
		var address = gridPanel.find("input[name=address]").val();	
		HgUtil.post("/sys/sysPersonal/updBasicInfo",{engName:engName,mobile:mobile,address:address},function(data){
			if (!data.success) {
				dictGroupGrid.showMsgbox("error",data.data,330);
			} else {
				HgUi.ok("保存成功!", function() {
					var tab = new HgUi.Tab();
					tab.refreshCurrent();
				});
			}
		});
	}
});

$("#basicPersonal_tools [tag=undo]").click(function(){
	var btnclass=$("#basicPersonal_tools_btn").attr("class","icon-edit");
	$("#personalBasicTb").datagrid("getPanel").find("[tag=editTd]").hide();
	$("#personalBasicTb").datagrid("getPanel").find("[tag=infoTd]").show();
});





$.extend($.fn.validatebox.defaults.rules, {     
    length: {     
        validator: function(value, param){     
            return value.length >= param[0] && param[1] >= value.length;     
        },     
        message: '输入长度必须介于{0}和{1}之间'    
    }     
});  