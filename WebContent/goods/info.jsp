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

<div class="container">
<div class="row">
  <div class="col-md-10 col-md-offset-1">
	  <div class="panel panel-info">
		<div class="panel-heading">
	<%
		out.println("==物品详情==");
	%>
		</div>
	<div class="panel-body">
	<div class="row">
	<div class="col-md-5">
	test1
	</div>
	<div class="col-md-7">
	test2
	</div>
	</div>
	</div>
  </div>
</div>

</div>
</div>
	<jsp:include page="../site/footer.jsp" />
</body>
</html>