<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>运算符支持</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div class="easyui-panel" data-options="fit:true" title="运算符支持">
		    <table singleSelect=true fit=true id="dauthOperatorSupport_grid"
		        fitColumns=true toolbar="#dauthOperatorSupport_toolbar" rownumbers="true" pagination="true"
		        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		        data-options="url:'${ctx}/sys/dauthOperator/supportList'">
		        <thead>
		            <tr>
		                <th data-options="field:'dauthFilterType.filterTypeName',width:150" sortable="true" 
		                	editor="{type:'combobox',options:{url:'${ctx}/sys/dauthFilterType/getFilterTypeList',
                                   textField:'filterTypeName',prompt: '---请选择---',
					   		valueField:'filterTypeId', mode:'remote',editable:false,required:true,missingMessage:'此输入项为必填项'}}">过滤类型</th>
		                <th data-options="field:'dauthOperator.operatorName',width:150" sortable="true" 
		                	editor="{type:'combobox',options:{url:'${ctx}/sys/dauthOperator/getOperatorList',
                                   textField:'operatorName',prompt: '---请选择---',
					   		valueField:'operatorId', mode:'remote',editable:false,required:true,missingMessage:'此输入项为必填项'}}">运算符</th>
		                <th data-options="field:'valueType',width:150,sortable:true,formatter:HgUtil.fieldFormatterFunc('DAUTH_FILTER_VALUE_TYPE')"
					   		editor="{type:'combobox',options:{url:'${ctx}/sys/common/sysDict/itemList/DAUTH_FILTER_VALUE_TYPE',
                                   textField:'itemName',prompt: '---请选择---',
					   		valueField:'itemValue', mode:'remote',editable:false,required:true,missingMessage:'此输入项为必填项'}}">值类型</th>
		                <th data-options="field:'descr',width:200" editor="{type:'textbox'}">描述</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="dauthOperatorSupport_toolbar" tag=listen_hotkey>
		        <table>
		            <tr>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATORSUPPORT_ADD %>">
			                <td><a href="javascript:void(0)" class="easyui-linkbutton"
			                    iconCls="icon_add1" plain="true" tag="add">新建</a></td>
		            	</shiro:hasPermission>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATORSUPPORT_UPDATE %>">
			                <td style="display: none"><a href="javascript:void(0)"
			                    iconCls="icon_add1" plain="true" tag="update">修改</a></td>
		            	</shiro:hasPermission>
		            	<h:hasAnyPermissions name='<%= Auths.Sys.DAUTH_OPERATORSUPPORT_ADD + "," + Auths.Sys.DAUTH_OPERATORSUPPORT_UPDATE %>'>
			                <td><a href="javascript:void(0)" class="easyui-linkbutton"
			                    iconCls="icon_save1" plain="true" tag="save">保存</a></td>
		            	</h:hasAnyPermissions>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATORSUPPORT_DELETE %>">
			                <td><a href="javascript:void(0)" class="easyui-linkbutton"
			                    iconCls="icon_delete" plain="true" tag="del">删除</a></td>
		            	</shiro:hasPermission>
		
		                <td><a href="javascript:void(0)" class="easyui-linkbutton"
		                    data-options="iconCls:'icon_undo',plain:true" tag="undo">撤销</a></td>
		                <shiro:hasPermission name="<%= Auths.Sys.DAUTH_FILTERTYPE_VIEW %>">
			                <td><a href="javascript:void(0)" class="easyui-linkbutton"
			                    data-options="iconCls:'icon_dauth_filtertype',plain:true" tag="filterType">过滤类型配置</a></td>
		                </shiro:hasPermission>
		                <shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATOR_VIEW %>">
			               	<td><a href="javascript:void(0)" class="easyui-linkbutton"
			                    data-options="iconCls:'icon_dauth_operator',plain:true" tag="operator">运算符配置</a></td>
		                </shiro:hasPermission>
		                <td><div class="datagrid-btn-separator"></div></td>
		                <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>
		            </tr>
		        </table>
		    </div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthOperatorSupport_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>