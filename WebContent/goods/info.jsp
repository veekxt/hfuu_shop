<%/*
物品详情页，包含详情和操作按钮
*/%>
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
		out.println("<span style=\"text-align:center;font-size:16px;\" class=\"center-block\">物品详情</span>");
	%>
		</div>
	<div class="panel-body">
	<div class="row">
	<div class="col-md-5">
	<img class="info-img" src="../static/image/ac_24.png">
	</div>
	<div class="col-md-7 info-goods">
	<p><h3 class="info-goods-name">9成新野生AC娘</h3></p>
	<p><br />类型：<a target="_blank" href="../index.jsp?ceta=1">书籍</a><br /><br /></p>
	<p>发布者：<a target="_blank" href="../user/personal.jsp?tab=info&userid=1015" >涛哥</a>(联系: 15256925578)<br /><br /></p>
	<p>发布时间：2014-02-13<br /><br /></p>
	<p>物品说明：<span class="info-goods-content">
	这是说明
	更多文字测试，AC娘是由童年面包(TNMB)论坛中sasa酱创建的，同期创建了TD娘。两个人物为姐妹关系，AC娘是姐姐，TD娘是妹妹，同时都与四次君为好友关系。人物设定上，AC娘代表的是ACFUN，TD娘代表的是童年面包(TNMB)论坛。四次君应该代表ACFUN百度贴吧。同时AC娘是A社大家族的大公主，哥哥是 A总（奥飞动漫拟人形象，ACFUN是奥飞动漫的兄弟公司，奥飞动漫董事长蔡东青持ACFUN母公司39.51%股权）
	</span></p>
	</div>
	</div>
	<hr />
	<div class="row">
	<div class="col-md-4">
	<button type="button" class="center-block btn btn-info">收藏此物品</button>
	</div>
	<div class="col-md-4">
	<button type="button" class="center-block btn btn-info">加入购物车</button>
	</div>
	<div class="col-md-4">
	<button type="button" class="center-block btn btn-info">立刻购买</button>
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