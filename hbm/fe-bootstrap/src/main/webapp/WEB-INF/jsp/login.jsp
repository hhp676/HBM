<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<title>${h:getSysProperty('sysName')}</title>
<meta name="description" content="${h:getSysProperty('sysName')}">
<meta name="keywords" content="${h:getSysProperty('sysName')}">
<script>
var G_CTX_PATH = "${ctx}";
</script>
<link rel="icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<link id="easyuiTheme" rel="stylesheet" type="text/css"
    href="${ctx}/plugins/jquery-easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/plugins/jquery-easyui/themes/color.css" />
<link href="${ctx}/static/assets/css/bootstrap.min.css" rel="stylesheet" />

<link rel="stylesheet" type="text/css" href="${ctx}/static/css/icon.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/login.css">


<script src="${ctx}/static/assets/js/jquery.min.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/plugins/jquery-blockUI/jquery.blockUI.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/plugins/jquery-easyui/jquery.easyui.1.4.5.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/locale/easyui-lang-zh_CN.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/extension/datagrid-filter.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/extension/datagrid-detailview.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/extension/datagrid-groupview.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/plugins/jquery-easyui/jquery.easyui.custom.js?jsTimer=${jsTimer}"></script>
<script src="${ctx}/static/assets/js/bootstrap.min.js?jsTimer=${jsTimer}"></script>
<script src="${ctx}/static/assets/js/bootbox/bootbox.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/security/rsaSecurity.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.config.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.util.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.ui.js?jsTimer=${jsTimer}"></script>
<!-- validate -->
<script type="text/javascript"
    src="${ctx}/plugins/jquery-validator/jquery.validate.js"></script>
    <script type="text/javascript"
    src="${ctx}/plugins/jquery-validator/additional-methods.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-validator/localization/messages_zh.js"></script>

