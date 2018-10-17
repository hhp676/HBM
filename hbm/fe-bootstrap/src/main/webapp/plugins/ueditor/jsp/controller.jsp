<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.hginfo.hbm.fe.core.ueditor.ActionEnter"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	/*将文件上传的后台方法重写,定义可以上传到ftp yyzh */
    request.setCharacterEncoding( "utf-8" );
	response.setHeader("Content-Type" , "text/html");
	
	String rootPath = application.getRealPath( "/" );
	
	out.write( new ActionEnter( request, rootPath ).exec() );
	
%>