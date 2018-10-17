<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>消息详细页面</title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true" >
        <div data-options="region:'center'" style="padding: 10 10 10 20px;">
                <input type="hidden" name="noticeId" value="${sysNotice.id}"/>
                <table class="hgtable" width="100%" style="padding-top: 10px;">
                    <tr>
                    	<td align="right">标题：</td>
                    	<td colspan="3">
                    		<input style="width:518px;" disabled value="${sysNewsInner.newsTitle}">
                    	</td>
                    </tr>
                    <tr>
                    	<td width="20%" align="right">优先级：</td>
                    	<td width="30%">
                    		<select class="easyui-combobox" disabled style="width: 130px;"
                                data-options="
                                   value:'${sysNewsInner.timerLv}',
                                   prompt: '---请选择---',
							data:HgUtil.getDictComboboxData('sysNews_timerLv')">
					     </select>
                    	</td>
                    	<td width="20%" align="right">重要性：</td>
                    	<td width="30%">
                    		<select class="easyui-combobox" disabled style="width: 130px;"
                                data-options="
                                   value:'${sysNewsInner.importantLv}',
                                   prompt: '---请选择---',
						     data:HgUtil.getDictComboboxData('sysNews_importantLv')">
						</select>
                    	</td>
                    </tr>
                    <tr>
                    	<td align="right">消息来源：</td>
                    	<td>
                    		<select class="easyui-combobox" disabled style="width: 130px;"
                                data-options="
                                   value:'${sysNewsInner.sysNews.newsFrom}',
                                   prompt: '---请选择---',
                                   data:HgUtil.getDictComboboxData('sysNews_from')">
                              </select>
                    	</td>
                    	<td align="right">接收时间：</td>
                    	<td>
                    	    <input disabled style="width: 130px;"
                    	         value='<fmt:formatDate value="${sysNewsInner.crtTime}" pattern="yyyy-MM-dd HH:mm:ss"/>'>
                    	</td>
                    </tr>
                    <tr>
                    	<td align="right">消息正文：</td>
                    	<td colspan="3">
                   	         ${sysNewsInner.newsContent}
                    	</td>
                    </tr>
                </table>
        </div>
        <div data-options="region:'south',border:false" style="text-align: right; padding: 5px 5px 5px; background-color: #e0e0e0;">
            <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" 
               onclick="sysNewsInnerDatagrid.closeSysNewsInnerDetailWin();">关闭</a>
        </div>
    </div>
    <script type="text/javascript">
	    sysNewsInnerDatagrid.closeSysNewsInnerDetailWin = function(){
	        $('#sysNewsInnerDetailWin').window('close');
	        sysNewsInnerDatagrid.grid.datagrid("reload");
	    }
    </script>
</body>

</html>
