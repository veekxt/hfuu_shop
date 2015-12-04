<!-- //javaBean测试，使用jsp:useBean -->
<!-- //输出“谢涛，xt方法”-->

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java"%>
<jsp:useBean id='tmp' scope='page' class='src.test.main' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
String s=tmp.xt();
out.print("jsp:useBean Test Success<br />");
%>
	<%=s%>
</body>
</html>