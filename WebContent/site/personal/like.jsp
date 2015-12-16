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
			Todo:收藏夹
	</div>
	<div class="panel-body">
/////////////
	</div>
</div>