<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href=" <%=basePath%>">
<title>404</title>
</head>
<body>
	<h2>合肥学院物品交易<br />页面未找到<br />检查你的URL</h2>
</body>
</html>