<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hginfo.hbm.fe.bs.utils.*" %>
<%
Map commVariables = VariableUtil.getCommVariables(request);
request.setAttribute("comm",commVariables) ;
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<title><h:block name="title">${comm['title']}</h:block> - ${h:getSysProperty('sysName')}</title>
<script>
	var G_CTX_PATH = "${ctx}";
</script>
<link rel="icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<meta name="description" content="Dashboard" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--Basic Styles-->
<link id="easyuiTheme" rel="stylesheet" type="text/css"
    href="${ctx}/plugins/jquery-easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/plugins/jquery-easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css"
    href="${ctx}/plugins/jquery-easyui/themes/color.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/icon.css" />
    
<link href="${ctx}/static/assets/css/bootstrap.min.css" rel="stylesheet" />
<link id="bootstrap-rtl-link" href="" rel="stylesheet" />
<link href="${ctx}/static/assets/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="${ctx}/static/assets/css/weather-icons.min.css"
	rel="stylesheet" />
<!--Beyond styles-->
<link id="beyond-link" href="${ctx}/static/assets/css/beyond.min.css"
	rel="stylesheet" type="text/css" />
<link href="${ctx}/static/assets/css/demo.min.css" rel="stylesheet" />
<link href="${ctx}/static/assets/css/typicons.min.css" rel="stylesheet" />
<link href="${ctx}/static/assets/css/animate.min.css" rel="stylesheet" />
<link id="skin-link" href="" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/css/reset.css">
<!--Page Related styles-->
<link href="${ctx}/static/assets/css/datatables.bootstrap.css" rel="stylesheet" />
<link href="${ctx}/static/css/custom.css" rel="stylesheet" />  
<style type="text/css">
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
.datagrid-toolbar{
    padding:5px;
}
.datagrid-filter-row {
	height:22px;
}
.modal {
	z-index: 10000;
}
.form-title {
	font-size: 12px;
} 
a:hover {
	text-decoration: none;
}
.easyui-datagrid-layout{display:none}

.tabs-icon {
	margin-top: -6px;
}
.tooltip{border-width:0px;word-wrap: break-word; word-break: normal;background-color:transparent; z-index:15000}
textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"] {
	background-color: #fff;
}
.pagination-num{
	width: 50px;
}
</style>
<!--Basic Scripts-->
<script src="${ctx}/static/assets/js/jquery.min.js?jsTimer=${jsTimer}"></script>
<script  src="${ctx}/plugins/My97DatePicker/WdatePicker.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-blockUI/jquery.blockUI.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript"
    src="${ctx}/plugins/jquery-easyui/jquery.easyui.1.4.5.js?jsTimer=${jsTimer}"></script>
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
<script type="text/javascript" src="${ctx}/static/js/jquery.cookie.js?jsTimer=${jsTimer}"></script>
<script src="${ctx}/static/assets/js/slimscroll/jquery.slimscroll.min.js?jsTimer=${jsTimer}"></script>
<!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
<script src="${ctx}/static/assets/js/skins.min.js?jsTimer=${jsTimer}"></script>

<!--Page Related Scripts-->
<!--Sparkline Charts Needed Scripts-->
<script src="${ctx}/static/assets/js/charts/sparkline/jquery.sparkline.js?jsTimer=${jsTimer}"></script>
<script src="${ctx}/static/assets/js/charts/sparkline/sparkline-init.js?jsTimer=${jsTimer}"></script>

<!-- WebUploader -->
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/webuploader/webuploader.css" />
<script type="text/javascript" src="${ctx}/plugins/webuploader/webuploader.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/sys/file/hg.webUploadGrid.js?jsTimer=${jsTimer}"></script>
<!-- ajaxFileUpload -->
<script type="text/javascript" src="${ctx}/static/js/ajaxfileupload.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/sys/file/hg.ajaxFileUpload.js?jsTimer=${jsTimer}"></script>

<!-- 富文本编辑器ueditor -->
<script type="text/javascript" src="${ctx}/plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/plugins/ueditor/ueditor.all.js"> </script>
<script type="text/javascript" src="${ctx}/plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- jquery局部打印PrintArea-2.4.0 -->
<script type="text/javascript" src="${ctx}/static/js/jquery.PrintArea.js"></script>
<!-- echarts报表 -->
<script type="text/javascript" src="${ctx}/plugins/echarts/echarts.js"></script>
<script type="text/javascript" src="${ctx}/plugins/zeroclipboard/ZeroClipboard.js"></script>
<!-- websocket -->
<script type="text/javascript" src="${ctx}/static/js/ws/sockjs.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/ws/stomp.js"></script>

