<%@page import="src.dbHandle.UserHandle"%>
<%@page import="src.dbHandle.GoodsHandle,src.vo.*,java.util.*,java.text.*"%>
<%/*
物品详情页，包含详情和操作按钮
*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../site/head.jsp" />
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物品详情</title>
</head>
<body>
	<jsp:include page="../site/header.jsp" flush="true" />
	<%
int goodsId=Integer.parseInt(request.getParameter("goodsid"));
	GoodsHandle goodsHandle=new GoodsHandle();
	UserHandle userHandle=new UserHandle();
	Goods good=goodsHandle.findById(goodsId);
	pageContext.setAttribute("good",good);
	 User user=userHandle.findById(good.getProducter_id());
	 pageContext.setAttribute("user",user);
	 int typeId= good.getType_id();
	 String typeName="";
	 switch(typeId){
	 case 0:typeName="其他";
	 break;
	 case 1:typeName="书籍";
	 break;
	 case 2:typeName="生活用品";
	 break;
	 case 3:typeName="体育";
	 break;
	 case 4:typeName="衣装";
	 break;
	 case 6:typeName="电子";
	 break;
	}
	Date date=good.getCreatDate();

	
	SimpleDateFormat myFmt=new SimpleDateFormat("yyyy年MM月dd日 HH时mm分");
	String dateStr =myFmt.format(date);
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
	<img class="info-img" src="<%=good.getImage() %>">
	</div>
	<div class="col-md-7 info-goods">
	<p><h3 class="info-goods-name"></h3>${good.getName()}</p>
	<p><br />类型：<a target="_blank" href="index.jsp?ceta=${good.getType_id()}"><%=typeName %></a><br /><br /></p>
	<p>发布者：<a target="_blank" href="user/personal.jsp?tab=info&userid=1015" >${user.getName()}</a>(联系: ${user.getEmail()})<br /><br /></p>
	<p>发布时间：<%=dateStr %> <br /><br /></p>
	<p>物品说明：<span class="info-goods-content">
	${good.getContent()}
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