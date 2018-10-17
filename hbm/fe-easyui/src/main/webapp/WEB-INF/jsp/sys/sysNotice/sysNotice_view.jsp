<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="easyui-layout" fit=true id="sysNoticeLayOut">
    <div region="center" style="width: 680px;" title="通知公告">
        <div id="sysNotice_toolbar" tag=listen_hotkey>
          <div class="hgGridSearchBar" style="height: 60px; width: 100%; display: none;" tag="queryDiv">
	          <form id="sysNoticeSearchForm" class="hgform">
	              <table class="hgtable" width="100%">
                     <tr>
                         <td align="right">公告标题：</td>
                         <td>
                              <input name="bo.titleLike">
                         </td>
                         <td align="right">公告正文：</td>
                         <td>
                             <input name="bo.contentLike" style="width: 130px;">
                         </td>
                         <td align="right">已发布：</td>
                         <td>
                             <select id="noticeStatus" name="noticeStatus" class="easyui-combobox" 
                               panelHeight='auto' editable="false" style="width: 130px;"
                               data-options="
                                    prompt: '---请选择---',
                                    data:HgUtil.getDictComboboxData('trueOrFalse')">
                             </select>
                         </td>
                         <td align="right">有效时间：</td>
                         <td>
                              <input name="bo.queryStartTime"
                                   type="text" class="Wdate"
                                   onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                   value="" style="width: 130px;" />
                                                                           至
                              <input name="bo.queryEndTime"
                                   type="text" class="Wdate"
                                   onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                   value="" style="width: 130px;" />
                         </td>
                     </tr>
                     <tr>
                         <td align="right">优先级：</td>
                         <td>
                              <select id="timerLv" name="timerLv" class="easyui-combobox" 
                                panelHeight='auto' editable="false" style="width: 130px;"
                                data-options="
                                     prompt: '---请选择---',
                                     data:HgUtil.getDictComboboxData('sysNews_timerLv')">
                              </select>
                         </td>
                         <td align="right">重要性：</td>
                         <td>
                             <select id="importantLv" name="importantLv" class="easyui-combobox" 
                                panelHeight='auto' editable="false" style="width: 130px;"
                                data-options="
                                     prompt: '---请选择---',
                                     data:HgUtil.getDictComboboxData('sysNews_importantLv')">
                              </select><br/>
                         </td>
                         <td align="right">发布渠道：</td>
                         <td>
                             <select name="newsTypeId" class="easyui-combobox" 
                                 panelHeight='auto' editable="false" style="width: 130px;"
                                 data-options="
                                      url: 'sys/sysNewsType/getSysNewsTypeList',
                                      valueField: 'newsTypeId', textField: 'newsTypeName', 
                                      prompt: '---请选择---'">
                             </select>
                         </td>
                         <td colspan="2" align="center">
                             <a class="easyui-linkbutton" iconCls="icon-search" tag="search">查询</a>
                             <a class="easyui-linkbutton" iconCls="icon_clear" tag="clear">清空</a>
                         </td>
                     </tr>
                 </table>
	          </form>
	     </div>
          <table>
              <tr>
               <td><a href="javascript:void(0)" class="easyui-linkbutton"
                                   iconCls="icon_add1" plain="true" tag="add">新建</a></td>
               <td><a href="javascript:void(0)" class="easyui-linkbutton"
                                 iconCls="icon_auto_colorful__editor" plain="true" tag="edit">修改</a></td>
               <td><a href="javascript:void(0)" class="easyui-linkbutton"
                                 iconCls="icon_auto_colorful__editor" plain="true"
                                 onclick="sysNoticeDatagrid.pub('1');">发布</a></td>
               <td><a href="javascript:void(0)" class="easyui-linkbutton"
                                 iconCls="icon_auto_colorful__editor" plain="true"
                                 onclick="sysNoticeDatagrid.pub('0');">取消发布</a></td>
               <td><a href="javascript:void(0)" class="easyui-linkbutton"
                                 iconCls="icon_delete" plain="true" tag="del">删除</a></td>
               <td><div class="datagrid-btn-separator"></div></td>
               <td><a href="javascript:void(0)" class="easyui-linkbutton"
                            iconCls="icon-search" plain="true" tag="expandQuery">展开查询</a></td>
              </tr>
          </table>
        </div>
        <table singleSelect=true fit=true id="sysNotice_datagrid"
               fitColumns=true toolbar="#sysNotice_toolbar" pagination="true"
               pageSize="${defaultPageSize}" pageList="${defaultPageList}"
               data-options="
                    url:'${ctx}/sys/sysNotice/list',
                    border:false,
                    fitColumns:true,
                    striped:true,
                    rownumbers:true">
            <thead>
            <tr>
                <th data-options="field:'sortNo',width:30" align="center"><b>排序值</b></th>
                <th data-options="field:'title',width:150"><b>公告标题</b></th>
                <th data-options="field:'sysNewsType.newsTypeName',width:30" align="center"><b>通知方式</b></th>
                <th data-options="field:'timerLv',width:30,
                    formatter:HgUtil.fieldFormatterFunc('sysNews_timerLv')" align="center"><b>优先级</b></th>
                <th data-options="field:'importantLv',width:30,
                    formatter:HgUtil.fieldFormatterFunc('sysNews_importantLv')" align="center"><b>重要性</b></th>
                <th data-options="field:'startTime',width:80,
                    formatter:HgUtil.formatToDateTime" align="center"><b>开始时间</b></th>
                <th data-options="field:'endTime',width:80,
                    formatter:HgUtil.formatToDateTime" align="center"><b>结束时间</b></th>
                <th data-options="field:'noticeStatusStr',width:30" align="center"><b>状态</b></th>
                <th data-options="field:'autoPub',width:30,
                    formatter:HgUtil.fieldFormatterFunc('trueOrFalse')" align="center"><b>自动发布</b></th>
                <th data-options="field:'isFinal',width:30,
                    formatter:HgUtil.fieldFormatterFunc('trueOrFalse')" align="center"><b>不可修改</b></th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<script type="text/javascript" src="${ctx}/static/js/sys/sysNotice/sysNotice_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>