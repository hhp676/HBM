<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>过滤器项关联配置</title>
</head>
<body>
    <table singleSelect=true fit=true id="dauthFilterJoin_grid"
        fitColumns=true toolbar="#dauthFilterJoin_toolbar" rownumbers="true" pagination="true"
        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
        data-options="url:'${ctx}/sys/dauthFilter/winFilterJoinList?filterGroupId=${filterGroupId }'">
        <thead>
            <tr>
                <th data-options="field:'sysDauthFilterItem.sysDauthFilterType.filterTypeName',width:150" 
                	editor="{type:'textbox',options:{buttonText:'...',onClickButton:dauthFilterJoinGrid.clickFilterItemBtn,
          				editable:false,required:true,missingMessage:'此输入项为必填项'}}">过滤类型</th>
                <th data-options="field:'sysDauthFilterItem.sysMetadataField.fieldName',width:150" 
                	editor="{type:'textbox',options:{disabled:true,missingMessage:'此输入项为必填项'}}">字段</th>
			   	<th data-options="field:'sysDauthFilterItem.sysDauthOperator.operatorName',width:150" 
                	editor="{type:'textbox',options:{disabled:true,missingMessage:'此输入项为必填项'}}">运算符</th>
                <th data-options="field:'sysDauthFilterItem.valueType',width:150,formatter:HgUtil.fieldFormatterFunc('DAUTH_FILTER_VALUE_TYPE')"
			   		editor="{type:'textbox',options:{disabled:true,missingMessage:'此输入项为必填项'}}">值类型</th>
			   	<th data-options="field:'sysDauthFilterItem.filterValueStr',width:150"
			   		editor="{type:'textbox',options:{disabled:true,missingMessage:'此输入项为必填项'}}">过滤值</th>
                <th data-options="field:'descr',width:150" editor="{type:'textbox'}">描述</th>
            </tr>
        </thead>
    </table>
    <div id="dauthFilterJoin_toolbar" tag=listen_hotkey>
        <table class="table_form_result">
            <caption>
            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_FILTERJOIN_ADD %>">
	                <a href="javascript:void(0)" class="a_btn_blue" tag="add"><em>新建</em></a>
            	</shiro:hasPermission>
            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_FILTERJOIN_UPDATE %>">
	                <div style="display: none"><a href="javascript:void(0)" tag="update"><em>修改</em></a></div>
            	</shiro:hasPermission>
            	<h:hasAnyPermissions name='<%= Auths.Sys.DAUTH_FILTERJOIN_ADD + "," + Auths.Sys.DAUTH_FILTERJOIN_UPDATE %>'>
	                <a href="javascript:void(0)" class="a_btn_green" tag="save"><em>保存</em></a>
            	</h:hasAnyPermissions>
            	<shiro:hasPermission name="<%= Auths.Sys.DAUTH_FILTERJOIN_DELETE %>">
	                <a href="javascript:void(0)" class="a_btn_red" tag="del"><em>删除</em></a>
            	</shiro:hasPermission>
                <a href="javascript:void(0)" class="a_btn_orange" tag="undo"><em>撤销</em></a>
                <a class="a_btn_gray" tag="clear"><em>清空查询</em></a>
            </caption>
        </table>
    </div>
    <script type="text/javascript">
    	var dauthFilterJoin_filterGroupId = '${filterGroupId}';
    	var dauthFilterJoin_entityId = '${entityId}';
    </script>
	<script type="text/javascript" src="${ctx}/static/js/sys/dauth/dauthFilterJoin_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>