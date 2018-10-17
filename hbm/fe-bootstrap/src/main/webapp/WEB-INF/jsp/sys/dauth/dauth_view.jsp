<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据权限配置</title>
</head>
<body>
	<div class="easyui-layout easyui-datagrid-layout" fit=true>
        <div region="center" title="数据权限配置" style="" data-options="split:true,border:false">
        	<table singleSelect=true fit=true id="dauth_grid"
		        fitColumns=true toolbar="#dauth_toolbar" rownumbers="true" pagination="true"
		        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		        data-options="url:'${ctx}/sys/dauth/list'">
		        <thead>
		            <tr>
		                <th data-options="field:'dauthCode',width:150" sortable="true" editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">编码</th>
		                <th data-options="field:'dauthName',width:150" sortable="true" editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">名称</th>
		                <th data-options="field:'sysMetadataEntity.entityName',width:150" sortable="true" 
		                	editor="{type:'combogrid',options:{url:'${ctx}/sys/sysMetadata/getEntityList',panelWidth:300,panelHeight:'200',fitColumns:true,idField:'entityId',textField:'entityName', 
				   			columns:[[{field:'entityCode',title:'编码',width:100},{field:'entityName',title:'名称',width:100},{field:'tableName',title:'表名',width:100}]],
				   			onSelect:dauthGrid.selectEntity,
				   			mode:'remote',editable:false,required:true,missingMessage:'此输入项为必填项'}}">实体</th>
		                <th data-options="field:'sysMetadataEntity.tableName',width:150" sortable="true" editor="{type:'textbox',options:{disabled:true}}">表名</th>
		                <th data-options="field:'tableAlias',width:150" sortable="true" editor="{type:'textbox',options:{disabled:true}}">别名</th>
		                <th data-options="field:'descr',width:200" editor="{type:'textbox',options:{validType:['length[0,500]']}}">描述</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="dauth_toolbar" tag=listen_hotkey>
		        <table>
		            <tr>
		              <td>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_ADD %>">
			                <a href="javascript:void(0);" class="btn btn-primary" tag="add"><i class="fa fa-plus"></i>新建</a>
		            	</shiro:hasPermission>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_UPDATE %>">
			                <a href="javascript:void(0);" style="display:none" tag="update"><i class="fa fa-plus"></i>修改</a>
		            	</shiro:hasPermission>
		            	<h:hasAnyPermissions name='<%= Auths.Sys.DAUTH_ADD + "," + Auths.Sys.DAUTH_UPDATE %>'>
			                <a href="javascript:void(0);" class="btn btn-success" tag="save"><i class="fa fa-save"></i>保存</a>
		            	</h:hasAnyPermissions>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_DELETE %>">
			                <a href="javascript:void(0);" class="btn btn-darkorange" tag="del"><i class="fa fa-remove"></i>删除</a>
		            	</shiro:hasPermission>
		                <a href="javascript:void(0);" class="btn btn-azure" tag="undo"><i class="fa fa-mail-reply"></i>撤销</a>
		                <shiro:hasPermission name="<%= Auths.Sys.DAUTH_CHECK %>">
	                    		<a href="javascript:void(0);" class="btn btn-purple" tag="dauthCheck"><i class="fa fa-check-circle-o"></i>校验</a>
		                </shiro:hasPermission>
		                
                        <a href="javascript:void(0);" class="btn btn-yellow" tag="clear"><i class="fa fa-eraser"></i>清空查询</a>
		              </td>
		            </tr>
		        </table>
		    </div>
        </div>
        <div region="east" title="过滤器组配置" data-options="width:'50%',hideCollapsedContent:false,collapsed:false,split:true,border:false" 
        	href="${ctx}/sys/dauthFilter/filterGroupView">
        </div>
    </div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauth_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>