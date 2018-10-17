<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据权限变量配置</title>
</head>
<body>
    <table singleSelect=true fit=true id="dauthVariable_grid" class="easyui-datagrid-layout"
        fitColumns=true toolbar="#dauthVariable_toolbar" rownumbers="true" pagination="true"
        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
        data-options="url:'${ctx}/sys/dauthVariable/list'">
        <thead>
            <tr>
                <th data-options="field:'variableCode',width:200" sortable="true" editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">变量编码</th>
                <th data-options="field:'variableName',width:150" sortable="true" editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">变量名称</th>
                <th data-options="field:'variableValue',width:250" sortable="true" editor="{type:'textbox',options:{required:true,validType:{length:[1,3000]},missingMessage:'此输入项为必填项'}}">变量值</th>
                <th data-options="field:'engName',width:100" sortable="true" editor="{type:'textbox',options:{validType:['onlyEng','length[0,60]']}}">英文名称</th>
                <th data-options="field:'i18nCode',width:100" sortable="true" editor="{type:'textbox',options:{validType:{length:[0,60]}}}">国际化编码</th>
                <th data-options="field:'descr',width:200" editor="{type:'textbox'}">描述</th>
            </tr>
        </thead>
    </table>
    <div id="dauthVariable_toolbar" tag=listen_hotkey>
        <table>
            <tr>
             <td>
            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_VARIABLE_ADD %>">
	                <a href="javascript:void(0);" class="btn btn-primary" tag="add"><i class="fa fa-plus"></i>新建</a>
            	</shiro:hasPermission>
            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_VARIABLE_UPDATE %>">
	                <a href="javascript:void(0);" style="display:none" tag="update"><i class="fa fa-plus"></i>修改</a>
            	</shiro:hasPermission>
            	<h:hasAnyPermissions name='<%= Auths.Sys.DAUTH_VARIABLE_ADD + "," + Auths.Sys.DAUTH_VARIABLE_UPDATE %>'>
	                <a href="javascript:void(0);" class="btn btn-success" tag="save"><i class="fa fa-save"></i>保存</a>
            	</h:hasAnyPermissions>
            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_VARIABLE_DELETE %>">
	                <a href="javascript:void(0);" class="btn btn-darkorange" tag="del"><i class="fa fa-remove"></i>删除</a>
            	</shiro:hasPermission>
                <a href="javascript:void(0);" class="btn btn-azure" tag="undo"><i class="fa fa-mail-reply"></i>撤销</a>
                <a href="javascript:void(0);" class="btn btn-yellow" tag="clear"><i class="fa fa-eraser"></i>清空查询</a>
               </td>
            </tr>
        </table>
    </div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthVariable_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>