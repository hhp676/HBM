<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>运算符支持</title>
</head>
<body>
		 <table singleSelect=true  id="dauthOperatorSupport_grid"
		        fitColumns=true toolbar="#dauthOperatorSupport_toolbar" rownumbers="true" pagination="true"
		        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		        data-options="url:'${ctx}/sys/dauthOperator/supportList',title:'运算符支持',width:'100%',scrollbarSize:0">
		        <thead>
		            <tr>
		                <th data-options="field:'dauthFilterType.filterTypeName',width:150" sortable="true" 
		                	editor="{type:'combobox',options:{prompt: '---请选择---',url:'${ctx}/sys/dauthFilterType/getFilterTypeList',textField:'filterTypeName',
					   		valueField:'filterTypeId', mode:'remote',editable:false,required:true,missingMessage:'此输入项为必填项'}}">过滤类型</th>
		                <th data-options="field:'dauthOperator.operatorName',width:150" sortable="true" 
		                	editor="{type:'combobox',options:{prompt: '---请选择---',url:'${ctx}/sys/dauthOperator/getOperatorList',textField:'operatorName',
					   		valueField:'operatorId', mode:'remote',editable:false,required:true,missingMessage:'此输入项为必填项'}}">运算符</th>
		                <th data-options="field:'valueType',width:150,sortable:true,formatter:HgUtil.fieldFormatterFunc('DAUTH_FILTER_VALUE_TYPE')"
					   		editor="{type:'combobox',options:{prompt: '---请选择---',url:'${ctx}/sys/common/sysDict/itemList/DAUTH_FILTER_VALUE_TYPE',textField:'itemName',
					   		valueField:'itemValue', mode:'remote',editable:false,required:true,missingMessage:'此输入项为必填项'}}">值类型</th>
		                <th data-options="field:'descr',width:200" editor="{type:'textbox'}">描述</th>
		            </tr>
		        </thead>
		  </table>
		    <div id="dauthOperatorSupport_toolbar" tag=listen_hotkey>
		        <table class="table_form_result">
		            <caption>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATORSUPPORT_ADD %>">
			                <a href="javascript:void(0)" class="a_btn_blue" tag="add"><em>新建</em></a>
		            	</shiro:hasPermission>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATORSUPPORT_UPDATE %>">
			                <div style="display: none"><a href="javascript:void(0)" tag="update"><em>修改</em></a></div>
		            	</shiro:hasPermission>
		            	<h:hasAnyPermissions name='<%= Auths.Sys.DAUTH_OPERATORSUPPORT_ADD + "," + Auths.Sys.DAUTH_OPERATORSUPPORT_UPDATE %>'>
			                <a href="javascript:void(0)" class="a_btn_green" tag="save"><em>保存</em></a>
		            	</h:hasAnyPermissions>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATORSUPPORT_DELETE %>">
			                <a href="javascript:void(0)" class="a_btn_red" tag="del"><em>删除</em></a>
		            	</shiro:hasPermission>
		
		                <a href="javascript:void(0)" class="a_btn_orange" tag="undo"><em>撤销</em></a>
		                <shiro:hasPermission name="<%= Auths.Sys.DAUTH_FILTERTYPE_VIEW %>">
			                <a href="javascript:void(0);" class="a_btn_orange" tag="filterType"><em>过滤类型配置</em></a>
		                </shiro:hasPermission>
		                <shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATOR_VIEW %>">
			                <a href="javascript:void(0);" class="a_btn_blue" tag="operator"><em>运算符型配置</em></a>
		                </shiro:hasPermission>
		                <a class="a_btn_gray" tag="clear"><em>清空查询</em></a>
		            </caption>
		        </table>
		    </div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthOperatorSupport_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>