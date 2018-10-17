<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="easyui-datagrid" singleSelect=true fit=true id="dataitem_grid"
		toolbar="#dataitem_toolbar" fitColumns=true  pagination="true"
                pageSize="${defaultPageSize}" pageList="${defaultPageList}">
		<thead>
			<tr>
				<th data-options="field:'itemName',width:130" editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:'length[1,100]'}}">字典项名称</th>
				<th data-options="field:'itemValue',width:60" editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:'length[1,100]'}}">字典项值</th>
				<th data-options="field:'isVisible',width:80,formatter:HgUtil.fieldFormatterFunc('trueOrFalse')"
				   editor="{type:'combobox',options:{url:'${ctx}/sys/common/sysDict/itemList/trueOrFalse',
                         prompt: '---请选择---',panelHeight:'auto',textField:'itemName',valueField:'itemValue', mode:'remote',editable:false}}">是否可见</th>
				<th data-options="field:'sortNo',width:60" editor="{type:'numberbox',options:{min:0,validType:'length[1,4]'}}">排序号</th>
				<th data-options="field:'subGroupCode',width:80" editor="{type:'textbox',options:{validType:'length[1,60]'}}">分组编码</th>
			</tr>
		</thead>
	</table>
	<div id="dataitem_toolbar">
		<table>
			<tr>
			    <shiro:hasPermission name="<%= Auths.Sys.DICT_ITEM_ADD %>">
					<td><a href="javascript:void(0)" class="easyui-linkbutton" authId=""
						iconCls="icon_add1" plain="true" tag="add">新建</a></td>
			    </shiro:hasPermission>
			    <shiro:hasPermission name="<%= Auths.Sys.DICT_ITEM_UPDATE %>">
	                <td style="display: none"><a href="javascript:void(0)"
	                    iconCls="icon_add1" plain="true" tag="update">修改</a></td>
            	</shiro:hasPermission>
            	<h:hasAnyPermissions name='<%= Auths.Sys.DICT_ITEM_ADD + "," + Auths.Sys.DICT_ITEM_UPDATE %>'>
            		<td><a href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon_save1" plain="true" tag="save">保存</a></td>
            	</h:hasAnyPermissions>
			    <shiro:hasPermission name="<%= Auths.Sys.DICT_ITEM_DELETE %>">
					<td><a href="javascript:void(0)" class="easyui-linkbutton"
						iconCls="icon_delete" plain="true" tag="del">删除</a></td>
			    </shiro:hasPermission>

				<td><a href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon_undo',plain:true" tag="undo">撤销</a></td>
			</tr>
		</table>
	</div>

	<script type="text/javascript" src="${ctx}/static/js/sys/dict/sysDictitem_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>