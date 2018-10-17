<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>过滤器项选择</title>
</head>
<body>
	<div class="easyui-layout easyui-datagrid-layout" data-options="fit:true" id="dauthFilterItemChoose_layout">
		<div class="easyui-panel" data-options="fit:true">
		    <table singleSelect=true fit=true id="dauthFilterItemChoose_grid"
		        fitColumns=true toolbar="#dauthFilterItemChoose_toolbar" rownumbers="true" pagination="true"
		        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		        data-options="url:'${ctx}/sys/dauthFilter/chooseFilterItemList/${entityId }'">
		        <thead>
		            <tr>
		                <th data-options="field:'sysDauthFilterType.filterTypeName',width:150" sortable="true">过滤类型</th>
		                <th data-options="field:'sysMetadataField.fieldName',width:150" sortable="true" >字段</th>
					   	<th data-options="field:'sysDauthOperator.operatorName',width:150" sortable="true" >运算符</th>
		                <th data-options="field:'valueType',width:150,sortable:true,formatter:HgUtil.fieldFormatterFunc('DAUTH_FILTER_VALUE_TYPE')">值类型</th>
					   	<th data-options="field:'filterValue',width:150,sortable:true,formatter:dauthFilterItemChooseGrid.filterValueFormat">过滤值</th>
		                <th data-options="field:'descr',width:150">描述</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="dauthFilterItemChoose_toolbar" tag=listen_hotkey>
		        <table>
		            <tr>
		                <td><a href="javascript:void(0);" class="btn btn-yellow" tag="clear"><i class="fa fa-eraser"></i>清空查询</a></td>
		            </tr>
		        </table>
		    </div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthFilterItemChoose_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>