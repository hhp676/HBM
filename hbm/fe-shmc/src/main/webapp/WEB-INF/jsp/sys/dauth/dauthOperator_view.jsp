<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>运算符配置</title>
</head>
<body>
    <table singleSelect=true fit=true id="dauthOperator_grid"
        fitColumns=true toolbar="#dauthOperator_toolbar" rownumbers="true" pagination="true"
        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
        data-options="url:'${ctx}/sys/dauthOperator/operatorList'">
        <thead>
            <tr>
                <th data-options="field:'operatorCode',width:150" sortable="true" editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">运算符编码</th>
                <th data-options="field:'operatorName',width:150" sortable="true" editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">运算符名称</th>
                <th data-options="field:'operatorValue',width:150" sortable="true" editor="{type:'textbox',options:{required:true,validType:{length:[1,30]},missingMessage:'此输入项为必填项'}}">运算符值</th>
                <th data-options="field:'engName',width:150" sortable="true" editor="{type:'textbox',options:{validType:['onlyEng','length[0,60]']}}">英文名称</th>
                <th data-options="field:'i18nCode',width:150" sortable="true" editor="{type:'textbox',options:{validType:{length:[0,60]}}}">国际化编码</th>
                <th data-options="field:'descr',width:200" editor="{type:'textbox'}">描述</th>
            </tr>
        </thead>
    </table>
    <div id="dauthOperator_toolbar" tag=listen_hotkey>
        <table class="table_form_result">
             <caption>
            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATOR_ADD %>">
	                <a href="javascript:void(0)" class="a_btn_blue" tag="add"><em>新建</em></a>
            	</shiro:hasPermission>
            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATOR_UPDATE %>">
	                <div style="display: none"><a href="javascript:void(0)" tag="update"><em>修改</em></a></div>
            	</shiro:hasPermission>
            	<h:hasAnyPermissions name='<%= Auths.Sys.DAUTH_OPERATOR_ADD + "," + Auths.Sys.DAUTH_OPERATOR_UPDATE %>'>
	                <a href="javascript:void(0)" class="a_btn_green" tag="save"><em>保存</em></a>
	            </h:hasAnyPermissions>
            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_OPERATOR_DELETE %>">
	                <a href="javascript:void(0)" class="a_btn_red" tag="del"><em>删除</em></a>
            	</shiro:hasPermission>
                <a href="javascript:void(0)" class="a_btn_orange" tag="undo"><em>撤销</em></a>
                <a class="a_btn_gray" tag="clear"><em>清空查询</em></a>
            </caption>
        </table>
    </div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthOperator_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>