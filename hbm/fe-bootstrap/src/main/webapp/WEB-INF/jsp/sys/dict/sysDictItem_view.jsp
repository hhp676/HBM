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
		toolbar="#dataitem_toolbar" fitColumns=true border=false pagination="true"
                pageSize="${defaultPageSize}" pageList="${defaultPageList}">
		<thead>
			<tr>
				<th data-options="field:'itemName',width:130" editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:'length[1,100]'}}">字典项名称</th>
				<th data-options="field:'itemValue',width:60" editor="{type:'textbox',options:{required:true,missingMessage:'此输入项为必填项',validType:'length[1,100]'}}">字典项值</th>
				<th data-options="field:'isVisible',width:80,formatter:dictItemGridVisibleFormatter"
				   editor="{type:'combobox',options:{prompt: '---请选择---',url:'${ctx}/sys/sysDict/itemList/trueOrFalse',panelHeight:'auto',textField:'itemName',valueField:'itemValue', mode:'remote',editable:false}}">是否可见</th>
				<th data-options="field:'sortNo',width:60" editor="{type:'numberbox',options:{min:0,validType:'length[1,4]'}}">排序号</th>
				<th data-options="field:'subGroupCode',width:80" editor="{type:'textbox',options:{validType:'length[1,60]'}}">分组编码</th>
			</tr>
		</thead>
	</table>
	<div id="dataitem_toolbar">
		<table>
			<tr>
					<td>
					<a href="javascript:void(0)" class="btn btn-primary" tag="add"><i class="fa fa-plus"></i>新建</a>
	                <div style="display: none"><a href="javascript:void(0)"  tag="update"><i class="fa fa-plus"></i>修改</a></div>
            		<a href="javascript:void(0)" class="btn btn-success" tag="save"><i class="fa fa-save"></i>保存</a>
					<a href="javascript:void(0)" class="btn btn-darkorange" tag="del"><i class="fa fa-remove"></i>删除</a>

				    <a href="javascript:void(0)" class="btn btn-azure" tag="undo"><i class="fa fa-mail-reply"></i>撤销</a>
				</td>
			</tr>
		</table>
	</div>

	<script type="text/javascript" src="${ctx}/static/js/sys/dict/sysDictitem_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>