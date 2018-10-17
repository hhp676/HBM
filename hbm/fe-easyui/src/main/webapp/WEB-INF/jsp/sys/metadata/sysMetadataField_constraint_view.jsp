<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>字段管理</title>
</head>
<body>
    <table singleSelect=true fit=true id="sysMetadataField_constraint_grid" class="easyui-datagrid"
        fitColumns=true toolbar="" rownumbers="true" pagination="true"
        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
        data-options="">
        <thead>
            <tr>
                <th data-options="field:'fieldCode',width:150" sortable="true">字段编码</th>
                <th data-options="field:'fieldName',width:150" sortable="true">字段名称</th>
                <th data-options="field:'sysDauthFilterType.filterTypeName',width:150" sortable="true">过滤类型</th>
		   		<th data-options="field:'columnName',width:150" sortable="true">表字段</th>
            </tr>
        </thead>
    </table>
	<script type="text/javascript" src="${ctx}/static/js/sys/metadata/sysMetadataField_constraint_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>