<script src="${ctx}/static/assets/js/datatable/jquery.datatables.min.js?jsTimer=${jsTimer}"></script>
<script src="${ctx}/static/assets/js/datatable/zeroclipboard.js?jsTimer=${jsTimer}"></script>
<script src="${ctx}/static/assets/js/datatable/datatables.tabletools.min.js?jsTimer=${jsTimer}"></script>
<script src="${ctx}/static/assets/js/datatable/datatables.bootstrap.min.js?jsTimer=${jsTimer}"></script>
<script src="${ctx}/static/assets/js/bootbox/bootbox.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.config.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.util.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.ui.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.hotkey.monitor.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.moduleClass.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.common.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/hg/hg.authLocation.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/static/js/sys/base.js?jsTimer=${jsTimer}"></script>

<!-- validate -->
<script type="text/javascript" src="${ctx}/plugins/jquery-validator/jquery.validate.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/plugins/jquery-validator/additional-methods.js?jsTimer=${jsTimer}"></script>
<script type="text/javascript" src="${ctx}/plugins/jquery-validator/localization/messages_zh.js?jsTimer=${jsTimer}"></script>

<h:block name="header_js"></h:block>
</head>
<!-- /Head -->
<!-- Body -->
<body>
	<!-- Loading Container -->
	<div class="loading-container">
		<div class="loader"></div>
	</div>
	<!--  /Loading Container -->
	<!-- Navbar -->
	<div class="navbar">
		<div class="navbar-inner" style="background-color:${themeColor}">
			<div class="navbar-container">
				<!---logo start--->
				<div class="head-logo">
					<img src="${ctx}/static/images/logo.png" />
				</div>
				<div class="logo-txt">${h:getSysProperty('sysName')}</div>
				<!---logo end--->
				<!-- Sidebar Collapse -->
				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="collapse-icon fa fa-bars"></i>
				</div>
				<!-- /Sidebar Collapse -->
				<nav class="guide" id="topMenu">
          			<ul class="navUl">
          				<c:forEach var="menu" items="${comm['topMenus']}">
          					<li  modelId="${menu.modelId}" class="<c:if test="${fn:contains(comm['navIdList'], menu.modelId)}">active</c:if>">
          						<a href="#"><i class="${menu.bsStyle}"></i>&nbsp;${menu.modelName}</a>
          					</li>
          				</c:forEach>
          			</ul>
      			</nav>
				
				<!-- Account Area and Settings --->
				<div class="navbar-header pull-right">
					<div class="navbar-account">
						<ul class="account-area">
							<li>
								<div class="changeSkin" style="cursor:default">
									<img src="${ctx}/static/assets/img/avatars/adam-jansen.jpg">
								</div>
								<div class="user_name">${comm['loginName']}</div>
							</li>

							<!-- <li><select class="jobChoice">
									<option value="职位">职位</option>
									<option value="java">java</option>
									<option value="IOS">IOS</option>
									<option value="前端开发">前端开发</option>
							</select></li> -->
							<!--<li> <a class="wave in" id="chat-link" title="Chat" href="#"> <i class="icon glyphicon glyphicon-comment"></i> </a> </li>-->
							<li><a style="min-width: 110px;"
								class="login-area dropdown-toggle" data-toggle="dropdown">
									<div class="userIcon" title="更换皮肤" data-toggle="tooltip" data-container="body" data-placement="bottom">
										<img src="${ctx}/static/images/skin.png" />
									</div>
							</a> <!--Login Area Dropdown-->
								<ul
									class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">
									<li class="username"><a>Eric</a></li>
									<!--Theme Selector Area-->
									<li class="theme-area">
										<ul class="colorpicker" id="skin-changer">
											<%-- <li><span class="colorpick-btn"
												style="background-color: #5DB2FF;" ></span></li>
											<li><span class="colorpick-btn"
												style="background-color: #2dc3e8;"
												rel="${ctx}/static/assets/css/skins/azure.min.css"></span></li>
											<li><span class="colorpick-btn"
												style="background-color: #03B3B2;"
												rel="${ctx}/static/assets/css/skins/teal.min.css"></span></li>
											<li><span class="colorpick-btn"
												style="background-color: #53a93f;"
												rel="${ctx}/static/assets/css/skins/green.min.css"></span></li>
											<li><span class="colorpick-btn"
												style="background-color: #FF8F32;"
												rel="${ctx}/static/assets/css/skins/orange.min.css"></span></li>
											<li><span class="colorpick-btn"
												style="background-color: #cc324b;"
												rel="${ctx}/static/assets/css/skins/pink.min.css"></span></li> --%>
											<c:forEach items="${bsColorList}" var="bsColor" varStatus="bsColorStatus">
											   <li><span class="colorpick-btn" bsColor="${bsColor.itemValue}" 
                                                style="background-color: ${bsColor.itemName};" ></span></li>
											</c:forEach>
										</ul>
									</li>
									<!--/Theme Selector Area-->
									<li class="dropdown-footer"><a href="${ctx}/logout"> 退出 </a></li>
								</ul> <!--/Login Area Dropdown--></li>

							<li>
								<div class="exit" title="退出" data-toggle="tooltip" data-container="body" data-placement="bottom">
									<a href="${ctx}/logout"> <img
										src="${ctx}/static/images/exit.png" /></a>
								</div>
							</li>
							<!-- /Account Area -->
							<!--Note: notice that setting div must start right after account area list.
                            no space must be between these elements-->

						</ul>
					</div>
				</div>
				<!-- /Account Area and Settings -->
			</div>
		</div>
	</div>
	<!-- /Navbar -->
	<!-- Main Container -->
	<div class="main-container container-fluid">
		<!-- Page Container -->		
		<div class="page-container">
			<!-- Page Sidebar -->
			<div class="page-sidebar" id="sidebar">
				<!-- Page Sidebar Header-->
				<!-- <div class="sidebar-header-wrapper">
					<input type="text" class="searchinput" /> <i
						class="searchicon fa fa-search"></i>
					<div class="searchhelper">请输入搜索内容</div>
				</div> -->
				<!-- /Page Sidebar Header -->
				<!-- Sidebar Menu -->
				<ul class="nav sidebar-menu">
				    <c:set var="comm_subMenus" value="${comm['subMenus']}" scope="request" />
					<c:import url="/WEB-INF/jsp/common/leftMenu.jsp" />
				</ul>
				<!-- /Sidebar Menu -->
			</div>
			<div class="page-content" id="main-content">
			 <div  class="easyui-layout" fit=true>
				<div id="tab" class="easyui-tabs"  data-options="tools:'#tab-tools',tabHeight:38,fit:true,border:false,narrow:true">
	                <div title="首页" href="${ctx}/sys/common/indexHome">
	                
                    </div>
	            </div>
	            <div id="tab-tools" style="width:150px;border-top:none;border-left:none;">
	               <div class="page-header">
	               <div class="header-buttons" style="">
			        <a class="tab-close" href="#" data-toggle="tooltip" data-container="body" data-placement="bottom" title="关闭当前"> <i class="fa fa-close"></i> </a>
			        <a class="sidebar-toggler" href="#" data-toggle="tooltip" data-container="body" data-placement="bottom" title="关闭导航栏"> <i class="fa fa-arrows-h"></i> </a>
			        <a class="refresh" id="refresh" href="#" data-toggle="tooltip" data-container="body" data-placement="bottom" title="刷新"> <i class="glyphicon glyphicon-refresh"></i></a>
			        <a class="fullscreen" id="fullscreen-toggler" href="#" data-toggle="tooltip" data-container="body" data-placement="bottom" title="全屏"> <i class="glyphicon glyphicon-fullscreen"></i></a>
			       </div>
			       </div>
			    </div>
			   </div>
			</div>
			<!-- /Page Content -->

		</div>
		<!-- /Page Container -->
		<!-- Main Container -->

	</div>
	<div id="rowContextMenu" class="easyui-menu" style="width:200px;"></div>
	
	<!--Beyond Scripts-->
    <script src="${ctx}/static/assets/js/beyond.js"></script>
    
    <script type="text/javascript" src="${ctx}/static/js/hg/hg.online.timeout.checker.js"></script>
    <script>
    
    //关闭、刷新等图标显示悬浮窗提示信息
    $(function () { $("[data-toggle='tooltip']").tooltip(); });
    
    var tab = new HgUi.Tab();
    
	var onlineTimeoutNumber = parseInt("${h:getProfile('userOnlineTimeout')}");
	if (!isNaN(onlineTimeoutNumber) && onlineTimeoutNumber > 0){
	    onlineTimeoutChecker.init(onlineTimeoutNumber);
	    onlineTimeoutChecker.callback = function(){
	    	$.messager.alert('警告','长时间未操作，您的会话已结束！','warning',function ()
   	        {
   	            window.location.reload();
   	        });
	    }
	    onlineTimeoutChecker.intervalID = window.setInterval(onlineTimeoutChecker.intervalFunction, 10*1000);
	}
	
	
	</script>
    <h:block name="footer_js"></h:block>

</body>
<!--  /Body -->
</html>
