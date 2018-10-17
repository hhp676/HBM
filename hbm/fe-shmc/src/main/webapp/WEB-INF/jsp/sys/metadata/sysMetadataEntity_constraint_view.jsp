<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>元数据实体</title>
</head>
<body>
   	<table singleSelect=true fit=true id="sysMetadataEntity_constraint_grid"
        fitColumns=true toolbar="#sysMetadataEntity_constraint_toolbar" rownumbers="true" pagination="true" 
        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
        data-options="url:'${ctx}/sys/sysMetadata/entityList'">
        <thead>
            <tr>
                <th data-options="field:'entityCode',width:150" sortable="true">实体编码</th>
                <th data-options="field:'entityName',width:150" sortable="true">实体名称</th>
               	<th data-options="field:'tableName',width:150" sortable="true">表名</th>
              	<th data-options="field:'tableAlias',width:100" sortable="true">别名</th>
            </tr>
        </thead>
    </table>
    <div id="sysMetadataEntity_constraint_toolbar" tag=listen_hotkey>
        <table>
            <tr>
                <td><a class="a_btn_gray" tag="clear"><em>清空查询</em></a></td>
            </tr>
        </table>
    </div>
    <script type="text/javascript" src="${ctx}/static/js/sys/metadata/sysMetadataEntity_constraint_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>