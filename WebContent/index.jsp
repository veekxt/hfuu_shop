<%@page import="src.dbHandle.UserHandle"%>
<%@page import="org.w3c.dom.UserDataHandler"%>
<%@page import="src.dbHandle.GoodsHandle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.text.SimpleDateFormat,java.sql.*,java.lang.Math,src.tools.*,javax.servlet.http.HttpSession,java.util.*,src.vo.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<jsp:include page="site/head.jsp" />
<title>物品交易-合肥学院-首页</title>
</head>
<body>
	<jsp:include page="site/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="row">
					<div class="col-md-12">
						<div class="list-group">
							<span class="list-group-item list-group-item-info">分类</span> 
							<a href="index.jsp?ceta=0" class="list-group-item"><span class="badge"><!-- 这里写数量，暂时搁置 --></span>全部</a>
							<a href="index.jsp?ceta=2" class="list-group-item"><span class="badge"></span>生活出行</a>
							<a href="index.jsp?ceta=1" class="list-group-item"><span class="badge"></span>书籍</a> 
							<a href="index.jsp?ceta=5" class="list-group-item"><span class="badge"></span>体育运动</a> 
							<a href="index.jsp?ceta=4" class="list-group-item"><span class="badge"></span>电子产品</a>
							<a href="index.jsp?ceta=3" class="list-group-item"><span class="badge"></span>衣物鞋包</a>
							<a href="index.jsp?ceta=6" class="list-group-item"><span class="badge"></span>其他</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="list-group">
				<% 
				GoodsHandle goodHandle=new GoodsHandle();
				UserHandle userHandle =new UserHandle();
			    List <Goods> list=null;
			    %>
			    <%
			    String ceta=request.getParameter("ceta");
			    if(ceta==null || ceta.equals("0")){
					out.println("<span class=\"list-group-item list-group-item-info\">分类-全部</span>");
					list=goodHandle.findAll();
			    }else if(ceta.equals("1")){
			    	out.println("<span class=\"list-group-item list-group-item-info\">分类-书籍</span>");
			    	list=goodHandle.findByCeta(1);
			    }else if(ceta.equals("2")){
			    	out.println("<span class=\"list-group-item list-group-item-info\">分类-生活出行</span>");
			    	list=goodHandle.findByCeta(2);
			    }else if(ceta.equals("3")){
			    	out.println("<span class=\"list-group-item list-group-item-info\">分类-衣物鞋包</span>");
			    	list=goodHandle.findByCeta(3);
			    }else if(ceta.equals("4")){
			    	out.println("<span class=\"list-group-item list-group-item-info\">分类-电子产品</span>");
			    	list=goodHandle.findByCeta(4);
			    }else if(ceta.equals("5")){
			    	out.println("<span class=\"list-group-item list-group-item-info\">分类-体育运动</span>");
			    	list=goodHandle.findByCeta(5);
			    }else if(ceta.equals("6")){
			    	out.println("<span class=\"list-group-item list-group-item-info\">分类-其他</span>");
			    	list=goodHandle.findByCeta(6);
			    }else{
			    	out.println("<span class=\"list-group-item list-group-item-info\">分类-全部</span>");
					list=goodHandle.findAll();
			    }
			      if(list.size()!=0){
			    	for(Goods good:list){
			    	if(good.getProducter_id()==null)continue;
			    	User user = userHandle.findById(good.getProducter_id());
			    	%><div class="list-group-item">
						<div class="row">
							<div class="goods-img col-md-2">
								<img class="img-rounded img-item-goods"
									src="<%=good.getImage()%>" />
							</div>
								<div class="col-md-10">
								<div class="row detail-goods lead">
									<a href="goods/info.jsp?goodsid=<%=good.getId()%>"><%=good.getName()%></a>
								</div>
								<div class="row detail-goods">￥<span class="text-danger"><%=Math.round(good.getPrice()) %></span>
								<span class="detail-goods text-muted">　发布者:<%if(user.getName()!=null){%><%=user.getName() %><%}else{%><%=user.getEmail()%><%}%> </span>
								<span class="detail-goods text-muted">　时间：
                                <%
                                java.util.Date date=good.getCreatDate();
                                SimpleDateFormat myFmt=new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
                                String dateStr =myFmt.format(date);
                                out.print(dateStr);
                                %>
								</span>

								</div>
								
							</div>
						</div>
			    	</div>	  
			    	<%	  
			    	  }
			      }else{%>
			<div class="list-group-item">
			此分类下暂无物品
			</div>
			<%}%>
				</div>
<nav>
  <ul class="pager">
    <li class=""><a class="page-cut-btn" href="#"><span aria-hidden="true"></span> 上一页</a></li>
    　　　　
    <li class=""><a class="page-cut-btn" href="#">下一页 <span aria-hidden="true"></span></a></li>
  </ul>
</nav>
			</div>
		</div>
	</div>
	<jsp:include page="site/footer.jsp" />
</body>
</html>