<%/*
商品发布页，被/personal.jsp包含
*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isThreadSafe="false"%>
<%
    String path = request.getContextPath();
	String servletPath=path+"/GoodsCheckServlet";
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="panel panel-info">
	<div class="panel-heading">
		<%
	out.println("发布新物品");
%>
	</div>
	<div class="panel-body">
    todo：发布历史
	</div>
</div>