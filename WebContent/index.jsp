<%@page import="src.dbHandle.UserHandle"%>
<%@page import="org.w3c.dom.UserDataHandler"%>
<%@page import="src.dbHandle.GoodsHandle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.sql.*,src.tools.*,javax.servlet.http.HttpSession,java.util.*,src.vo.*"%>
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
							<a href="#" class="list-group-item list-group-item-info"> 分类
							</a> <a href="?ceta=0" class="list-group-item"><span
								class="badge">322</span>全部</a> <a href="#" class="list-group-item"><span
								class="badge">14</span>生活出行</a> <a href="#" class="list-group-item"><span
								class="badge">27</span>书籍</a> <a href="#" class="list-group-item"><span
								class="badge">3</span>体育运动</a> <a href="#" class="list-group-item"><span
								class="badge">0</span>电子产品</a> <a href="#" class="list-group-item"><span
								class="badge">51</span>衣物鞋包</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-info">全部分类-最新
					</a>
					
				<% 
				GoodsHandle goods=new GoodsHandle();
				UserHandle users =new UserHandle();
			      List <Goods> list=goods.findAll();
				 // System.out.println(list.size());
			      if(list.size()!=0){
			    	//  System.out.println("s");
			    	  for(Goods good:list){
			    		
			    	
			    	User user = users.findById(good.getProducter_id());
			      
			        
			    /*   String name=good.getName();
			      String image=good.getImage();
			    java.util.Date date=good.getCreatDate();
			   int year=  date.getYear();
			     int month=date.getMonth();
			     int day=date.getDay();
			     int hour=date.getHours();
			     int minute =date.getMinutes(); */
			    	%><div class="list-group-item">
						<div class="row">
							<div class="col-md-3">
								<img class="img-rounded img-item-goods"
									src="<%=good.getImage()%>" />
							</div>
								<div class="col-md-9">
								<div class="row detail-goods lead">
									<a><%=good.getName()%></a>
								</div>
								<div class="row detail-goods text-muted">发布者:<%if(user.getName()!=null){ %><%=user.getName() %><%}else{%><%=user.getEmail()%><%}%> </div>
								<div class="row detail-goods text-danger">时间：<%=good.getCreatDate()%></div>
							</div>
						</div>
			    	</div>
			    		  
			    	<%	  
			    	  }
			    	  
			      }
			%>
			
					<!-- 每个商品占一个此div -->
					<div class="list-group-item">
						<div class="row">
							<div class="col-md-3">
								<img class="img-rounded img-item-goods"
									src="static/image/ac_24.png" />
							</div>
							<div class="col-md-9">
								<div class="row detail-goods lead">
									<a>全新野生AC娘</a>
								</div>
								<div class="row detail-goods text-muted">发布者: 涛哥</div>
								<div class="row detail-goods text-danger">时间：2015-08-23
									04:23</div>
							</div>
						</div>
					</div>
					<!-- 每个商品占一个此div -->
			
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="site/footer.jsp" />
</body>
</html>