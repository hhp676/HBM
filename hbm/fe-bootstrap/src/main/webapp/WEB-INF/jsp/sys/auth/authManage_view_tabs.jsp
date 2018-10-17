<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限管理</title>
</head>
<body>
			<div id="sysAuth_tabs" class="easyui-tabs" style="height: 100%">
				<div title="授予角色" style="padding: 0px;">
					<%@ include file="./sysAuthRoleTab_view.jsp"%>
				</div>
				<div title="授予用户" style="padding: 0px;">
					<%@ include file="./sysAuthUserTab_view.jsp"%>
				</div>
				<div title="负授予用户" style="padding: 0px;">
					<%@ include file="./sysAuthNegUserTab_view.jsp"%>
				</div>
				<div title="附属权限" style="padding: 0px;"
				    data-options=" href:'${ctx}/sys/sysAuthMenu/mainAttachAuthJoinView/1'">
				</div>
			</div>
</body>
</html>