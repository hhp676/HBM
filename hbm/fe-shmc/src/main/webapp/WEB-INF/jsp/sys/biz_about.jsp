<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>关于信息</title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true" id="biz_about_layout">
        <div data-options="region:'center'" style="padding: 10 10 10 20px;">
                <table class="hgtable  table_form" cellpadding="0" cellspacing="0">
                    <tr >
                        <th width="100px;" >创建时间：</th>
                        <td width="250px;" id="crtTime">
                        	<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${biz.crtTime}" />
                        </td>
                    </tr>
                    <tr >
                        <th >创建人：</th>
                        <td id="crtUser">
                        	${h:getUserNameByID(biz.crtUserId)}
                        </td>
                    </tr>
                    <tr >
                        <th >修改时间：</th>
                        <td id="updTime">
                        	<c:if test="${biz.crtTime != biz.updTime}">
                        		<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${biz.updTime}" />
                        	</c:if>
                        </td>
                    </tr>   
                    <tr >
                        <th >修改人：</th>
                        <td id="updUser">
                        	<c:if test="${biz.crtTime != biz.updTime}">
                        		${h:getUserNameByID(biz.updUserId)}
                        	</c:if>
                        	
                        </td>
                    </tr>
                    <tr >
                        <th >是否可修改：</th>
                        <td id="isFinal">
                        	${biz.isFinal=='0'?'是':'否'}
                        </td>
                    </tr>
                </table>
        </div>
    </div>
</body>

</html>
