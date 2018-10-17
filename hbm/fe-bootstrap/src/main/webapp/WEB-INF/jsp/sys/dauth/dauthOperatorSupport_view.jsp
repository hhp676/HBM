<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>运算符支持</title>
</head>
<body>
	<div class="easyui-layout easyui-datagrid-layout" data-options="fit:true" >
		<div class="easyui-panel" data-options="fit:true,border:false" title="运算符支持">
		    <table singleSelect=true fit=true id="dauthOperatorSupport_grid"
		        fitColumns=true toolbar="#dauthOperatorSupport_toolbar" rownumbers="true" pagination="true"
		        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		        data-options="url:'${ctx}/sys/dauthOperator/supportList'">
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
		                <th data-options="field:'descr',width:200" editor="{type:'textbox',options:{validType:['length[0,500]']}}">描述</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="dauthOperatorSupport_toolbar" tag=listen_hotkey>
		        <table>
		            <tr>
		              <td>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATORSUPPORT_ADD %>">
			                 <a href="javascript:void(0);" class="btn btn-primary" tag="add"><i class="fa fa-plus"></i>新建</a>
		            	</shiro:hasPermission>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATORSUPPORT_UPDATE %>">
		            	     <div style="display:none">
			                    <a href="javascript:void(0);" tag="update"><i class="fa fa-plus"></i>修改</a>
			                 </div>
		            	</shiro:hasPermission>
		            	<h:hasAnyPermissions name='<%= Auths.Sys.DAUTH_OPERATORSUPPORT_ADD + "," + Auths.Sys.DAUTH_OPERATORSUPPORT_UPDATE %>'>
			                    <a href="javascript:void(0);" class="btn btn-success" tag="save"><i class="fa fa-save"></i>保存</a>
		            	</h:hasAnyPermissions>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATORSUPPORT_DELETE %>">
			                <a href="javascript:void(0);" class="btn btn-darkorange" tag="del"><i class="fa fa-remove"></i>删除</a>
		            	</shiro:hasPermission>
		
		                <a href="javascript:void(0);" class="btn btn-azure" tag="undo"><i class="fa fa-mail-reply"></i>撤销</a>
		                <shiro:hasPermission name="<%= Auths.Sys.DAUTH_FILTERTYPE_VIEW %>">
			                    <a href="javascript:void(0);" class="btn btn-magenta" tag="filterType"><i class="fa fa-filter"></i>过滤类型配置</a>
		                </shiro:hasPermission>
		                <shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATOR_VIEW %>">
			                <a href="javascript:void(0);" class="btn btn-purple" tag="operator"><i class="fa fa-calculator"></i>运算符配置</a>
		                </shiro:hasPermission>
		                <a href="javascript:void(0);" class="btn btn-yellow" tag="clear"><i class="fa fa-eraser"></i>清空查询</a>
		                
		               </td>
		            </tr>
		        </table>
		    </div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthOperatorSupport_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>