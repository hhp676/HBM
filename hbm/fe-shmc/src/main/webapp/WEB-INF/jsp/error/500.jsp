<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
 	//Throwable ex = null;
	//if (exception != null)
		//ex = exception;
	//if (request.getAttribute("javax.servlet.error.exception") != null)
		//ex = (Exception) request.getAttribute("javax.servlet.error.exception");

	//记录日志
	//Log log = LogFactory.getLog("500.jsp");
	//log.error(ex.getMessage(), ex);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Viewport metatags -->
<meta name="HandheldFriendly" content="true" />
<meta name="MobileOptimized" content="320" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/error/dandelion.css"  media="screen" />
<title>500 - 系统错误</title>
</head>
<body>
	<!-- Main Wrapper. Set this to 'fixed' for fixed layout and 'fluid' for fluid layout' -->
	<div id="da-wrapper" class="fluid">
        <!-- Content -->
        <div id="da-content">
            <!-- Container -->
            <div class="da-container clearfix">
            	<div id="da-error-wrapper">
                   	<div id="da-error-pin"></div>
                    <div id="da-error-code">
                    	系统错误 <span>500</span> 
                    </div>
                	<h1 class="da-error-heading">我勒个去！系统见到你就崩溃啦！</h1>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
