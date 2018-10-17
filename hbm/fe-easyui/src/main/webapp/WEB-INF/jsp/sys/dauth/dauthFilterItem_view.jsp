<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>过滤器项配置</title>
</head>
<body>
	<div class="easyui-layout" fit=true>
        <div region="west" title="实体列表" data-options="width:'45%',hideCollapsedContent:false,collapsed:false,split:true">
        	<div class="easyui-layout" fit=true>
		        <div region="center"data-options="split:true"
		        	href="${ctx}/sys/sysMetadata/metadataEntityFilterItemView">
		        	
		        </div>
		        <div region="south" title="字段列表" data-options="height:'45%',split:true,hideCollapsedContent:false,collapsible:true"
					href='${ctx}/sys/sysMetadata/metadataFieldFilterItemView'>
		        </div>
       		</div>
        </div>
        <div region="center" title="过滤器项配置" data-options="split:true">
        	<div class="easyui-layout" fit=true>
				<div region="center" style="" data-options="split:true">
				    <table singleSelect=true fit=true id="dauthFilterItem_grid"
				        fitColumns=true toolbar="#dauthFilterItem_toolbar" rownumbers="true" pagination="true"
				        pageSize="${defaultPageSize}" pageList="${defaultPageList}">
				        <thead>
				            <tr>
				                <th data-options="field:'sysDauthFilterType.filterTypeName',width:150,formatter:dauthFilterItemGrid.filterTypeIdFormat" sortable="true" 
				                	editor="{type:'combobox',options:{url:'${ctx}/sys/dauthFilterType/getFilterTypeList',prompt: '---请选择---',
				                	onChange:dauthFilterItemGrid.filterTypeChange,onLoadSuccess:dauthFilterItemGrid.filterTypeLoadSuccess,textField:'filterTypeName',
							   		valueField:'filterTypeId', mode:'remote',editable:false,required:true,missingMessage:'此输入项为必填项'}}">过滤类型</th>
				                <th data-options="field:'sysMetadataField.fieldName',width:150,formatter:dauthFilterItemGrid.fieldIdFormat" sortable="true" 
				                	editor="{type:'combobox',options:{textField:'fieldName',prompt: '---请选择---',
							   		valueField:'fieldId', mode:'remote',editable:false,required:true,missingMessage:'此输入项为必填项'}}">字段</th>
							   	<th data-options="field:'sysDauthOperator.operatorName',width:150,formatter:dauthFilterItemGrid.operatorIdFormat" sortable="true" 
				                	editor="{type:'combobox',options:{onChange:dauthFilterItemGrid.operatorChange,textField:'operatorName',prompt: '---请选择---',
							   		valueField:'operatorId', mode:'remote',editable:false,required:true,missingMessage:'此输入项为必填项'}}">运算符</th>
				                <th data-options="field:'valueType',width:150,sortable:true,formatter:HgUtil.fieldFormatterFunc('DAUTH_FILTER_VALUE_TYPE')"
							   		editor="{type:'combobox',options:{onChange:dauthFilterItemGrid.valueTypeChange,textField:'itemName',prompt: '---请选择---',
							   		valueField:'itemValue', mode:'remote',editable:false,required:true,missingMessage:'此输入项为必填项'}}">值类型</th>
							   	<th data-options="field:'filterValue',width:150,sortable:true,formatter:dauthFilterItemGrid.filterValueFormat"
							   		editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项'}}">过滤值</th>
				                <th data-options="field:'descr',width:150" editor="{type:'textbox'}">描述</th>
				            </tr>
				        </thead>
				    </table>
				    <div id="dauthFilterItem_toolbar" tag=listen_hotkey>
				        <table>
				            <tr>
				            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_FILTERITEM_ADD %>">
					                <td><a href="javascript:void(0)" class="easyui-linkbutton"
					                    iconCls="icon_add1" plain="true" tag="add">新建</a></td>
				            	</shiro:hasPermission>
				            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_FILTERITEM_UPDATE %>">
					                <td style="display: none"><a href="javascript:void(0)"
					                    iconCls="icon_add1" plain="true" tag="update">修改</a></td>
				            	</shiro:hasPermission>
				            	<h:hasAnyPermissions name='<%= Auths.Sys.DAUTH_FILTERITEM_ADD + "," + Auths.Sys.DAUTH_FILTERITEM_UPDATE %>'>
					                <td><a href="javascript:void(0)" class="easyui-linkbutton"
					                    iconCls="icon_save1" plain="true" tag="save">保存</a></td>
				            	</h:hasAnyPermissions>
				            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_FILTERITEM_DELETE %>">
					                <td><a href="javascript:void(0)" class="easyui-linkbutton"
					                    iconCls="icon_delete" plain="true" tag="del">删除</a></td>
				            	</shiro:hasPermission>
				                <td><a href="javascript:void(0)" class="easyui-linkbutton"
				                    data-options="iconCls:'icon_undo',plain:true" tag="undo">撤销</a></td>
				                <shiro:hasPermission name="<%= Auths.Sys.DAUTH_VARIABLE_VIEW %>">
					                <td><a href="javascript:void(0)" class="easyui-linkbutton"
					                    data-options="iconCls:'icon_edit',plain:true" tag="dauthVariable">数据权限变量</a></td>
				                </shiro:hasPermission>
				                <td><div class="datagrid-btn-separator"></div></td>
				                <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>
				            </tr>
				        </table>
				    </div>
				</div>
				<div region="south" title="过滤器组" data-options="height:'45%',split:true,hideCollapsedContent:false,collapsible:true"
					href="${ctx}/sys/dauthFilter/filterJoinItemGroupView">
		       </div>
			</div>
        </div>
    </div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthFilterItem_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>