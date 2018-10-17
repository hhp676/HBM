<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>元数据管理</title>
</head>
<body>
	<div class="easyui-layout" fit=true>
        <div region="center" style="" data-options="split:true,border:false">
        	<div class="easyui-layout" fit=true>
		        <div region="center" title="实体管理" data-options="split:true,border:false">
		        	<table singleSelect=true fit=true id="sysMetadataEntity_grid"
				        fitColumns=true toolbar="#sysMetadataEntity_toolbar" rownumbers="true" pagination="true" 
				        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
				        data-options="url:'${ctx}/sys/sysMetadata/entityList'">
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
				                <th data-options="field:'descr',width:200" editor="{type:'textbox',options:{validType:{length:[0,500]}}}">描述</th>
				            </tr>
				        </thead>
				    </table>
				    <div id="sysMetadataEntity_toolbar" tag=listen_hotkey>
				        <table>
				            <tr>
				              <td>
				            	<shiro:hasPermission name="<%= Auths.Sys.METADATA_ENTITY_ADD %>">
					                <a href="javascript:void(0);" class="btn btn-primary" tag="add"><i class="fa fa-plus"></i>新建</a>
				            	</shiro:hasPermission>
				            	<shiro:hasPermission name="<%= Auths.Sys.METADATA_ENTITY_UPDATE %>">
					                <a href="javascript:void(0);" style="display:none" tag="update"><i class="fa fa-plus"></i>修改</a>
				            	</shiro:hasPermission>
				            	<h:hasAnyPermissions name='<%= Auths.Sys.METADATA_ENTITY_ADD + "," + Auths.Sys.METADATA_ENTITY_UPDATE %>'>
					                <a href="javascript:void(0);" class="btn btn-success" tag="save"><i class="fa fa-save"></i>保存</a>
				            	</h:hasAnyPermissions>
				            	<shiro:hasPermission name="<%= Auths.Sys.METADATA_ENTITY_DELETE %>">
					                <a href="javascript:void(0);" class="btn btn-darkorange" tag="del"><i class="fa fa-remove"></i>删除</a>
				            	</shiro:hasPermission>
				                <a href="javascript:void(0);" class="btn btn-azure" tag="undo"><i class="fa fa-mail-reply"></i>撤销</a>
				                <a href="javascript:void(0);" class="btn btn-yellow" tag="clear"><i class="fa fa-eraser"></i>清空查询</a>
				              </td>
				            </tr>
				        </table>
				    </div>
		        </div>
		        <div region="south" title="字段管理" data-options="height:'45%',split:true,hideCollapsedContent:false,collapsible:false,border:false"
					href='${ctx}/sys/sysMetadata/metadataFieldView'>
		        </div>
       		</div>
        </div>
    </div>
    <script type="text/javascript" src="${ctx}/static/js/sys/metadata/sysMetadata_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>