<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据权限配置</title>
</head>
<body>
        	<table singleSelect=true id="dauth_grid"
		        fitColumns=true toolbar="#dauth_toolbar" rownumbers="true" pagination="true"
		        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		        data-options="url:'${ctx}/sys/dauth/list',title:'数据权限配置',width:'100%',scrollbarSize:0">
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
		                <th data-options="field:'engName',width:150" sortable="true" editor="{type:'textbox',options:{validType:['onlyEng','length[0,60]']}}">英文名称</th>
		                <th data-options="field:'i18nCode',width:150" sortable="true" editor="{type:'textbox',options:{validType:{length:[0,60]}}}">国际化编码</th>
		                <th data-options="field:'descr',width:200" editor="{type:'textbox'}">描述</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="dauth_toolbar" tag=listen_hotkey>
		        <table class="table_form_result">
                    <caption>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_ADD %>">
			                <a href="javascript:void(0)" class="a_btn_blue" tag="add"><em>新建</em></a>
		            	</shiro:hasPermission>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_UPDATE %>">
			                <div style="display: none"><a href="javascript:void(0)" tag="update"><em>修改</em></a></div>
		            	</shiro:hasPermission>
		            	<h:hasAnyPermissions name='<%= Auths.Sys.DAUTH_ADD + "," + Auths.Sys.DAUTH_UPDATE %>'>
			                <a href="javascript:void(0)" class="a_btn_green" tag="save"><em>保存</em></a>
		            	</h:hasAnyPermissions>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_DELETE %>">
			                <a href="javascript:void(0)" class="a_btn_red" tag="del"><em>删除</em></a>
		            	</shiro:hasPermission>
		                <a href="javascript:void(0)" class="a_btn_orange" tag="undo"><em>撤销</em></a>
		                <shiro:hasPermission name="<%= Auths.Sys.DAUTH_CHECK %>">
	                       <a href="javascript:void(0)" class="a_btn_blue" tag="dauthCheck"><em>校验</em></a>
		                </shiro:hasPermission>
		                <a class="a_btn_gray" tag="clear"><em>清空查询</em></a>
		            </caption>
		        </table>
		    </div>
        <div class="easyui-panel" data-options="width:'100%',hideCollapsedContent:false,collapsed:false,border:false" 
        	href="${ctx}/sys/dauthFilter/filterGroupView">
        </div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauth_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>