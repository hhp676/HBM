<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据权限详情</title>
</head>
<body>
    <table singleSelect=true fit=true id="dauthDetail_grid"
        fitColumns=true toolbar="#dauthDetail_toolbar" rownumbers="false" pagination="true"
        pageSize="${defaultPageSize}" pageList="${defaultPageList}">
        <thead>
            <tr>
               	<th data-options="field:'groupCode',width:150" sortable="true">编码</th>
                <th data-options="field:'groupName',width:150" sortable="true">名称</th>
                <th data-options="field:'engName',width:150" sortable="true">英文名称</th>
                <th data-options="field:'i18nCode',width:150" sortable="true">国际化编码</th>
                <th data-options="field:'descr',width:200">描述</th>
            </tr>
        </thead>
    </table>
    <div id="dauthDetail_toolbar" tag=listen_hotkey>
        <table>
            <tr>
                <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>
            </tr>
        </table>
    </div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthDetail_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>