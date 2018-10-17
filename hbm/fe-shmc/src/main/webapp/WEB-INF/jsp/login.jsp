<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="description" content="${h:getSysProperty('sysName')} ">
<meta name="keywords" content="${h:getSysProperty('sysName')}">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${h:getSysProperty('sysName')}</title>
<link id="easyuiTheme" rel="stylesheet" type="text/css"
    href="${ctx}/plugins/jquery-easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/plugins/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/plugins/jquery-easyui/themes/color.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/sys/common/sysIcon/iconDynamicCss" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/icon.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/global.css" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/main.css" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/custom/css/public.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/custom/css/login.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/static/custom/css/head.css" />
<script type="text/javascript" src="${ctx}/static/js/jquery.1.12.4.js"></script>
<!-- My97DatePicker -->
<script type="text/javascript" src="${ctx}/plugins/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" 
    src="${ctx}/plugins/jquery-blockUI/jquery.blockUI.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/jquery.easyui.1.4.5.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/extension/datagrid-filter.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/extension/datagrid-detailview.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/extension/datagrid-groupview.js"></script>
<script type="text/javascript" src="${ctx}/plugins/jquery-easyui/jquery.easyui.custom.js"></script>
<script type="text/javascript" src="${ctx}/static/js/security/rsaSecurity.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.config.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.util.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.ui.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.hotkey.monitor.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.moduleClass.js?jsTimer=${jsTimer}"></script>
<!-- validate -->
<script type="text/javascript"
    src="${ctx}/plugins/jquery-validator/jquery.validate.js"></script>
    <script type="text/javascript"
    src="${ctx}/plugins/jquery-validator/additional-methods.js"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-validator/localization/messages_zh.js"></script>
    
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
<style>
    table, div, span, p, form, ol, ul, li, dl, dt, dd, textarea {
        font-size: 12px;
    }
</style>
<div class="para_loginName" style="display:none"><%=request.getParameter("loginName")%></div>
<div class="para_verificationCode" style="display:none"><%=request.getParameter("verificationCode")%></div>
    <form id="loginForm" tag="listen_hotkey">
    <div class="wrap">
        <div class="loginLogo">
            <img src="${ctx}/static/custom/img/logo.png" />
        </div>
        <div class="loginCenter">
            <h2>${h:getSysProperty('sysName')}</h2>
            <ul class="loginList">
                <li><span class="leftIcon"> <i><img
                            src="${ctx}/static/custom/img/user1.png" /><img
                            src="${ctx}/static/custom/img/user2.png" /></i>
                </span> <input type="text" class="userIpt" id="userName"
                    placeholder="请输入用户名" name="username" value="super"/></li>

                <li><span class="leftIcon"> <i><img
                            src="${ctx}/static/custom/img/pw1.png" /><img
                            src="${ctx}/static/custom/img/pw2.png" /></i>
                </span> <input type="password" class="userIpt" id="passWord"
                    placeholder="请输入登录密码" name="password_show" value="super"/>
                    <input type="hidden" name="password" />
                    </li>
                <c:set var="verifCodeName" value="<%=Constants.SYS_CONFIG_LOGIN_VERIF_CODE %>"/>
                <c:if test="${h:getSysProperty(verifCodeName) eq '1'}">
                <li ><input type="text" class="userIpt qrCode" name="captcha" id="captcha" maxlength=4
                    placeholder="请输入验证码" />
                    <div class="qrBox">
                        <img src="${ctx}/captchaImage"  height=41 id="captchaImage"/>
                    </div></li>
               </c:if>

                <li><%--<label class="forCheck"> <input type="checkbox" name="rememberMe"
                        class="checkPsd" /> <span class="moniCheck"></span> <span
                        class="labelTxt">记住我</span>
                    </label>--%> <a href="javascript:void(0);" class="Gopsd" tag="openFindPasswordDialog" onclick="openFindPasswordDialog()">忘记密码?</a></li>
            </ul>
             <div class="errorShow">
             </div>
            <input type="button" class="formSubmit" value="登录" id="commitBtn" tag="submit"/>
            <div style="margin-top: 15px;text-align: center;">
                <label style="font-size: 18px;">${h:getSysProperty('sysVersion')}</label>
            </div>
        </div>

    </div>
    </form>
</body>
<script type="text/javascript"> 

    var modulus = "${modulus}";
    var exponent = "${exponent}";
    //登录提交
    $("#commitBtn").click(function(){
        
        var key = RSAUtils.getKeyPair(exponent, '', modulus);

        var password = $("input[name='password_show']").val();
        //console.log(password);
        password = RSAUtils.encryptedString(key, password);
        //console.log("encrypt:" + password);
        $("input[name='password']").val(password);
        $("body").block();
        HgUtil.post("/login",$("#loginForm").find(':input:not(#passWord)').serializeArray(),function(data){
            if (data.success == 'true') {
                window.location.href = G_CTX_PATH + "/";
            } else {
                $("body").unblock();
                $("#loginForm .errorShow").show();
                $("#loginForm .errorShow").text(data.message);
                //reload publicKey
                HgUtil.get("/getPublicKey", {}, function (data){
                    modulus = data.modulus;
                    exponent = data.exponent;
                })
            }
        },function(xhr){
        	$("body").unblock();
        	$("#loginForm .errorShow").show();
        	var errMsg = '未知错误！';
        	try{
        		errMsg = JSON.parse(xhr.responseText).data
        	}catch(err){};
            $("#loginForm .errorShow").text(errMsg);
        });
    });

    
    $("#loginForm input").focus(function(){
        $("#loginForm .errorShow").hide();
    });
    
    
    $("#captchaImage").click(function(){
         $(this).hide().attr('src', '${ctx}/captchaImage?' + (new Date()).getTime()).fadeIn();  
    })
    
    //忘记密码
    openFindPasswordDialog = function(loginName,verificationCode){
        var parameter = (loginName)?"?loginName="+loginName+"&verificationCode="+verificationCode:"";
        var url = "/anonPages/findpassword/show"+parameter;
        var iconCls = "icon-help";
        var findPasswordWin = new HgUi.window({
             id: "findPasswordWin",
             width: 500,
             height: 300,
             title: "忘记密码",
             iconCls: iconCls,
             url: url
        });
    }
    
    
    
    //------------------------------------------------ui js-------------------------------------------------
    //登录框输入获得焦点状态切换
    $('.userIpt').focus(
            function() {
                $(this).css('border', '1px solid #0ac4fa');
                $(this).siblings('.leftIcon').css({
                    'border-color' : '#0ac4fa',
                    'background' : '#eaf7fd'
                });
                $(this).siblings('.leftIcon').children('i').children('img').eq(
                        0).hide().end().eq(1).show();
            });

    $('.userIpt').blur(
            function() {
                $(this).css('border', '1px solid #e9e9e9');
                $(this).siblings('.leftIcon').css({
                    'border-color' : '#e9e9e9',
                    'background' : '#e9e9e9'
                });
                $(this).siblings('.leftIcon').children('i').children('img').eq(
                        0).show().end().eq(1).hide();
            });

    //登录表单验证
    $('.formSubmit').click(function() {
        var $userName = $('#userName').val();
        var $passWord = $('#passWord').val();
        var $Qrcode = $('#captcha').val();
        if ($Qrcode == '') {
            $('#captcha').trigger('focus')
        }
        if ($passWord == '') {
            $('#passWord').trigger('focus');
        }
        if ($userName == '') {
            $('#userName').trigger('focus');
        }

    });
</script>
</html>