<style>
body:before{content:initial;}
.modal {
    z-index: 10000;
}
.panel{
    border:none;
    border-radius:0px;
    margin-bottom:0px;
}
.panel-title{
    font-size: 12px;
    color: #777;
}
.panel-body {
    padding: 0px;
}
</style>
<script type="text/javascript">
$(function() {
    var loginName =  $(".para_loginName").text();
    var verificationCode = $(".para_verificationCode").text();
    if (loginName!='null' && verificationCode!='null'){
        openFindPasswordDialog(loginName,verificationCode);
    }
});
</script>
</head>
<body>
<div class="para_loginName" style="display:none"><%=request.getParameter("loginName")%></div>
<div class="para_verificationCode" style="display:none"><%=request.getParameter("verificationCode")%></div>
    <form id="loginForm" tag="listen_hotkey">
	<div class="wrap">
		<div class="loginCenter">
			<h2>${h:getSysProperty('sysName')}</h2>
			<ul class="loginList">
				<li><span class="leftIcon"> <i><img
							src="${ctx}/static/images/user1.png" /><img
							src="${ctx}/static/images/user2.png" /></i>
				</span> <input type="text" class="userIpt" id="userName" name="username"
					value="super" placeholder="请输入用户名" style="border-radius: 0px;"/></li>
				<li><span class="leftIcon"> <i><img
							src="${ctx}/static/images/pw1.png" /><img
							src="${ctx}/static/images/pw2.png" /></i>
				</span> <input type="password" class="userIpt" id="passWord"
					name="password_show" placeholder="请输入登录密码" value="super" style="border-radius: 0px;"/>
					<input type="hidden" name="password" />
					</li>
				<c:set var="verifCodeName" value="<%=Constants.SYS_CONFIG_LOGIN_VERIF_CODE %>"/>
				<c:if test="${h:getSysProperty(verifCodeName) eq '1'}">
					<li><input type="text" class="userIpt qrCode" id="Qrcode"
						name="captcha" placeholder="请输入验证码" style="border-radius: 0px;"/>
						<div class="qrBox">
							<img src="${ctx}/captchaImage" height=40 id="captchaImage" />
						</div></li>
				</c:if>
				<li><%--<label class="forCheck"> <input type="checkbox"
						class="checkPsd" /> <span class="moniCheck"></span> 
				</label><span class="labelTxt">自动登录</span>--%> <a href="#" class="Gopsd" tag="openFindPasswordDialog" onclick="openFindPasswordDialog()">忘记密码?</a></li>
			</ul>

			<div class="errorShow"></div>


			<input type="button" class="formSubmit" value="登录" id="commitBtn" />
		</div>


	</div>
	</form>
	
	
	<script type="text/javascript">
		$ ("#captchaImage").click (function ()
        {
	        $ (this).hide ().attr ('src', '${ctx}/captchaImage?' + (new Date ()).getTime ()).fadeIn ();
        })
        //登录框输入获得焦点状态切换
        $ ('.userIpt').focus (function ()
        {
	        $ (this).css ('border', '1px solid #0ac4fa');
	        $ (this).siblings ('.leftIcon').css (
	        {
	            'border-color' : '#0ac4fa',
	            'background' : '#eaf7fd'
	        });
	        $ (this).siblings ('.leftIcon').children ('i').children ('img').eq (0).hide ().end ().eq (1).show ();
        });
        
        $ ('.userIpt').blur (function ()
        {
	        $ (this).css ('border', '1px solid #e9e9e9');
	        $ (this).siblings ('.leftIcon').css (
	        {
	            'border-color' : '#e9e9e9',
	            'background' : '#e9e9e9'
	        });
	        $ (this).siblings ('.leftIcon').children ('i').children ('img').eq (0).show ().end ().eq (1).hide ();
        });
        
        //登录表单验证
        $ ('.formSubmit').click (function ()
        {
	        var $userName = $ ('#userName').val ();
	        var $passWord = $ ('#passWord').val ();
	        var $Qrcode = $ ('#Qrcode').val ();
	        if ($userName == '')
	        {
		        $ ('#userName').trigger ('focus');
		        $ ('.errorShow').show ();
		        $ ('.errorShow').text ('请输入正确用户名!');
	        }
	        else if ($passWord == '')
	        {
		        $ ('#passWord').trigger ('focus');
		        $ ('.errorShow').show ();
		        $ ('.errorShow').text ('请输入正确密码!');
	        }
	        else if ($Qrcode == '')
	        {
		        $ ('#Qrcode').trigger ('focus');
		        $ ('.errorShow').show ();
		        $ ('.errorShow').text ('请输入正确验证码!');
	        }
	        else
	        {
		        $ ('.errorShow').hide ();
		        $ ('.errorShow').text ('');
	        }
        });
        
        $ (function ()
        {
        	if ( HgUtil.browser.ie && HgUtil.browser.version < 10 ) {
        		$ ('.loginCenter').attr("style","opacity:1;");
    	    }else{
    	    	//css animation支持ie10+
    	    	$ ('.loginCenter').addClass ('slideIn');
    	    }
        })

        var modulus = "${modulus}";
        var exponent = "${exponent}";
        
        //登录提交
        $ ("#commitBtn").click (function ()
        {
	        var key = RSAUtils.getKeyPair (exponent, '', modulus);
	        
	        var password = $ ("input[name='password_show']").val ();
	        //console.log (password);
	        password = RSAUtils.encryptedString (key, password);
	        //console.log("encrypt:" + password);
	        $ ("input[name='password']").val (password);
	        $ ("body").block ();
	        HgUtil.post ("/login", $("#loginForm").find(':input:not(#passWord)').serializeArray(), function (data)
	        {
		        if (data.success == 'true')
		        {
			        window.location.href = G_CTX_PATH + "/";
		        }
		        else
		        {
			        $ ("body").unblock ();
			        $ ("#loginForm .errorShow").show ();
			        $ ("#loginForm .errorShow").text (data.message);
			        //reload publicKey
			        HgUtil.get("/getPublicKey", {}, function (data){
			        	modulus = data.modulus;
			        	exponent = data.exponent;
			        })
		        }
	        });
        });
        
        
      //忘记密码
        openFindPasswordDialog = function(loginName,verificationCode){
            var parameter = (loginName)?"?loginName="+loginName+"&verificationCode="+verificationCode:"";
            var url = "/anonPages/findpassword/show"+parameter;
            var iconCls = "icon-help";
            var findPasswordWin = new HgUi.window({
                 id: "findPasswordWin",
                 width: 500,
                 height: 320,
                 title: "忘记密码",
                 iconCls: iconCls,
                 url: url
            });
        }
	</script>
</body>
</html>
