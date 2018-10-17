<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<title></title>
</head>
<body>
<style>
	input {
		border: 1px solid #ccc;
	}				
	
	.findpassword_step_1 {
		
	}
	
	.findpassword_step_2 {
		display: none
	}
	.changeform td{
	   padding:2px 5px;
	}
	
	img {
		display: inline
	}
</style>
<div data-options="fit:true" id="findPasswordDialog_layout" align="center">
		<form id="findPasswordDialogForm1" name="findPasswordDialogForm1" class="hgform changeform">
			<table class="hgtable findpassword_step_1"
				style="padding: 50px 0 0 0; width: 280px;">
				<tr>
					<td width="80px" align="right">登录名<font>*</font>:
					</td>
					<td width="200px"><input type="text" name="userAccount.loginName"
						id="fd1_loginName" value="${loginSysUser.userAccount.loginName }"
						class="easyui-validatebox" style="width: 200px; padding: 4px;" /></td>
				</tr>
				<tr>
					<td align="right">E-Mail<font>*</font>:
					</td>
					<td><input type="text" name="email"
						id="fd1_email" value="${loginSysUser.email }"
						class="easyui-validatebox" style="width: 200px; padding: 4px;" /></td>
				</tr>
				<tr>
					<td align="right">验证码<font>*</font>:
					</td>
					<td><input type="text" name="captcha"
						id="fd1_captcha" class="easyui-validatebox"
						style="width: 80px; padding: 4px; float: left" />&nbsp;&nbsp; <span
						class="code"><img src="${ctx}/captchaImage"
							id="fd1_captchaImage" width="100" height="24" align="absmiddle" />
					</span></td>
				</tr>
				<tr style="height:40px;">
					<td>&nbsp;</td>
					<td><a class="easyui-linkbutton"
						data-options="iconCls:'icon-ok'" tag="find">申请找回</a></td>
				</tr>
			</table>
		</form>

		<form id="findPasswordDialogForm2" class="hgform changeform ">

			<table class="hgtable findpassword_step_2"
				style="padding: 20px 0 0 0; width: 300px;">
				<tr>
					<td width="100px" align="right">登录名<font>*</font>:
					</td>
					<td width="200px"><input type="text" name="loginName"
						id="fd_loginName" class="easyui-validatebox"
						style="width: 200px; padding: 3px;" readonly=readonly /></td>
				</tr>
				<tr class="tr_email">
					<td align="right">E-Mail<font>*</font>:
					</td>
					<td><input type="text" name="email"
						id="fd_email" class="easyui-validatebox"
						style="width: 200px; padding: 3px;" readonly=readonly /></td>
				</tr>
				<tr>
					<td align="right">邮件验证码<font>*</font>:
					</td>
					<td><input type="text" name=verificationCode
						id="fd_verificationCode" class="easyui-validatebox"
						style="width: 200px; padding: 3px;" /></td>
				</tr>
				<tr>
					<td align="right">新密码<font>*</font>:
					</td>
					<td><input type="password" name="newPwd"
						id="fd_newPwdPersonal" class="easyui-validatebox"
						style="width: 200px; padding: 3px;" /></td>
				</tr>
				<tr>
					<td align="right">确认新密码<font>*</font>:
					</td>
					<td><input type="password" name="confirmNewPwd"
						class="easyui-validatebox" style="width: 200px; padding: 3px;" /></td>
				</tr>
				<tr style="height:40px;">
					<td>&nbsp;</td>
					<td><a class="easyui-linkbutton"
						data-options="iconCls:'icon-ok'" tag="update">修改密码</a></td>
				</tr>
			</table>
		</form>
</div>
<div class="para_fwd_loginName" style="display:none"><%=request.getParameter("loginName")%></div>
<div class="para_fwd_verificationCode" style="display:none"><%=request.getParameter("verificationCode")%></div>
<script>
$(document).ready(function(){
	
	
	$('#fd1_captchaImage').click(function(){
		$('#fd1_captchaImage').hide().attr('src',
				'${ctx}/captchaImage?' + Math.floor(Math.random() * 100))
				.fadeIn();
	});

	
	$('#findPasswordDialogForm1').validate({
		rules:{
			'userAccount.loginName': { required: true},
			email: {required:true,email:true},
			captcha: {required:true}
		}
	});
	
	$("#findPasswordDialogForm1 [tag='find']").click( function(){
		if(!$('#findPasswordDialogForm1').validate().form()) return false;
        $("#findPasswordDialog_layout").parent().block();
		HgUtil.getJson("/anonPages/findpassword/getvcode",$("#findPasswordDialogForm1").serializeArray(),function(data){
			HgUi.ok("验证码已经发送到您的邮箱，请查收邮件!",function(){
				$("#findPasswordDialog_layout").parent().unblock();
				$("#findPasswordDialogForm2 input[name='loginName']").val($("#findPasswordDialogForm1 input[name='userAccount.loginName']").val());
				$("#findPasswordDialogForm2 input[name='email']").val($("#findPasswordDialogForm1 input[name='email']").val());
				$(".findpassword_step_1").hide();
				$(".findpassword_step_2").show();
			});
		},function(xhr){
            $("#findPasswordDialog_layout").parent().unblock();
            HgUi.error(JSON.parse(xhr.responseText).errorMsg);
		});
		
	})
	
	//回车触发申请找回密码按钮
	$('#fd1_captcha').keydown(function(e){
		if (e.which == 13) {
			  $("#findPasswordDialogForm1 [tag='find']").click();
		}
	});
	
	
	$('#findPasswordDialogForm2').validate({
		rules:{
			verificationCode:{required:true},
			newPwd: {required:true,rangelength:[6,20]},
			confirmNewPwd: {required:true,equalTo: "#fd_newPwdPersonal",}
		},
		messages:{
			confirmNewPwd:{
				equalTo:"新密码和确认新密码不相同"
            }
		}
	});
	
	
	$("#findPasswordDialogForm2 [tag='update']").click( function(){
		if(!$('#findPasswordDialogForm2').validate().form()) return false;
        $("#findPasswordDialog_layout").parent().block();
		HgUtil.getJson("/anonPages/findpassword/update",$("#findPasswordDialogForm2").serializeArray(),function(data){
			HgUi.ok("修改密码成功!",function(){
				$("#findPasswordDialog_layout").parent().window("close");
			});
		},function(xhr){
            $("#findPasswordDialog_layout").parent().unblock();
            HgUi.error(JSON.parse(xhr.responseText).errorMsg);
		});
		
	})
	
	
	//aot go step 2
	var loginName = $(".para_fwd_loginName").text();
	var verificationCode = $(".para_fwd_verificationCode").text();
		if (loginName != 'null' && verificationCode != 'null') {
			$("#findPasswordDialogForm2 input[name='loginName']").val(loginName);
			$("#findPasswordDialogForm2 input[name='verificationCode']").val(verificationCode);
			$("#findPasswordDialogForm2 .tr_email").hide();
			$(".findpassword_step_1").hide();
			$(".findpassword_step_2").show();
		}
	})

</script>
</body>
</html>