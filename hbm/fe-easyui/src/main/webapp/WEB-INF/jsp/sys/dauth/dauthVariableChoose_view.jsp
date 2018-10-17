<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选择数据权限变量</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true" id="dauthVariableChoose_layout">
		<div class="easyui-panel" data-options="fit:true">
			<table singleSelect=true fit=true id="dauthVariableChoose_grid"
		        fitColumns=true toolbar="#dauthVariableChoose_toolbar" rownumbers="true" pagination="true"
		        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		        data-options="url:'${ctx}/sys/dauthVariable/chooseVariableList'">
		        <thead>
		            <tr>
		                <th data-options="field:'variableCode',width:150" sortable="true">变量编码</th>
		                <th data-options="field:'variableName',width:150" sortable="true">变量名称</th>
		                <th data-options="field:'variableValue',width:150" sortable="true">变量值</th>
		                <th data-options="field:'engName',width:150" sortable="true">英文名称</th>
		                <th data-options="field:'i18nCode',width:150" sortable="true">国际化编码</th>
		                <th data-options="field:'descr',width:200">描述</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="dauthVariableChoose_toolbar" tag=listen_hotkey>
		        <table>
		            <tr>
		                <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>
		            </tr>
		        </table>
		    </div>
		</div>
	</div>
    <script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthVariableChoose_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>