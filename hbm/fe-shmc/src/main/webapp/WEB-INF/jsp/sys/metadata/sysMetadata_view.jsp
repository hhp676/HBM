<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>元数据管理</title>
</head>
<body>
		        	<table singleSelect=true  id="sysMetadataEntity_grid"
				        fitColumns=true toolbar="#sysMetadataEntity_toolbar" rownumbers="true" pagination="true" 
				        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
				        data-options="url:'${ctx}/sys/sysMetadata/entityList',title:'实体管理',width:'100%'">
				        <thead>
				            <tr>
				                <th data-options="field:'entityCode',width:150" sortable="true" 
				                	editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">实体编码</th>
				                <th data-options="field:'entityName',width:150" sortable="true" 
				                	editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">实体名称</th>
				               	<th data-options="field:'tableName',width:150" sortable="true" 
				               		editor="{type:'textbox',options:{buttonText:'...',onClickButton:sysMetadataEntityGrid.clickTableBtn,
				               			editable:false,required:true,missingMessage:'此输入项为必填项'}}">表名</th>
				              	<th data-options="field:'tableAlias',width:100" sortable="true" 
				               		editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">别名</th>
				                <th data-options="field:'engName',width:150" sortable="true" editor="{type:'textbox',options:{validType:['onlyEng','length[0,60]']}}">英文名称</th>
				               	<th data-options="field:'i18nCode',width:150" sortable="true" editor="{type:'textbox',options:{validType:{length:[0,60]}}}">国际化编码</th>
				                <th data-options="field:'descr',width:200" editor="{type:'textbox'}">描述</th>
				            </tr>
				        </thead>
				    </table>
				    <div id="sysMetadataEntity_toolbar" tag=listen_hotkey>
				        <table class="table_form_result">
                            <caption>
				            	<shiro:hasPermission name="<%= Auths.Sys.METADATA_ENTITY_ADD %>">
					                <a href="javascript:void(0)" class="a_btn_blue" tag="add"><em>新建</em></a>
				            	</shiro:hasPermission>
				            	<shiro:hasPermission name="<%= Auths.Sys.METADATA_ENTITY_UPDATE %>">
					                <div style="display: none"><a href="javascript:void(0)" tag="update"><em>修改</em></a></div>
				            	</shiro:hasPermission>
				            	<h:hasAnyPermissions name='<%= Auths.Sys.METADATA_ENTITY_ADD + "," + Auths.Sys.METADATA_ENTITY_UPDATE %>'>
					                <a href="javascript:void(0)" class="a_btn_green" tag="save"><em>保存</em></a>
				            	</h:hasAnyPermissions>
				            	<shiro:hasPermission name="<%= Auths.Sys.METADATA_ENTITY_DELETE %>">
					                <a href="javascript:void(0)" class="a_btn_red" tag="del"><em>删除</em></a>
				            	</shiro:hasPermission>
				                <a href="javascript:void(0)" class="a_btn_orange" tag="undo"><em>撤销</em></a>
				                <a class="a_btn_gray" tag="clear"><em>清空查询</em></a>
				            </caption>
				        </table>
				    </div>
		        <div class="easyui-panel" data-options="height:'auto',split:false,border:false,hideCollapsedContent:false"
					href='${ctx}/sys/sysMetadata/metadataFieldView'>
		        </div>
    <script type="text/javascript" src="${ctx}/static/js/sys/metadata/sysMetadata_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>