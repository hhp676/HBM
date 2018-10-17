function initSysAuthDetail(mode) {
	if (sysAuth.mode == "add") {
		$("#sysAuth_form input[name=authCategory]").val($("#sysAuth_authCategroy").combobox("getValue"));
	}
	$("#sysAuth_form input[name=authCategoryStr]").val(HgUtil.getDictItemName('AUTH_CATEGORY', $("#sysAuth_form input[name=authCategory]").val()));
	
	
	if (sysAuth.mode == "view"){
		// 查看详情时移除按钮
		$("#sysAuthDetail_layout [tag='ok']").parent().remove();
		$("#sysAuth_form input").attr("readonly", "readonly");
		$("#sysAuth_form select").attr("readonly", "readonly");
		$("#sysAuth_form input[name=isVisible]").attr("disabled", 'disabled');
		$("#sysAuth_form input[name=isInheritable]").attr("disabled", 'disabled');
		$("#sysAuth_form textarea").attr("readonly", "readonly");
	}
	
	$('#sysAuth_form').validate({
	    ignore: '',
	    rules: {
	        authName: {
	            required: true,
	            rangelength: [
	                    1, 30
	            ]
	        },
	        authCode: {
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
	        operationId: {
		        combogridrequired: true
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
	            required: true,
	            rangelength: [
	                    1, 500
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
	    },
	    errorPlacement: function(error, element) {
		    if (element.attr("name") == "operationId"){
			    error.appendTo(element.parent().parent());
		    }
		    else{
			    error.insertAfter(element);
		    }
	    }
	});
	
	$('#operationId').combogrid({
		onChange: function(rowIndex, rowData) {
			$("#sysAuth_form").validate().element($('#operationId'));
		}
	});
	
	$.validator.addMethod('combogridrequired', function(value, element, params) {
		if ('' == value){
			return false;
		}
		else{
			return true;
		}
	}, '必填');
	
	$.validator.addMethod('checkquerystr', function(value, element, params) {
		if (value.indexOf('?') > 0 || value.indexOf('&') > 0){
			return false;
		}
		else{
			return true;
		}
	}, '不允许录入GET风格参数。如特殊字符?和&');
	
	$("#sysAuthDetail_layout [tag='ok']").click(function() {
		if (mode == 'add'){
			_saveSysAuth(true);
		}
		else{
			_saveSysAuth();
		}
		
	});
	
	// 初始化---------------------------------------------------------
	$("#operationId").combogrid({
		onLoadSuccess: function() {
			$("#operationId").combogrid("setValue", operationId);
		}
	});
	
	$("#modelId").combotree({
		onLoadSuccess: function() {
			$("#modelId").combotree("setValue", modelId);
		}
	});
	
	if (mode == "edit"){
	}
	
	if (mode == "add"){
		$("input[name=isVisible]:eq(0)").attr("checked", 'checked');
		$("input[name=isInheritable]:eq(0)").attr("checked", 'checked');
	}
	
	$("#sysAuthDetail_layout [tag='cancel']").click(function() {
		$("#sysAuthDetail_layout").parent().window("close");
	});
	
	// 私有页面方法------------------------------------------------------------------------------------------------------
	function _saveSysAuth(isAdd) {
		// 验证表单--------------------------------------------------
		if (!$('#sysAuth_form').validate().form())
			return false;
		$("#sysAuthDetail_layout").block();
		// 校验数据--------------------------------------------------
		_checkForm(isAdd)
	}
	/**
	 * 校验authCode URI，不能重复，不能包含
	 */
	function _checkForm(isAdd) {
		var submitUrl = "/sys/sysAuthMenu/checkForm";
		HgUtil.getJson(submitUrl, $("#sysAuth_form").serializeArray(), function(data) {
			if (!data.success){
				$("#sysAuthDetail_layout").unblock();
				HgUi.error(data.data, function() {
				});
			}
			else{
				_commitSysAuth(isAdd);
			}
		});
	}
	
	function _commitSysAuth(isAdd) {
		var submitUrl = "/sys/sysAuthMenu/create";
		if (!isAdd)
			submitUrl = "/sys/sysAuthMenu/update";
		HgUtil.getJson(submitUrl, $("#sysAuth_form").serializeArray(), function(data) {
			if (!data.success){
				$("#sysAuthDetail_layout").unblock();
				// Hg.refreshSubmitToken("sysAuth_form");
				HgUi.error(data.data, function() {
				});
			}
			else{
				HgUi.ok("保存数据成功!", function() {
					$("#sysAuthDetail_layout").parent().window("close");
					$('#sysAuth_grid').treegrid("reload");
				});
			}
		});
	}
	// 图标选择------------------------------------------------------------------------------
	$("#sysAuthDetail_layout [tag='choose']").click(function() {
		if (sysAuth.mode != 'view'){
			var _this = $(this);
			HgUi.showIconsWin(function(icon) {
				_this.find("i").addClass(icon.iconCss);
				$("#sysAuthDetail_layout input[name='bsStyle']").val(icon.iconCss);
			});
		}
	});
}

initSysAuthDetail(mode);
