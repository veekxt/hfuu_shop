<%/*
购物车页面，被/personal.jsp包含，查找所有未审核商品（status=1）
*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="src.dbHandle.*,src.vo.*,java.sql.*,java.util.*,java.text.SimpleDateFormat"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="panel panel-info">
	<div class="panel-heading">
			ToDo：列出所有购物车物品和“购买”按钮
	</div>
	<div class="panel-body">
			///////
	</div>
</div>