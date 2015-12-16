<%/*
购物车页面，被/personal.jsp包含，查找所有购物车内物品
*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="src.dbHandle.*,src.vo.*,java.sql.*,java.util.*,java.text.SimpleDateFormat"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//findGoodsByUser
ShopCartHandle shopCartHandle=new ShopCartHandle();
User me =(User)session.getAttribute("loginUser");
UserHandle userHandle=new UserHandle();
List <Goods> list=null;
list=shopCartHandle.findGoodsByUser(me);
%>
<div class="panel panel-info">
	<div class="panel-heading">
			我的购物车
	</div>
	<div class="panel-body">
	<div class="list-group">
	<%
	if(list.size()!=0){
		for(Goods good:list){
	    	if(good.getProducter_id()==null)continue;
	    	User user = userHandle.findById(good.getProducter_id());
	    	%>
	    	<div id="list-goods-<%=good.getId() %>" class="list-group-item">
				<div class="row">
					<div class="col-md-3">
						<img class="img-rounded img-item-goods"
							src="<%=good.getImage()%>" />
					</div>
					<div class="col-md-9">
					<div class="row detail-goods lead">
						<div>
						<a href="goods/info.jsp?goodsid=<%=good.getId()%>"><%=good.getName()%></a>
						<button class="pull-right btn btn-default">
						移除
						</button>
						</div>
					</div>
					<div class="row detail-goods text-muted">发布者:<%if(user.getName()!=null){ %><%=user.getName() %><%}else{%><%=user.getEmail()%><%}%> </div>
					<div class="row detail-goods text-danger">
					时间：
					<%
					java.util.Date date=good.getCreatDate();
					SimpleDateFormat myFmt=new SimpleDateFormat("yyyy年MM月dd日 HH时mm分");
					String dateStr =myFmt.format(date);
					out.print(dateStr);
					%>
					</div>
					</div>
				</div>
	    	</div>
	    	<%}%>
	    	<div>
	    	<button class="pull-right btn btn-default">
			购买全部
			</button>
			</div>
			<%}%>
	    	</div>
	</div>
</div>