<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>职位管理</title>
</head>
<body>
<div class="easyui-layout" fit=true id="sysJobChooseLayout">
    <div region="center">
        <table singleSelect="${singleSelect }" fit=true id="sysJobChooseGrid"
               fitColumns=true toolbar="#sysJobChooseToolbar" pagination="true"
               pageSize="${defaultPageSize}" pageList="${defaultPageList}"
               data-options="url:'${ctx}/sys/org/chooseSysJobList'">
            <thead>
	            <tr>
	            	<th data-options="field:'jobId',checkbox:true"></th>
	                <th data-options="field:'jobCode',width:100" sortable="true">编码</th>
	                <th data-options="field:'jobName',width:150" sortable="true">名称</th>
	                <th data-options="field:'engName',width:150" sortable="true">英文名称</th>
	                <th data-options="field:'i18nCode',width:150" sortable="true">国际化编码</th>
	                <th data-options="field:'descr',width:200" editor="{type:'textbox'}">描述</th>
	            </tr>
            </thead>
        </table>
        <div id="sysJobChooseToolbar" tag=listen_hotkey>
            <table>
                <tr>
                    <td><a class="easyui-linkbutton" iconCls="icon_clear" plain="true" tag="clear">清空查询</a></td>
                </tr>
            </table>
        </div>
    </div>
    <div data-options="region:'south',border:false" style="text-align: right; padding: 5px 5px 5px; background-color: #e0e0e0;">
        <a class="easyui-linkbutton" data-options="iconCls:'icon_save1'" tag="ok">确认</a>
        <a class="easyui-linkbutton" data-options="iconCls:'icon_undo'" tag="cancel">取消</a>
    </div>
</div>
<script type="text/javascript" src="${ctx}/static/js/sys/org/sysJobChoose_view.js?jsTimer=${jsTimer}"></script>
</body>
</html>