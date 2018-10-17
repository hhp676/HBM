<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个性化配置</title>
</head>
<body>
	<table singleSelect=true id="sysUserProfile_grid" fitColumns=true 
	    style="width: 100%;"
	    toolbar="#sysUserProfile_toolbar"
		data-options="title:'个性化设置',
		    url:'${ctx}/sys/sysPersonal/personalSetting/list',
		    scrollbarSize:0,
		    onBeforeEdit:sysUserProfileOnBeforeEdit">
		<thead>
			<tr>
				<th data-options="field:'profileType',width:150">个性化名称</th>
				<th data-options="field:'profileValue',width:80">设置值</th>
				<th data-options="field:'defaultValue',width:80">默认值</th>
				<th data-options="field:'descr',width:220">描述</th>
			</tr>
		</thead>
	</table>
	<div id="sysUserProfile_toolbar">
		<table class="table_form_result">
            <caption>
                <a href="javascript:void(0)" class="a_btn_green" tag="save"><em>保存</em></a>
                <a href="javascript:void(0)" class="a_btn_orange" tag="revert"><em>恢复默认设置</em></a>
                <a href="javascript:void(0)" class="a_btn_disabled" tag="undo"><em>撤销</em></a>
			</caption>
		</table>
	</div>
	<script type="text/javascript"
		src="${ctx}/static/js/sys/profile/sysUserProfile_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>