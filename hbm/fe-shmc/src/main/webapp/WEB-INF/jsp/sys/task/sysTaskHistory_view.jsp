<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>任务办理记录</title>
</head>
<body>
    <div class="block_layout block_form">
        <div class="block_title">
            <h3>组合查询</h3>
            <em><a onclick="javascript:HgUi.hideShowSearch(this);" class="slide_up"></a></em>
        </div>
        <div class="block_content">
            <form id="sysTaskHistorySearchForm" class="hgform">
                <table cellpadding="0" cellspacing="0" class="table_form">
                <!--普通表单填写表格使用table_form-->
                <colgroup>
                    <col style="width: 120px;" />
                    <col style="width: 240px;" />
                    <col style="width: 120px;" />
                    <col />
                </colgroup>
                <!--表单表格宽度控制使用colgroup，每个col对应下方的一个td，或者th，上下是对齐的-->
                <thead></thead>
                <!--表头-->
                <tbody>
                    <tr>
                        <th align="right">任务类型：</th>
                        <td>
                            <select name="taskTypeId" class="easyui-combobox" 
                                panelHeight='auto' editable="false" style="width: 130px;"
                                data-options="
                                url: 'sys/sysTaskType/getSysTaskTypeList',
                                valueField: 'taskTypeId', textField: 'taskTypeName', 
                                prompt: '---请选择---'">
                            </select>
                        </td>
                        <th align="right">任务名称：</th>
                        <td>
                            <input name="bo.taskNameLike" style="width: 130px;">
                        </td>
                    </tr>
                 </tbody>
                <tfoot>
                    <!--表尾，主要放表单按钮-->
                    <tr>
                        <td></td>
                        <td colspan="3">
                            <a href="javascript:void(0);" class="a_blue" tag="search"><em>查询</em></a>
                            <a href="javascript:void(0);" class="a_green" tag="clear"><em>重置</em></a>
                        </td>
                    </tr>
                </tfoot>
                </table>
            </form>
        </div>
    </div>
    <div class="easyui-layout" id="sysUser_layout" style="height: 600px;width:100%;">
        <div data-options="region:'center',border:false" title="历史任务" style="padding: 0px;">
	        <table singleSelect=true fit=true id="sysTaskHistory_datagrid"
	               fitColumns=true pagination="true"
	               pageSize="${defaultPageSize}" pageList="${defaultPageList}"
	               data-options="
		               url:'${ctx}/sys/sysTask/getHistoryTasklist',
		               rownumbers:true">
	            <thead>
	            <tr>
	                <th data-options="field:'sysTaskType.taskTypeName',width:150" align="center"><b>任务类型</b></th>
	                <th data-options="field:'taskName',width:150"><b>任务名称</b></th>
	                <th data-options="field:'taskCrtTime',width:150" align="center"><b>添加时间</b></th>
	                <th data-options="field:'taskEndTime',width:150" align="center"><b>办理时限</b></th>
	                <th data-options="field:'taskStatusStr',width:150" align="center"><b>任务状态</b></th>
	                <th data-options="field:'descr',width:150"><b>描述</b></th>
	                <th data-options="field:'operate',width:150,
	                    formatter:sysTaskHistoryDatagrid.gridOperateFormatter" align="center"><b>操作</b></th>
	            </tr>
	            </thead>
	        </table>
        </div>
	    <div region="south" style="height: 180px;" title="任务办理日志">
	        <table id="sysTaskLog_datagrid" fitColumns=true fit=true
	               pagination="true" pageSize="${defaultPageSize}" pageList="${defaultPageList}"
	               data-options="
	                url:'${ctx}/sys/sysTask/getSysTaskLogList',
	                queryParams:{taskId:'0'},
	                rownumbers:true">
	            <thead>
	            <tr>
	                <th data-options="field:'taskHandleTypeStr',width:150" align="center"><b>处理类型</b></th>
	                <th data-options="field:'taskHandleTime',
	                    formatter:HgUtil.formatToDateTime,width:150" align="center"><b>处理时间</b></th>
	                <th data-options="field:'descr',width:450"><b>描述</b></th>
	                <!-- formatter:HgUtil.formatStrInLength, -->
	            </tr>
	            </thead>
	        </table>
	    </div>
    </div>
<script type="text/javascript" src="${ctx}/static/js/sys/task/sysTaskHistory_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>