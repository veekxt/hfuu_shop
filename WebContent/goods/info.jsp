<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../site/head.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物品详情</title>
</head>
<body>
	<jsp:include page="../site/header.jsp" flush="true" />
	<%
int goodsId=Integer.parseInt(request.getParameter("goodsid"));
%>
	<%=goodsId%>
	<jsp:include page="../site/footer.jsp" />
</body>
</html>