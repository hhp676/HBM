<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SysConfig</title>
</head>
<body>
			<table singleSelect=true  id="sysConfig_grid" fitColumns=true 
				toolbar="#sysConfig_toolbar" pagination="true"
				pageSize="${defaultPageSize}" pageList="${defaultPageList}"
				data-options="url:'${ctx}/sys/sysConfig/list',title:'系统设置',collapsible:true,width:'100%',scrollbarSize:0" >
				<thead>
					<tr>
						<th data-options="field:'configId',width:160,hidden:true">主键</th>
						<th data-options="field:'configKey',width:120"
							editor="{type:'textbox',options:{required:true,validType:'length[1,32]',missingMessage:'此输入项为必填项'}}">设置KEY</th>
						<th data-options="field:'configType',width:100"
							editor="{type:'textbox',options:{required:true,validType:'length[1,32]',missingMessage:'此输入项为必填项'}}">设置类型</th>
						<th data-options="field:'configValue',width:80"
							editor="{type:'textbox',options:{required:true,validType:'length[1,256]',missingMessage:'此输入项为必填项'}}">设置值</th>
						<th data-options="field:'defaultValue',width:80"
							editor="{type:'textbox',options:{required:true,validType:'length[1,256]',missingMessage:'此输入项为必填项'}}">默认值</th>
						<th data-options="field:'configDesc',width:220"
							editor="{type:'textbox',options:{validType:'length[0,256]'}}">设置描述</th>
						<th data-options="field:'sortNo',width:80"
							editor="{type:'numberbox',options:{validType:'length[0,10]'}}">排序号</th>
						<th data-options="field:'version',width:80">版本号</th>
						<th data-options="field:'isCurrent',width:100,formatter:HgUtil.fieldFormatterFunc('trueOrFalse')">是否当前版本</th>
						<th data-options="field:'isFinal',width:100,formatter:HgUtil.fieldFormatterFunc('trueOrFalse')" >是否不可修改</th>

					</tr>
				</thead>
			</table>
			<div id="sysConfig_toolbar" tag=listen_hotkey>
				<table class="table_form_result">
                    <caption>
					    <shiro:hasPermission name="<%= Auths.Sys.CONFIG_CREATE %>">
						    <a href="javascript:void(0)" class="a_btn_blue" tag="add"><em>新建</em></a>
						</shiro:hasPermission>
						<shiro:hasPermission name="<%= Auths.Sys.CONFIG_UPDATE %>">
			                <div style="display: none"><a href="javascript:void(0)" tag="update"><em>修改</em></a></div>
		            	</shiro:hasPermission>
		            	<h:hasAnyPermissions name='<%= Auths.Sys.CONFIG_CREATE + "," + Auths.Sys.CONFIG_UPDATE %>'>
		            		<a href="javascript:void(0)" class="a_btn_green" tag="save"><em>保存</em></a>
		            	</h:hasAnyPermissions>
					    <shiro:hasPermission name="<%= Auths.Sys.CONFIG_DELETE %>">
							<a href="javascript:void(0)" class="a_btn_red" tag="del"><em>删除</em></a>
                        </shiro:hasPermission>
						  <a href="javascript:void(0)" class="a_btn_orange" tag="undo"><em>撤销</em></a>
                        <a class="a_btn_gray" tag="clear"><em>清空查询</em></a>
					</caption>
				</table>
			</div>
		      <table singleSelect=true  id="sysConfigHis_grid" fitColumns=true pagination="true" 
            pageSize="${defaultPageSize}" pageList="${defaultPageList}"
                data-options="title:'历史版本',collapsible:true,width:'100%',scrollbarSize:0">
                <thead>
                    <tr>
                        <th data-options="field:'configId',width:160,hidden:true">主键</th>
                        <th data-options="field:'configKey',width:120"
                            >设置KEY</th>
                        <th data-options="field:'configType',width:100"
                            >设置类型</th>
                        <th data-options="field:'configValue',width:80"
                            >设置值</th>
                        <th data-options="field:'defaultValue',width:80"
                            >默认值</th>
                        <th data-options="field:'configDesc',width:220"
                            >设置描述</th>
                        <th data-options="field:'sortNo',width:80"
                            >排序号</th>
                        <th data-options="field:'version',width:80">版本号</th>
                        <th data-options="field:'isCurrent',width:100,formatter:function(value){return HgUtil.getDictItemName('trueOrFalse',value);}">是否当前版本</th>
                        <th data-options="field:'isFinal',width:100,formatter:function(value){return HgUtil.getDictItemName('trueOrFalse',value);}" >是否不可修改</th>

                    </tr>
                </thead>
            </table>
		
	<script type="text/javascript"
		src="${ctx}/static/js/sys/config/sysConfig_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>