<%/*
个人信息页，被/personal包含，非自己只显示公开信息
*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="panel panel-info">
	<div class="panel-heading">
		<%
	out.println("个人资料");
%>
	</div>
	<div class="panel-body">
	<form>
	
	 <div class="form-group">
	<div class="input-group">
     <span class="input-group-addon" id="basic-addon1">姓名</span>
     <input type="text" class="form-control" placeholder="Username" value="解涛" aria-describedby="basic-addon1">
	</div>
	</div>
	
		 <div class="form-group">
	<div class="input-group">
     <span class="input-group-addon" id="basic-addon1">邮箱</span>
     <input type="text" class="form-control" placeholder="Username" value="解涛" aria-describedby="basic-addon1">
	</div>
	</div>
	
		 <div class="form-group">
	<div class="input-group">
     <span class="input-group-addon" id="basic-addon1">姓名</span>
     <input type="text" class="form-control" placeholder="Username" value="解涛" aria-describedby="basic-addon1">
	</div>
	</div>
	</form>
	</div>
</div>