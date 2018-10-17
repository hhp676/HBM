
var sysUserProfileGrid = new HgUi.Datagrid("sysUserProfile_grid");
sysUserProfileGrid.toolbar = $("#sysUserProfile_toolbar");


sysUserProfileGrid.mode = "rowEdit"; // 行编辑模式
sysUserProfileGrid.init();
//撤销
sysUserProfileGrid.toolbar.find("[tag=undo]").click(function(){
	var row = sysUserProfileGrid.grid.datagrid("getSelected");
	if(row.profileKey == 'themeColor'){
		var link = $('#easyuiTheme');
		link.attr('href', G_CTX_PATH + '/plugins/jquery-easyui/themes/' + row.profileValue
				+ '/easyui.css');
	}
	sysUserProfileGrid.grid.datagrid('rejectChanges');
	sysUserProfileGrid.isEditing = false;
});

// --------------------------保存数据------------------------------------------------------------------
sysUserProfileGrid.toolbar.find("[tag=save]").click(function() {
	if (sysUserProfileGrid.isEditing == true) {
		if (sysUserProfileGrid.grid.datagrid("validateRow", sysUserProfileGrid.editingIndex)) {
			var data = sysUserProfileGrid.getEditorsData();
			//console.log(data);
			var editRow = sysUserProfileGrid.grid.datagrid("getRows")[sysUserProfileGrid.editingIndex];
			var submitUrl = "/sys/sysPersonal/personalSetting/update";
		    data.userProfileId = editRow.userProfileId;
		    if (!HgUtil.repeatSubmitCheck($(this), submitUrl)){
				return;
			}
			HgUtil.post(submitUrl, data, function(data) {
				if (!data.success) {
					sysUserProfileGrid.showMsgbox("error",data.data,330);
				} else {
					HgUi.ok("保存成功!", function() {
						sysUserProfileGrid.grid.datagrid('reload');
					});
				}
			});

		} else {
			sysUserProfileGrid.showMsgbox("alert","有一条数据未校验通过!",180);
		}
	}

});

// --------------------------恢复默认设置------------------------------------------------------------------
sysUserProfileGrid.toolbar.find("[tag=revert]").click(function(){
	var row = sysUserProfileGrid.grid.datagrid("getSelected");
	if (!row) {
		HgUi.alert("请选择一条个性化数据数据");
		return;
	}
	HgUtil.getJson("/sys/sysPersonal/personalSetting/update",{userProfileId:row.userProfileId,profileValue:row.defaultValue},function(data){
		if (!data.success) {
			HgUi.alert("恢复默认设置失败,"+data.data);
		} else {
			HgUi.ok("恢复默认设置成功!",function(){
				if(row.profileKey == 'themeColor'){
					var link = $('#easyuiTheme');
					link.attr('href', G_CTX_PATH + '/plugins/jquery-easyui/themes/' + row.defaultValue
							+ '/easyui.css');
				}
				sysUserProfileGrid.grid.datagrid("reload");
			});	
		}
	});	
});

//----------------------------------字段添加Editor --------------------------------
function sysUserProfileOnBeforeEdit() {
	//-----------------------------拓展方法---------------------------------
	$.extend($.fn.datagrid.methods, {
	    addEditor : function(jq, param) {
	        if (param instanceof Array) {
	            $.each(param, function(index, item) {
	                var e = $(jq).datagrid('getColumnOption', item.field);
	                e.editor = item.editor;
	            });
	        } else {
	            var e = $(jq).datagrid('getColumnOption', param.field);
	            e.editor = param.editor;
	        }
	    },
	    removeEditor : function(jq, param) {
	        if (param instanceof Array) {
	            $.each(param, function(index, item) {
	                var e = $(jq).datagrid('getColumnOption', item);
	                e.editor = {};
	            });
	        } else {
	            var e = $(jq).datagrid('getColumnOption', param);
	            e.editor = {};
	        }
	    }
	});
	var row = sysUserProfileGrid.grid.datagrid("getSelected");
	var profileKey = row.profileKey;
	$('#sysUserProfile_grid').datagrid('removeEditor','profileValue');
	switch(profileKey){
	    case "defaultPageSize":
	    	$("#sysUserProfile_grid").datagrid('addEditor',[{
				field:'profileValue',editor:{
				    type:'combobox',
				    options:{
				    	prompt: '---请选择---',
				    	panelHeight:'auto',url: G_CTX_PATH + '/sys/sysConfig/defaultPageSize/defaultPageList',
				    		textField:'pageSizeValue',valueField:'pageSizeValue',mode:'remote',
				    		editable:false,required:true,missingMessage:'此输入项为必填项'
				    }
				}
			}]);break;
	    case "themeColor":
	    	$("#sysUserProfile_grid").datagrid('addEditor',[{
				field:'profileValue',editor:{
				    type:'combobox',
				    options:{
				    	prompt: '---请选择---',
				    	panelHeight:'auto',url: G_CTX_PATH + '/sys/common/sysDict/itemList/colorList',
				    		textField:'itemValue',valueField:'itemValue',mode:'remote',
				    		formatter:function(row){
				    			return '<span style="background-color:'+row.itemName+';font-size:15px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;<span>'+row.itemValue+'</span>';
				    		},onSelect: changeThemeColor,editable:false,required:true,missingMessage:'此输入项为必填项'
				    }
				}
			}]);break;
	    default:
	    	$("#sysUserProfile_grid").datagrid('addEditor',[{
				field:'profileValue',editor:{
				    type:'textbox',
				    options:{
				    	required:true,missingMessage:'此输入项为必填项'
				    }
				}
			}]);
	}
	//-----------------------------------修改主题配色---------------------------------------------
	function changeThemeColor(theme) {
		var theme = theme.itemValue;
		var link = $('#easyuiTheme');
		link.attr('href', G_CTX_PATH + '/plugins/jquery-easyui/themes/' + theme
				+ '/easyui.css');
		
		//同步更新主页上的皮肤
		$(".colorList dd").each(function(){
			var value = $(this).find("span").attr("value");
			if (value == theme) {
				$(this).addClass("activeColor").siblings().removeClass("activeColor");
			}
		});
	}
}

