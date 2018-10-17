<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统信息页面</title>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
</head>
<body>
	<table id="jvmInfo_pgrid" class="easyui-propertygrid" showGroup=true striped=true 
	scrollbarSize=0 nowrap=false autoRowHeight=false data-options="columns: mycolumns"></table>
<script type="text/javascript"
		src="${ctx}/static/js/sys/info/sysJvm_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>
