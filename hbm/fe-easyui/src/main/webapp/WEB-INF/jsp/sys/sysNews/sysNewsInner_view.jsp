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
    <div region="center" title="系统消息">
     <div id="sysNewsInner_toolbar" tag=listen_hotkey>
          <div class="hgGridSearchBar" style="height: 60px; width: 100%; display: none;" tag="queryDiv">
	          <form id="sysNewsInnerSearchForm" class="hgform">
	            <table class="hgtable" width="100%">
	                <tr>
	                    <td align="right">消息标题：</td>
	                    <td>
	                        <input name="bo.newsTitleLike" style="width: 130px;">
	                    </td>
	                    <td align="right">是否已阅：</td>
	                    <td>
	                        <select id="newsStatus" name="newsStatus" class="easyui-combobox" 
                               panelHeight='auto' editable="false" style="width: 130px;"
                               data-options="
                                    prompt: '---请选择---',
                                    data:HgUtil.getDictComboboxData('trueOrFalse')">
                             </select>
	                    </td>
	                    <td align="right">接收时间：</td>
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
	                   <td align="right">消息来源：</td>
                         <td>
                             <select name="sysNews.newsFrom" class="easyui-combobox" 
                                 panelHeight='auto' editable="false" style="width: 130px;"
                                 data-options="
                                 data:HgUtil.getDictComboboxData('sysNews_from'),
                                 prompt: '---请选择---'">
                             </select>
                         </td>
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
                         <td>
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
                                 iconCls="icon_auto_colorful__editor" plain="true" tag="edit">查看</a></td>
               <td><a href="javascript:void(0)" class="easyui-linkbutton"
                                 iconCls="icon_delete" plain="true" tag="del">删除</a></td>
               <td><div class="datagrid-btn-separator"></div></td>
               <td><a href="javascript:void(0)" class="easyui-linkbutton"
                            iconCls="icon-search" plain="true" tag="expandQuery">展开查询</a></td>
              </tr>
          </table>
        </div>
        <table singleSelect=true fit=true id="sysNewsInner_datagrid"
               fitColumns=true toolbar="#sysNewsInner_toolbar" pagination="true"
               pageSize="${defaultPageSize}" pageList="${defaultPageList}"
               data-options="
                    url:'${ctx}/sys/sysNewsInner/list',
                    border:false,
                    fitColumns:true,
                    striped:true,
                    rownumbers:true">
            <thead>
            <tr>
                <th data-options="field:'sysNews.newsFrom',width:50,
                    formatter:HgUtil.fieldFormatterFunc('sysNews_from')" align="center"><b>消息来源</b></th>
                <th data-options="field:'newsTitle',width:150"><b>消息标题</b></th>
                <th data-options="field:'timerLv',width:50,
                    formatter:HgUtil.fieldFormatterFunc('sysNews_timerLv')" align="center"><b>优先级</b></th>
                <th data-options="field:'importantLv',width:50,
                    formatter:HgUtil.fieldFormatterFunc('sysNews_importantLv')" align="center"><b>重要性</b></th>
                <th data-options="field:'newsStatusStr',width:50" align="center"><b>消息状态</b></th>
                <th data-options="field:'crtTime',width:80,
                    formatter:HgUtil.formatToDateTime" align="center"><b>消息接收时间</b></th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<script type="text/javascript" src="${ctx}/static/js/sys/sysNews/sysNewsInner_view.js?jsTimer=${jsTimer}"></script>
</body>

</html>