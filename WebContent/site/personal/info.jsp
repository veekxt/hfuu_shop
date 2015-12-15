<%/*
个人信息页，被/personal包含，非自己只显示公开信息
*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.text.SimpleDateFormat,java.sql.*,src.dbHandle.*,src.tools.*,javax.servlet.http.HttpSession,java.util.*,src.vo.*"%>

<%
UserHandle userHandle=new UserHandle();
User user=userHandle.findById(Integer.parseInt(request.getParameter("userid")));
Boolean isLogined=LoginVerify.isLogin(request);
User me=(User)session.getAttribute("loginUser");
%>

<%
String cantAlter="";
if(!isLogined || (isLogined && user.getId()!=me.getId())){	
    cantAlter="disabled";
}
%>
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
    <input type="text" class="form-control" value="<%=user.getName() %>" <%=cantAlter %>>
	</div>
	</div>
	
		 <div class="form-group">
	<div class="input-group">
     <span class="input-group-addon" id="basic-addon1">邮箱</span>
     <input type="text" class="form-control" value="<%=user.getEmail() %>" <%=cantAlter %>>
	</div>
	</div>
	
		 <div class="form-group">
	<div class="input-group">
     <span class="input-group-addon" id="basic-addon1">电话</span>
     <input type="text" class="form-control" value="<%=user.getPhone()==null?"":user.getPhone() %>" <%=cantAlter %>>
	</div>
	</div>
	<%if(isLogined && user.getId()==me.getId()){ %>
	<button type="submit" class="btn btn-primary">更新我的资料</button>
	<%}%>
	</form>
	</div>
</div>