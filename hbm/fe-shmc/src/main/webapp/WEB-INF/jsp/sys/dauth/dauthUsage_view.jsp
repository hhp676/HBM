<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据权限应用</title>
</head>
<body>
        	<table singleSelect=true  id="dauthUsage_grid"
		        fitColumns=true toolbar="#dauthUsage_toolbar" rownumbers="true" pagination="true"
		        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
		        data-options="url:'${ctx}/sys/dauthUsage/list',title:'数据权限应用',width:'100%',scrollbarSize:0">
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
		        <table class="table_form_result">
                    <caption>
		            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_USAGE_UPDATE %>">
		            		<div style="display: none"><a href="javascript:void(0)" tag="update"><em>修改</em></a></div>
			                <a href="javascript:void(0)" class="a_btn_green" tag="save"><em>保存</em></a>
		            	</shiro:hasPermission>
		                    <a href="javascript:void(0)" class="a_btn_orange" tag="undo"><em>撤销</em></a>
		                <shiro:hasPermission name="<%= Auths.Sys.DAUTH_USAGE_CLEARCONFIG %>">
			                <a href="javascript:void(0)" class="a_btn_blue" tag="delDauthSet"><em>清除数据权限配置</em></a>
		                </shiro:hasPermission>
		                <a class="a_btn_gray" tag="clear"><em>清空查询</em></a>
		            </caption>
		        </table>
		    </div>
        <div class="easyui-panel" data-options="hideCollapsedContent:false,collapsed:false,border:false" 
        	href="${ctx}/sys/dauth/detailView">
        </div>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthUsage_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>