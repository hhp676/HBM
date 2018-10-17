<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="h" uri="/HBMCustomTags" %>
<%@ page import="com.hginfo.hbm.core.constants.Constants"%>
<%@ page import="com.hginfo.hbm.fe.core.web.Auths"%>
<%-- <%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %> --%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="defaultPageSize" value="${h:getProfile('defaultPageSize')}" />
<c:set var="defaultPageList" value="${h:getSysProperty('defaultPageList')}" />
<c:set var="jsTimer" value="${h:getJsTimer()}" />
<!--  全局 -->
<script>
//文件最大上传大小
var HG_FILE_MAX_SIZE = 10*1024*1024;
</script>