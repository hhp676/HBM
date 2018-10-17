<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据权限配置</title>
</head>
<body>
	<div class="easyui-layout" fit=true>
        <div region="center" title="数据权限配置" style="" data-options="split:true">
        	<table singleSelect=true fit=true id="dauth_grid"
		        fitColumns=true toolbar="#dauth_toolbar" rownumbers="true" pagination="true"
		        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		        data-options="url:'${ctx}/sys/dauth/list'">
		        <thead>
		            <tr>
		                <th data-options="field:'dauthCode',width:150" sortable="true" editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">编码</th>
		                <th data-options="field:'dauthName',width:150" sortable="true" editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">名称</th>
		                <th data-options="field:'sysMetadataEntity.entityName',width:150" sortable="true" 
		                	editor="{type:'combogrid',options:{url:'${ctx}/sys/sysMetadata/getEntityList',panelWidth:300,fitColumns:true,idField:'entityId',textField:'entityName', 
				   			columns:[[{field:'entityCode',title:'编码',width:100},{field:'entityName',title:'名称',width:100},{field:'tableName',title:'表名',width:100}]],
				   			onSelect:dauthGrid.selectEntity,
				   			mode:'remote',editable:false,required:true,missingMessage:'此输入项为必填项'}}">实体</th>
		                <th data-options="field:'sysMetadataEntity.tableName',width:150" sortable="true" editor="{type:'textbox',options:{disabled:true}}">表名</th>
		                <th data-options="field:'tableAlias',width:150" sortable="true" editor="{type:'textbox',options:{disabled:true}}">别名</th>
		                <th data-options="field:'descr',width:190" editor="{type:'textbox'}">描述</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="dauth_toolbar" tag=listen_hotkey>
		        <table>
		            <tr>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_ADD %>">
			                <td><a href="javascript:void(0)" class="easyui-linkbutton"
			                    iconCls="icon_add1" plain="true" tag="add">新建</a></td>
		            	</shiro:hasPermission>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_UPDATE %>">
			                <td style="display: none"><a href="javascript:void(0)"
			                    iconCls="icon_add1" plain="true" tag="update">修改</a></td>
		            	</shiro:hasPermission>
		            	<h:hasAnyPermissions name='<%= Auths.Sys.DAUTH_ADD + "," + Auths.Sys.DAUTH_UPDATE %>'>
			                <td><a href="javascript:void(0)" class="easyui-linkbutton"
			                    iconCls="icon_save1" plain="true" tag="save">保存</a></td>
		            	</h:hasAnyPermissions>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_DELETE %>">
			                <td><a href="javascript:void(0)" class="easyui-linkbutton"
			                    iconCls="icon_delete" plain="true" tag="del">删除</a></td>
		            	</shiro:hasPermission>
		                <td><a href="javascript:void(0)" class="easyui-linkbutton"
		                    data-options="iconCls:'icon_undo',plain:true" tag="undo">撤销</a></td>
		                <shiro:hasPermission name="<%= Auths.Sys.DAUTH_CHECK %>">
		                    <td><a href="javascript:void(0)" class="easyui-linkbutton"
	                    		data-options="iconCls:'icon_auto_colorful__check',plain:true" tag="dauthCheck">校验</a></td>
		                </shiro:hasPermission>
		                <td><div class="datagrid-btn-separator"></div></td>
		                <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>
		            </tr>
		        </table>
		    </div>
        </div>
        <div region="east" title="过滤器组配置" data-options="width:'50%',hideCollapsedContent:false,collapsed:false,split:true" 
        	href="${ctx}/sys/dauthFilter/filterGroupView">
        </div>
    </div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauth_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>