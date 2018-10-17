<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统信息页面</title>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
</head>
<body>

    <c:set var="styles" value="${fn:split('bg-blue,bg-darkorange,bg-palegreen,bg-warning',',')}" scope="page"></c:set>
    <div class="row" style="padding:10px">
        <div class="col-xs-12 col-md-12" >
          <c:forEach items="${server}" var="item" varStatus="status">
            <div class="well with-header ">
                <div class="header ${styles[status['index']%4]}">${item.key}</div>
                <table class="table table-hover">
                    <c:choose>
                    <c:when test="${item.value.getClass().name eq 'java.util.ArrayList'}">
                        <thead class="bordered-darkorange">
                        <c:forEach items="${item.value}" var="subItem" varStatus="subStatus">
                           <c:if test="${subStatus.index eq 0}">
                           <tr>
                               <th width="60">#</th>
                               <c:forEach items="${subItem}" var="subItem2" varStatus="subStatus2">
                                   <td>${subItem2.key}</td>
                               </c:forEach>
                            </tr>
                            </c:if>
                           </c:forEach>
	                    </thead>
	                    <tbody>
	                       <c:forEach items="${item.value}" var="subItem" varStatus="subStatus">
	                       <tr>
	                           <c:forEach items="${subItem}" var="subItem2" varStatus="subStatus2">
	                               <c:if test="${subStatus2.index eq 0}">
	                                   <td>${subStatus.index +1}</td>
	                               </c:if>
	                               <td>${subItem2.value}</td>
	                           </c:forEach>
	                        </tr>
	                       </c:forEach>
	                    </tbody>
                    </c:when>
                    <c:otherwise>
                        <thead class="bordered-darkorange">
                        <tr>
                            <th width="60">#</th>
                            <th width="200">键</th>
                            <th>值</th>
                        </tr>
                        </thead>
                        <tbody>
                           <c:forEach items="${item.value}" var="subItem" varStatus="subStatus">
                           <tr>
                                <td>${subStatus.index +1}</td>
                                <td>${subItem.key}</td>
                                <td>${subItem.value}</td>
                            </tr>
                           </c:forEach>
                        </tbody>
                    </c:otherwise>
                    </c:choose>
                    
                </table>

            </div>
          </c:forEach>
        </div>
    </div>
</body>

</html>
