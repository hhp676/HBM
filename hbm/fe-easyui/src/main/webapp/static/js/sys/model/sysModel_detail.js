function initSysModelDetail(mode) {
	if (sysModel.mode == "view"){
		// 查看详情时移除按钮
		$("#sysModelDetail_layout [tag='ok']").parent().remove();
		$("#sysModel_form input").attr("readonly", "readonly");
		$("#sysModel_form select").attr("readonly", "readonly");
		$("#sysModel_form input[name=isVisible]").attr("disabled", 'disabled');
		$("#sysModel_form input[name=isTopMenu]").attr("disabled", 'disabled');
		$("#sysModel_form input[name=isSubMenu]").attr("disabled", 'disabled');
		$("#sysModel_form textarea").attr("readonly", "readonly");
	}
	
	// Hg.refRepeatSubmit("sysAuthOper_form");//防止表单重复提交
	
	$('#sysModel_form').validate({
		rules: {
		    modelName: {
		        required: true,
		        rangelength: [
		                1, 30
		        ]
		    },
		    modelCode: {
		    	required: true,
			    rangelength: [
			            1, 50
			    ]
		    },
		    engName: {
			    rangelength: [
			            0, 60
			    ],
			    onlyEng: true
		    },
		    i18nCode: {
			    rangelength: [
			            0, 100
			    ]
		    },
		    sortNo: {
		        required: true,
		        rangelength: [
		                1, 10
		        ],
		        number: true,
		        digits: true,
		        min: 1
		    },
		    uri: {
		        rangelength: [
		                0, 50
		        ],
		        checkquerystr: true
		    },
		    style: {
			    rangelength: [
			            0, 100
			    ]
		    },
		    tip: {
			    rangelength: [
			            0, 100
			    ]
		    },
		    descr: {
			    rangelength: [
			            0, 1000
			    ]
		    }
		}
	});
	
	$.validator.addMethod('checkquerystr', function(value, element, params) {
		if (value.indexOf('?') > 0 || value.indexOf('&') > 0){
			return false;
		}
		else{
			return true;
		}
	}, '不允许录入GET风格参数。如特殊字符?和&');
	
	$("#sysModelDetail_layout [tag='ok']").click(function() {
		if (mode == 'add'){
			_saveSysModel(true);
		}
		else{
			_saveSysModel();
		}
		
	});
	
	// 初始化---------------------------------------------------------
	$("#sysModel_form #fid").combotree({
        onLoadSuccess: function() {
            $("#sysModel_form #fid").combotree("setValue", fid);
        }
    });
	if (mode == "add"){
		$("input[name=isVisible]:eq(0)").attr("checked", 'checked');
		$("input[name=isTopMenu]:eq(0)").attr("checked", 'checked');
		$("input[name=isSubMenu]:eq(0)").attr("checked", 'checked');
	}
	
	$("#sysModelDetail_layout [tag='cancel']").click(function() {
		$("#sysModelDetail_layout").parent().window("close");
	});
	
	$("#sysModelDetail_layout [tag='choose']").click(function() {
		if (sysModel.mode != 'view'){
			var _this = $(this);
			HgUi.showIconsWin(function(icon) {
				_this.linkbutton({
					iconCls: icon.iconCss
				});
				$("#sysModelDetail_layout input[name='style']").val(icon.iconCss);
			});
		}
	});
	
	$("#sysModelDetail_layout [tag='change']").click(function() {
		$("#sysModelDetail_layout [tag='choose']").linkbutton({iconCls: "icon_auto_colorful__upload1"});
		$("#sysModelDetail_layout input[name='style']").val("icon_auto_colorful__upload1");
	});
	
	// 私有页面方法------------------------------------------------------------------------------------------------------
	function _saveSysModel(isAdd) {
		// 验证表单--------------------------------------------------
		if (!$('#sysModel_form').validate().form())
			return false;
		$("#sysModelDetail_layout").block();
		// 验证 modelcode,uri--------------------------------------------------
		_checkForm(isAdd);
	}
	
	/**
	 * 校验authCode URI，不能重复，不能包含
	 */
	function _checkForm(isAdd) {
		var submitUrl = "/sys/sysAuthMenu/checkForm";
		HgUtil.post(submitUrl, {
		    authShowType: 1,
		    authId: $('#sysModel_form input[name=modelId]').val(),
		    authCode: $('#sysModel_form input[name=modelCode]').val(),
		    uri: $('#sysModel_form input[name=uri]').val()
		}, function(data) {
			if (!data.success){
				$("#sysModelDetail_layout").unblock();
				HgUi.error(data.data, function() {
				});
			}
			else{
				_commitSysModel(isAdd);
			}
		});
	}
	
	function _commitSysModel(isAdd) {
		var submitUrl = "/sys/model/create";
		if (!isAdd)
			submitUrl = "/sys/model/update";
		HgUtil.post(submitUrl, $("#sysModel_form").serializeArray(), function(data) {
			if (!data.success){
				$("#sysModelDetail_layout").unblock();
				// Hg.refreshSubmitToken("sysAuth_form");
				HgUi.error(data.data, function() {
				});
			}
			else{
				HgUi.ok("保存数据成功!", function() {
					$("#sysModelDetail_layout").parent().window("close");
					$('#sysAuth_grid').treegrid("reload");
				});
			}
		});
	}
	
}

initSysModelDetail(mode);
