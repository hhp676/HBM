<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/WEB-INF/jsp/admin/common/meta.jsp"%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${h:getSysProperty('sysName')}-接口管理后台</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${ctx}/static/adminlte/bootstrap/css/bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${ctx}/static/adminlte/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="${ctx}/static/adminlte/plugins/iCheck/square/blue.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${ctx}/static/js/html5shiv.min.js"></script>
    <script src="${ctx}/static/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${ctx}/static/js/security/rsaSecurity.js"></script>
    <style>
        .login-page{
            background: url(${ctx}/static/images/login_bg.jpg) no-repeat;
            background-size: 100% 100%;
        }
        .form-group{height: 46px}
        .help-block{margin-top: 2px;}
        .errorShow{border:1px solid #cc3333;padding:5px;display: none;font-size: 13px}
    </style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">${h:getSysProperty('sysName')}-接口管理后台</p>

        <form action="${ctx}/login" method="post" id="loginForm" autocomplete="off">
            <input type="hidden" name="loginMode" value="general">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="请输入用户名" name="username" value="super">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback" >
                <input type="text" onfocus="this.type='password'" class="form-control" placeholder="请输入密码" name="password_show"
                value="super">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                <input type="hidden" name="password">
            </div>
            <c:set var="verifCodeName" value="<%=Constants.SYS_CONFIG_LOGIN_VERIF_CODE %>"/>
            <c:if test="${h:getSysProperty(verifCodeName) eq '1'}">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" name="captcha" id="captcha" maxlength=4
                            placeholder="请输入验证码" style="width:150px;float: left" />
                    <div style="display: inline;float: right;">
                        <img src="${ctx}/public/captchaImage"  height=35 id="captchaImage"/>
                    </div>
                <div style="clear: both;height: 0px;"></div>
            </div>
            </c:if>
            <div class="row">
                <div class="col-xs-8">
                    <%--<div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> 记住我
                        </label>
                    </div>--%>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
                <!-- /.col -->
            </div>
            <div class="errorShow"></div>
        </form>



    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="${ctx}/static/adminlte/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${ctx}/static/adminlte/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/static/plugins/jquery-validator/jquery.validate.js"></script>
<script src="${ctx}/static/plugins/jquery-validator/additional-methods.js"></script>
<script src="${ctx}/static/adminlte/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/static/plugins/jquery-blockUI/jquery.blockUI.js"></script>
<script src="${ctx}/static/js/hg/hg.config.js"></script>
<script src="${ctx}/static/js/hg/hg.util.js"></script>
<script src="${ctx}/static/js/hg/hg.ui.js"></script>

<script>
    var modulus = "${modulus}";
    var exponent = "${exponent}";

    $("#captchaImage").click(function(){
        $(this).hide().attr('src', '${ctx}/public/captchaImage?' + (new Date()).getTime()).fadeIn();
    })

    $(function () {
        $("input[name='password_show']").attr('type','password')
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });

        $("#loginForm").validate({
            errorElement : 'span',
            errorClass : 'help-block',
            focusInvalid : true,
            rules : {
                username : {
                    required : true
                },
                password_show : {
                    required : true
                },captcha : {
                    required : true
                }
            },
            highlight : function(element) {
                $(element).closest('.form-group').addClass('has-error');
            },
            success : function(label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },
            errorPlacement : function(error, element) {
                element.parent('div').append(error);
            },
            submitHandler : function(form) {
                var key = RSAUtils.getKeyPair(exponent, '', modulus);
                var password_show = $("input[name='password_show']").val();
                password = RSAUtils.encryptedString(key, password_show);
                console && console.log("encrypt:" +password_show+ password);
                $("input[name='password']").val(password);
                $("body").block();
                $.ajax({
                    "url": G_CTX_PATH  + "/login?etc=" + new Date().getTime(),
                    "type": "POST",
                    "data": $("#loginForm").find(':input:not(#password)').serializeArray(),
                    "success": function(result){
                        $("body").unblock();
                        if (result.success) {
                            window.location.href = G_CTX_ADMIN_PATH + "/";
                        } else {
                            $("#loginForm .errorShow").show();
                            $("#loginForm .errorShow").text(result.data);
                            //reload publicKey
                            HgUtil.get("/public/security/getPublicKey", {}, function (result){
                                modulus = result.modulus;
                                exponent = result.exponent;
                            })
                        }
                    },
                    "error": function(xhr){
                        $("body").unblock();
                        $("#loginForm .errorShow").show();
                        var errMsg = '未知错误！';
                        try{
                            errMsg = JSON.parse(xhr.responseText).data
                        }catch(err){};
                        $("#loginForm .errorShow").text(errMsg);
                    }
                })
            }
        });

        $("#loginForm input").focus(function(){
            $("#loginForm .errorShow").hide();
        });
    });
</script>
</body>
</html>
