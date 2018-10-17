<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据权限应用</title>
</head>
<body>
	<div class="easyui-layout" fit=true>
        <div region="center" title="数据权限应用" style="" data-options="split:true">
        	<table singleSelect=true fit=true id="dauthUsage_grid"
		        fitColumns=true toolbar="#dauthUsage_toolbar" rownumbers="true" pagination="true"
		        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		        data-options="url:'${ctx}/sys/dauthUsage/list'">
		        <thead>
		            <tr>
		                <th data-options="field:'methodShortName',width:200" sortable="true" editor="{type:'textbox',options:{disabled:true}}">名称</th>
		                <th data-options="field:'isValid',width:80,sortable:true,formatter:HgUtil.fieldFormatterFunc('DAUTH_USAGE_METHOD_VALID')"
			   				editor="{type:'textbox',options:{disabled:true}}">是否在用</th>
		                <th data-options="field:'sysDauth.dauthName',width:150" sortable="true" 
		                	editor="{type:'textbox',options:{buttonText:'...',onClickButton:dauthUsageGrid.clickDauthBtn,editable:false,blurNoChangeValue:true}}">数据权限</th>
		                <th data-options="field:'methodZhName',width:100" sortable="true" editor="{type:'textbox',options:{validType:{length:[0,60]}}}">中文名</th>
		                <th data-options="field:'methodEngName',width:80" sortable="true" editor="{type:'textbox',options:{validType:{length:[0,60]}}}">英文名称</th>
		                <th data-options="field:'methodI18nCode',width:80" sortable="true" editor="{type:'textbox',options:{validType:{length:[0,60]}}}">国际化编码</th>
		                <th data-options="field:'descr',width:150" editor="{type:'textbox'}">描述</th>
		            </tr>
		        </thead>
		    </table>
		    <div id="dauthUsage_toolbar" tag=listen_hotkey>
		        <table>
		            <tr>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_USAGE_UPDATE %>">
		            		<td style="display: none"><a href="javascript:void(0)"
			                    iconCls="icon_add1" plain="true" tag="update">修改</a></td>
			                <td><a href="javascript:void(0)" class="easyui-linkbutton"
			                    iconCls="icon_save1" plain="true" tag="save">保存</a></td>
		            	</shiro:hasPermission>
		                <td><a href="javascript:void(0)" class="easyui-linkbutton"
		                    data-options="iconCls:'icon_undo',plain:true" tag="undo">撤销</a></td>
		                <shiro:hasPermission name="<%= Auths.Sys.DAUTH_USAGE_CLEARCONFIG %>">
		                    <td><a href="javascript:void(0)" class="easyui-linkbutton"
			                    data-options="iconCls:'icon_clear',plain:true" tag="delDauthSet">清除数据权限配置</a></td>
		                </shiro:hasPermission>
		                <td><div class="datagrid-btn-separator"></div></td>
		                <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>
		            </tr>
		        </table>
		    </div>
        </div>
        <div region="south" title="数据权限详情" data-options="height:'50%',hideCollapsedContent:false,collapsed:false,split:true" 
        	href="${ctx}/sys/dauth/detailView">
        </div>
    </div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthUsage_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>