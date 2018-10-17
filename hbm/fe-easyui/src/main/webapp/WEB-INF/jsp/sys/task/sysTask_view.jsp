<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="easyui-layout" fit=true>
    <div region="center" title="待办任务">
        <div id="sysTask_toolbar" tag=listen_hotkey>
            <form id="sysTaskSearchForm" class="hgform">
	            <table class="hgtable" width="100%">
	                <tr>
	                    <td align="right">任务类型：</td>
	                    <td>
	                        <select name="taskTypeId" class="easyui-combobox" 
	                            panelHeight='auto' editable="false" style="width: 130px;"
	                            data-options="
	                            url: 'sys/sysTaskType/getSysTaskTypeList',
	                            valueField: 'taskTypeId', textField: 'taskTypeName', 
	                            prompt: '---请选择---'">
	                        </select>
	                    </td>
	                    <td align="right">任务名称：</td>
	                    <td>
	                        <input name="bo.taskNameLike" style="width: 130px;">
	                    </td>
	                    <td align="right">接收时间：</td>
	                    <td>
	                        <input name="bo.taskCrtStartTime" class="Wdate"
                                   onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                   style="width: 130px;" />
                                                                           至
                              <input name="bo.taskCrtEndTime" class="Wdate"
                                   onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                   style="width: 130px;" />
	                    </td>
	                    <td>
	                        <a class="easyui-linkbutton" iconCls="icon-search" tag="search">查询</a>
	                        <a class="easyui-linkbutton" iconCls="icon_clear" tag="clear">清空</a>
	                    </td>
	                </tr>
	            </table>
            </form>
        </div>
        <table singleSelect=true fit=true id="sysTask_datagrid"
               fitColumns=true toolbar="#sysTask_toolbar" pagination="true"
               pageSize="${defaultPageSize}" pageList="${defaultPageList}"
               data-options="
	               url:'${ctx}/sys/sysTask/getDoTasklist',
	               border:false,
                    fitColumns:true,
                    striped:true,
                    rownumbers:true,
                    rowStyler:sysTaskDatagrid.rowStyler">
            <thead>
            <tr>
                <th data-options="field:'sysTaskType.taskTypeName',width:50" align="center"><b>任务类型</b></th>
                <th data-options="field:'taskName',width:150"><b>任务名称</b></th>
                <th data-options="field:'taskCrtTime',
                    formatter:HgUtil.formatToDateTime,width:50" align="center"><b>接收时间</b></th>
                <th data-options="field:'taskEndTime',
                    formatter:HgUtil.formatToDateTime,width:50" align="center"><b>办理时限</b></th>
                <th data-options="field:'taskLaterTime',
                    formatter:HgUtil.formatToDateTime,width:50" align="center"><b>延后时限</b></th>
                <th data-options="field:'taskStatusStr',width:50" align="center"><b>任务状态</b></th>
                <th data-options="field:'descr',width:150"><b>描述</b></th>
                <th data-options="field:'operate',width:100,
                    formatter:sysTaskDatagrid.gridOperateFormatter" align="center"><b>操作</b></th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<script type="text/javascript">
     var userId ='${userId}';
</script>
<script type="text/javascript" src="${ctx}/static/js/sys/task/sysTask_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>