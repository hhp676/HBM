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
	<div class="easyui-layout" fit=true >
		<div data-options="region:'center',title:'系统设置',border:false"
			style="padding: 0px; ">
			<table singleSelect=true fit=true id="sysConfig_grid" fitColumns=true
				toolbar="#sysConfig_toolbar" pagination="true"
				pageSize="${defaultPageSize}" pageList="${defaultPageList}"
				data-options="url:'${ctx}/sys/sysConfig/list'">
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
				<table>
					<tr>
					    <shiro:hasPermission name="<%= Auths.Sys.CONFIG_CREATE %>">
						    <td><a href="javascript:void(0)" class="easyui-linkbutton"
								iconCls="icon_add1" plain="true" tag="add">新建</a></td>
						</shiro:hasPermission>
						<shiro:hasPermission name="<%= Auths.Sys.CONFIG_UPDATE %>">
			                <td style="display: none"><a href="javascript:void(0)"
			                    iconCls="icon_add1" plain="true" tag="update">修改</a></td>
		            	</shiro:hasPermission>
		            	<h:hasAnyPermissions name='<%= Auths.Sys.CONFIG_CREATE + "," + Auths.Sys.CONFIG_UPDATE %>'>
		            		<td><a href="javascript:void(0)" class="easyui-linkbutton"
								iconCls="icon_save1" plain="true" tag="save">保存</a></td>
		            	</h:hasAnyPermissions>
					    <shiro:hasPermission name="<%= Auths.Sys.CONFIG_DELETE %>">
							<td><a href="javascript:void(0)" class="easyui-linkbutton"
								iconCls="icon_delete" plain="true" tag="del">删除</a></td>
                        </shiro:hasPermission>
						<td><a href="javascript:void(0)" class="easyui-linkbutton"
							data-options="iconCls:'icon_undo',plain:true" tag="undo">撤销</a></td>
						</td>
						<td><div class="datagrid-btn-separator"></div></td>
                        <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>

					</tr>
				</table>
			</div>
		</div>
		<div data-options="region:'south',title:'历史版本',split:true" style="height:40%;">
		      <table singleSelect=true fit=true id="sysConfigHis_grid" fitColumns=true pagination="true"
            pageSize="${defaultPageSize}" pageList="${defaultPageList}"
                data-options="">
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
		</div>
		
	</div>
	<script type="text/javascript"
		src="${ctx}/static/js/sys/config/sysConfig_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>