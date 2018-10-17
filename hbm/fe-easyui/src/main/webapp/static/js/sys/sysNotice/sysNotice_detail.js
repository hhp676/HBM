//保存
sysNoticeDetail.save = function(saveType){
	// 验证表单--------------------------------------------------
	var sysDetailCheck = $('#sysNoticeDetail_form').validate().form();
	//校验通过
	if(sysDetailCheck){
		$("#sysNoticeDetail_form #content").val(UE.getEditor('sysNoticeContent').getContent());
	    var formData=$("#sysNoticeDetail_form").serialize()+"&saveType="+saveType;
	    var url="/sys/sysNotice/saveNotice";
	    //不可操作
	    $("#sysUserDetail_layout").block();
	    HgUtil.post(url, formData, function(data){
	    	//恢复可以操作
	    	$("#sysUserDetail_layout").unblock();
	        if(data.success){
	            HgUi.ok("保存成功", function(){
	            	sysNoticeDetail.closeWin();
	            	$('#sysNotice_datagrid').datagrid("reload");
	            });
	        }else{
	            HgUi.error("保存失败!"+data.msg, function(){
	            });
	        }
	    });
	}
}

//关闭窗口
sysNoticeDetail.closeWin = function(){
	$("#sysNoticeDetail_layout").parent().window("close");
}

$(function(){
	if(sysNoticeDetail.mode == 'add'){
		$("#sysNoticeDetail_form").validate({
			rules: {
				title : {required: true, rangelength: [1, 200]},
				timerLv : {required: true},
				importantLv : {required: true},
				sortNo : {required: true, range:[1,999]},
				autoPub : {required: true},
				newsTypeId : {required: true},
				startTime : {required: true},
				endTime : {required: true}
			}
		});
		sysNoticeDetail.timerLvOnChange = function(newValue,oldValue) {
			$("#sysNoticeDetail_form").validate().element($("#sysNoticeDetail_form [name='timerLv']"));
		}
		sysNoticeDetail.importantLvOnChange = function(newValue,oldValue) {
			$("#sysNoticeDetail_form").validate().element($("#sysNoticeDetail_form [name='importantLv']"));
		}
		sysNoticeDetail.autoPubOnChange = function(newValue,oldValue) {
			$("#sysNoticeDetail_form").validate().element($("#sysNoticeDetail_form [name='autoPub']"));
		}
		sysNoticeDetail.newsTypeIdOnChange = function(newValue,oldValue) {
			$("#sysNoticeDetail_form").validate().element($("#sysNoticeDetail_form [name='newsTypeId']"));
		}
		sysNoticeDetail.isFinalOnChange = function(newValue,oldValue) {
			$("#sysNoticeDetail_form").validate().element($("#sysNoticeDetail_form [name='isFinal']"));
		}
	}
	
	//必须使用延时加载方式,不然easyui的样式冲突,
	setTimeout(function(){
		//先销毁,再创建,解决第二次打开页面时,不能成功创建的问题
		UE.delEditor('sysNoticeContent');
		//实例化编辑器
		//创建全量的工具栏编辑器,工具栏配置项可以参考ueditor.config.js,已手动备注各属性含义,yyzh整理
		var mailBodyUeditor = UE.getEditor('sysNoticeContent',{
			//禁掉插入图片功能,reason:图片的回显地址邮件发送出去后会失败
			toolbars:[[
			           'source', '|','undo','redo','link', 'unlink',
			           '|','bold','italic','underline','fontborder','strikethrough','superscript', 'subscript',
			           'removeformat','formatmatch','autotypeset', 'blockquote','pasteplain', 
			           '|', 'forecolor','backcolor','insertorderedlist','insertunorderedlist','selectall','cleardoc',
			           '|','rowspacingtop','rowspacingbottom', 'lineheight', 'pagebreak',
			           '|','directionalityltr','directionalityrtl', 'indent', 
			           '|', 'touppercase','tolowercase',
			           '|','customstyle','paragraph', 'fontfamily','fontsize', 
			           '|','justifyleft','justifycenter', 'justifyright', 'justifyjustify',
			           '|','horizontal','date','time','spechars', 
			           '|','inserttable', 'deletetable','insertparagraphbeforetable','insertrow',
			           'deleterow','insertcol', 'deletecol','mergecells','mergeright', 'mergedown',
			           'splittocells','splittorows','splittocols',
			           '|','print', 'preview', 'drafts' 
			           ]],
			           maximumWords:1500//设定最大可输入字符数
		});
		
		UE.getEditor('sysNoticeContent').addListener( 'ready', function( editor ) {
			UE.getEditor('sysNoticeContent').setHeight(235);
		});
	}, 100);
});

