<!DOCTYPE html>
<html>
<head>
  	<title>HBM任务调度中心</title>
  	<#import "/common/common.macro.ftl" as netCommon>
	<@netCommon.commonStyle />
    <link rel="stylesheet" href="${request.contextPath}/static/adminlte/plugins/iCheck/square/blue.css">
    <style>
    	.login-body{
		    background: url(${request.contextPath}/static/images/login_bg.jpg) no-repeat;
			background-size: 100% 100%;
    	}
    </style>
</head>
<body class="hold-transition login-page login-body">
	<div class="wrapper login-box">
		<!-- <div class="login-logo">
			<a><b>HBM</b>JOB</a>
		</div> -->
		<form id="loginForm" method="post" style="margin-top:40px;">
			<div class="login-box-body" style="height:350px;">
				<div class="login-logo" style="height:50px;">
					<h2 style="line-height: 40px;font-size: 26px;color: #2196fd;text-align: center;ont-weight: normal;">
						鸿冠任务调度中心
					</h2>
				</div>
				<div class="form-group has-feedback" style="height:45px;">
	            	<input type="text" name="userName" class="form-control" placeholder="请输入登录账号" value="admin" >
	            	<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
	          	<div class="form-group has-feedback" style="height:45px;">
	            	<input type="password" name="password" class="form-control" placeholder="请输入登录密码" value="123456" >
	            	<span class="glyphicon glyphicon-lock form-control-feedback"></span>
	          	</div>
				<div class="row">
					<div class="col-xs-8">
		              	<div class="checkbox icheck">
		                	<label>
		                  		<input type="checkbox" name="ifRemember" > Remember Me
		                	</label>
						</div>
		            </div><!-- /.col -->
		            <div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
					</div>
				</div>
			</div>
		</form>
	</div>
<@netCommon.commonScript />
<script src="${request.contextPath}/static/plugins/jquery/jquery.validate.min.js"></script>
<script src="${request.contextPath}/static/adminlte/plugins/iCheck/icheck.min.js"></script>
<script src="${request.contextPath}/static/js/login.1.js"></script>
<script>
	<!-- 解决与app.js的冲突 -->
	$(function() {
		$("body, html").css("height","100%");
		$("body, html").css("overflow","hidden");
	});
</script>
</body>
</html>
