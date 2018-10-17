<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户日志</title>
</head>
<body>

    <div class="block_layout block_form">
        <div class="block_title">
            <h3>组合查询</h3>
            <em><a onclick="javascript:HgUi.hideShowSearch(this);" class="slide_up"></a></em>
        </div>
        <div class="block_content">
            <form id="sysUserLogSearchForm" class="hgform">
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
                        <th>用户名：</th>
                        <td><input name="userName" style="width: 120px;"/></td>
                        <td align="right">操作编码：</td>
                        <td><input name="operCode" style="width: 120px;"/></td>
                    </tr>
                    <tr>
                        <th>操作名称：</th>
                        <td><input name="operName" style="width: 120px;"/></td>
                        <td align="right">URI：</td>
                        <td><input name="reqUri" style="width: 120px;"/></td>
                    </tr>
                    <tr>
                        <th >关键词：</th>
                        <td><input name="keyword" style="width: 120px;"/></td>
                        <td align="right">调用IP：</td>
                        <td><input name="operIp" style="width: 120px;"/></td>
                    </tr>
                    <tr>
                        <th>创建时间：</th>
                        <td colspan=3>
                            <input name="startTime" type="text" style="width: 120px;" class="Wdate" id="userLogStartTime" value=""
                                onClick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'userLogEndTime\',{d:0});}'})">
                                        &nbsp;&nbsp;---&nbsp;&nbsp;
                            <input name="endTime" type="text" style="width: 120px;" class="Wdate" id="userLogEndTime" value=""
                                onClick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'userLogStartTime\',{d:0});}'})">
                        </td>
                    </tr>
                    
                </tbody>


            </table>
            </form>
        </div>
    </div>

    <table singleSelect=true id="sysUserLog_grid"
        fitColumns=true rownumbers="true" pagination="true" toolbar="#sysUserLog_toolbar"
        pageSize="${defaultPageSize}" pageList="${defaultPageList}"
        data-options="url:'${ctx}/sys/sysUserLog/list',title:'用户日志',width:'100%',scrollbarSize:0">
        <thead>
            <tr>
                 <th data-options="field:'userLogId',width:160,hidden:true">主键</th>
                 <th data-options="field:'sysUser.userName',width:80,formatter:HgUtil.userInfoDetail('sysUserLogGrid.reload',null,'sysUser.isDelete')">用户名</th>
                 <th data-options="field:'operCode',width:80">操作编码</th>
                 <th data-options="field:'operName',width:90">操作名称</th>
                 <th data-options="field:'reqUri',width:80">URI</th>
                 <th data-options="field:'operIp',width:80">调用IP</th>
                 <th data-options="field:'key1',width:60">关键词1</th>
                 <th data-options="field:'key2',width:60">关键词2</th>
                 <th data-options="field:'key3',width:60">关键词3</th>
                 <th data-options="field:'operRes',width:50,formatter:HgUtil.fieldFormatterFunc('LOG_RESULT')" align="center">操作结果</th>
                 <th data-options="field:'content',width:120">内容</th>
                 <th data-options="field:'crtTime',width:110,formatter:HgUtil.formatToDateTime">创建时间</th>
            </tr>
        </thead>
    </table>
    <div id="sysUserLog_toolbar" tag=listen_hotkey>
	</div>
	<script type="text/javascript" src="${ctx}/static/js/sys/log/sysUserLog_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>