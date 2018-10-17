<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>过滤器项选择</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true" id="dauthChoose_layout">
		<div class="easyui-panel" data-options="fit:true">
		    <table singleSelect=true fit=true id="dauthChoose_grid"
		        fitColumns=true toolbar="#dauthChoose_toolbar" rownumbers="true" pagination="true"
		        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		        data-options="url:'${ctx}/sys/dauth/chooseDauthList'">
		        <thead>
		            <tr>
		                <th data-options="field:'dauthCode',width:150" sortable="true">编码</th>
		                <th data-options="field:'dauthName',width:150" sortable="true">名称</th>
		                <th data-options="field:'sysMetadataEntity.entityName',width:150" sortable="true">实体</th>
		                <th data-options="field:'sysMetadataEntity.tableName',width:150" sortable="true">表名</th>
		                <th data-options="field:'tableAlias',width:150" sortable="true">别名</th>
		                <th data-options="field:'engName',width:150" sortable="true">英文名称</th>
		                <th data-options="field:'i18nCode',width:150" sortable="true">国际化编码</th>
		                <th data-options="field:'descr',width:200">描述</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="dauthChoose_toolbar" tag=listen_hotkey>
		        <table class="table_form_result">
                    <caption>
		                <a class="a_btn_gray" tag="clear"><em>清空查询</em></a>
		            </caption>
		        </table>
		    </div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthChoose_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>