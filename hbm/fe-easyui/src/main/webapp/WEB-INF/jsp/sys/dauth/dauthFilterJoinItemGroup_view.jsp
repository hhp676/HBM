<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>过滤器组配置</title>
</head>
<body>
    <table singleSelect=true fit=true id="dauthFilterJoinItemGroup_grid"
        fitColumns=true toolbar="" rownumbers="false" pagination="true"
        pageSize="${defaultPageSize}" pageList="${defaultPageList}">
        <thead>
            <tr>
               	<th data-options="field:'sysDauthFilterGroup.groupCode',width:150" sortable="true">编码</th>
                <th data-options="field:'sysDauthFilterGroup.groupName',width:150" sortable="true">名称</th>
                <th data-options="field:'sysDauthFilterGroup.engName',width:150" sortable="true">英文名称</th>
                <th data-options="field:'sysDauthFilterGroup.i18nCode',width:150" sortable="true">国际化编码</th>
                <th data-options="field:'sysDauthFilterGroup.descr',width:200" >描述</th>
            </tr>
        </thead>
    </table>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthFilterJoinItemGroup_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>