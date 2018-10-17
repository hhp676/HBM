<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统信息页面</title>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
</head>
<body>
	<table id="serverInfo_grid"  class="easyui-datagrid" showHeader=false fitColumns=true striped=true scrollbarSize=0 nowrap=false  
	    data-options="view:detailview,detailFormatter:_serverInfoGridDefaultFmt">
		 <thead>
      		 	<tr>
          			<th data-options="field:'group',width:400"></th>
      			</tr>
  			</thead>
	</table>
		 
<script type="text/javascript"
		src="${ctx}/static/js/sys/info/sysServer_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>
