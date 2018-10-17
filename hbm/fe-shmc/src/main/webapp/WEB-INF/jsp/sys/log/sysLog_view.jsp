<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统日志</title>
</head>
<body>
    
    <div class="block_layout block_form">
        <div class="block_title">
            <h3>组合查询</h3>
            <em><a onclick="javascript:HgUi.hideShowSearch(this);" class="slide_up"></a></em>
        </div>
        <div class="block_content">
            <form id="sysLogSearchForm" class="hgform">
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
                <tfoot>
                    <!--表尾，主要放表单按钮-->
                    <tr>
                        <td></td>
                        <td colspan="3">
                            <a href="javascript:void(0);" class="a_blue" tag="submit"><em>查询</em></a>
                            <a href="javascript:void(0);" class="a_green" tag="clear"><em>重置</em></a>
                        </td>
                    </tr>

                </tfoot>
                <tbody>
                    <!--表内容，th是蓝色字体，主要放字段名，td为字段内容-->
                    <tr>
                        <th>关键词：</th>
                        <td><input name="keyword" style="width: 120px;"></td>
                        <td align="right">日志类型：</td>
                        <td><input class="easyui-combobox" id="logType"  name="logType" style="width: 120px;" LOG_TYPE></td>
                    </tr>
                    <tr>
                        <th>创建时间：</th>
                        <td colspan=3>
                            <input name="startTime" type="text" style="width: 120px;" class="Wdate" id="startTime" value=""
                                        onClick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endTime\',{d:0});}'})">
                                        &nbsp;&nbsp;---&nbsp;&nbsp;
                            <input name="endTime" type="text" style="width: 120px;" class="Wdate" id="endTime" value=""
                                onClick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startTime\',{d:0});}'})">
                        </td>
                    </tr>
                    
                </tbody>


            </table>
            </form>
        </div>
    </div>

    <table singleSelect=true  id="sysLog_grid"
        fitColumns=true rownumbers="true" pagination="true" 
        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
        data-options="url:'${ctx}/sys/sysLog/list',title:'系统日志',width:'100%',scrollbarSize:0">
        <thead>
            <tr>
                 <th data-options="field:'logId',width:160,hidden:true">主键</th>
                 <th data-options="field:'tenantId',hidden:true,width:100">租户ID</th>
                 <th data-options="field:'logType',width:100,formatter:function(value){return HgUtil.getDictItemName('LOG_TYPE',value);}">类型</th>
                 <th data-options="field:'logLevel',width:80,hidden:true">日志级别</th>
                 <th data-options="field:'key1',width:80">关键词1</th>
                 <th data-options="field:'key2',width:80">关键词2</th>
                 <th data-options="field:'key3',width:80">关键词3</th>
                 <th data-options="field:'key4',width:80">关键词4</th>
                 <th data-options="field:'key5',width:80">关键词5</th>
                 <th data-options="field:'content',width:100">内容</th>
                 <th data-options="field:'crtUser.userName',width:80">操作人</th>
                 <th data-options="field:'crtTime',width:80,formatter:HgUtil.formatToDate">创建时间</th>
            </tr>
        </thead>
    </table>
	<script type="text/javascript" src="${ctx}/static/js/sys/log/sysLog_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>