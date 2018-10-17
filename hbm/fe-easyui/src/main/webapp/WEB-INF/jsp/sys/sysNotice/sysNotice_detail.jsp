<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>通知公告详细页面</title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true" id="sysNoticeDetail_layout">
        <div data-options="region:'center'" style="padding: 10 10 10 20px;">
            <form id="sysNoticeDetail_form" class="hgform">
                <input type="hidden" name="noticeId" value="${sysNotice.id}"/>
                <input type="hidden" id="content" name="content"/>
                <table class="hgtable" width="100%" height="100%" style="padding-top: 10px;">
                    <tr>
                    	<td align="right">标题：</td>
                    	<td colspan="3">
                    		<input name="title" style="width:518px;" value="${sysNotice.title}"><br/>
                    	</td>
                    </tr>
                    <tr>
                    	<td width="20%" align="right">优先级：</td>
                    	<td width="30%">
                    		<select id="timerLv" name="timerLv" class="easyui-combobox" 
                                panelHeight='auto' editable="false" style="width: 130px;"
                                data-options="
                                   value:'${sysNotice.timerLv}',
		                         prompt: '---请选择---',
							data:HgUtil.getDictComboboxData('sysNews_timerLv'),
							onChange:sysNoticeDetail.timerLvOnChange">
					     </select><br/>
                    	</td>
                    	<td width="20%" align="right">重要性：</td>
                    	<td width="30%">
                    		<select id="importantLv" name="importantLv" class="easyui-combobox" 
                                panelHeight='auto' editable="false" style="width: 130px;"
                                data-options="
                                   value:'${sysNotice.importantLv}',
		                         prompt: '---请选择---',
						     data:HgUtil.getDictComboboxData('sysNews_importantLv'),
						     onChange:sysNoticeDetail.importantLvOnChange">
						</select><br/>
                    	</td>
                    </tr>
                    <tr>
                    	<td align="right">排序值：</td>
                    	<td >
                    		<input name="sortNo" value="${sysNotice.sortNo}"><br/>
                    	</td>
                    	<td align="right">不可更改：</td>
                    	<td >
                    		<select id="isFinal" name="isFinal" class="easyui-combobox" 
                                panelHeight='auto' editable="false" style="width: 130px;"
                                data-options="
                                   value:'${sysNotice.isFinal}',
                                   prompt: '---请选择---',
                                   data:HgUtil.getDictComboboxData('trueOrFalse'),
                                   onChange:sysNoticeDetail.isFinalOnChange">
                              </select><br/>
                    	</td>
                    </tr>
                    <tr>
                    	<td align="right">自动发布：</td>
                    	<td>
                    		<select id="autoPub" name="autoPub" class="easyui-combobox" 
                                panelHeight='auto' editable="false" style="width: 130px;"
                                data-options="
                                   value:'${sysNotice.autoPub}',
		                         prompt: '---请选择---',
							data:HgUtil.getDictComboboxData('trueOrFalse'),
							onChange:sysNoticeDetail.autoPubOnChange">
				           </select><br/>
                    	</td>
                    	<td align="right">发布渠道：</td>
                    	<td>
                    		<select name="newsTypeId" class="easyui-combobox" 
                                 panelHeight='auto' editable="false" style="width: 130px;"
                                 data-options="
                                   value:'${sysNotice.newsTypeId}',
	                              url: 'sys/sysNewsType/getSysNewsTypeList',
	                              valueField: 'newsTypeId', textField: 'newsTypeName', 
	                              prompt: '---请选择---',
	                              onChange:sysNoticeDetail.newsTypeIdOnChange">
                             </select><br/>
                    	</td>
                    </tr>
                    <tr>
                    	<td align="right">开始时间：</td>
                    	<td>
                    		<input name="startTime" type="text" class="Wdate" style="width: 130px;" 
							onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H:%m:%s'})"
							value="<fmt:formatDate value="${sysNotice.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" /><br/>
                    	</td>
                    	<td align="right">结束时间：</td>
                    	<td>
                    		<input name="endTime" type="text" class="Wdate" style="width: 130px;" 
                                   onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H:%m:%s'})"
                                   value="<fmt:formatDate value="${sysNotice.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"/><br/>
                    	</td>
                    </tr>
                    <tr>
                    	<td colspan="4">
                    		<script id="sysNoticeContent" type="text/plain">${sysNotice.content}</script>
                    	</td>
                    </tr>
                </table>
            </form>
        </div>
        <div data-options="region:'south',border:false" style="text-align: right; padding: 5px 5px 5px; background-color: #e0e0e0;">
            <c:if test="${mode == 'add'}">
	            <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" 
	               onclick="sysNoticeDetail.save('save');">保存</a>
	            <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" 
	               onclick="sysNoticeDetail.save('pub');">发布</a>
            </c:if>
            <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" 
               onclick="sysNoticeDetail.closeWin();">关闭</a>
        </div>
    </div>

    <script type="text/javascript">
        var sysNoticeDetail = {};
        sysNoticeDetail.mode = "${mode}";
    </script>
    <script type="text/javascript" src="${ctx}/static/js/sys/sysNotice/sysNotice_detail.js?jsTimer=${jsTimer}"></script>
</body>

</html>
