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
//根据cache参数来决定是否使用缓存
//解决上传新头像不刷新的问题
String isCache=request.getParameter("cache");
if(isCache!=null && isCache.equals("0")){
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);
}
%>
<%
UserHandle userHandle=new UserHandle();
Boolean isLogined=LoginVerify.isLogin(request);
User me=(User)session.getAttribute("loginUser");
User user=null;
if(request.getAttribute("isMe")!=null){
    user=me;
}else{
    user=userHandle.findById(Integer.parseInt(request.getParameter("userid")));
}
%>

<%
String cantAlter="";
if(!isLogined || (isLogined && user.getId()!=me.getId())){	
    cantAlter="readonly";
}
%>
<div class="panel panel-info">
	<div class="panel-heading">
<%
	out.println("个人资料");
%>
	</div>
	<div class="panel-body">
<%if(request.getParameter("info")!=null && request.getParameter("info").length()>0){
String info=new String(request.getParameter("info").getBytes("UTF-8"),"UTF-8");
out.print("<div class=\"alert alert-danger\" role=\"alert\">"+info+"</div>");
}
%>
<%if(isLogined && user.getId()==me.getId()){ %>
<div>
<button id="set-img" type="button" class="btn btn-primary btn-sm">上传新头像</button>
</div>

<div id="up-img-body" style="display:none" class="row">
<div class="col-md-3">
<img class="img-rounded img-personal-info-info"
src="<%=user.getImg() %>" />
</div>
<div class="col-md-9">
<fieldset>
            <form action="UpdateUserImgServlet"
                method="post" enctype="multipart/form-data">
                上传文件：
                <input type="file" name="file" accept="image/gif, image/jpeg, image/x-png" class="btn btn-default btn-sm">
                <input type="submit" value="更新" class="btn btn-primary btn-sm">
            </form>
</fieldset>
</div>
</div>
<br />
<%}%>
	<form action="UpdateUserInfoServlet" method="post">
	 <div class="form-group">
	<div class="input-group">
     <span class="input-group-addon" id="basic-addon1">姓名</span>
    <input type="text" class="form-control" name="name" value="<%=user.getName() %>" <%=cantAlter %>>
	</div>
	</div>
	
		 <div class="form-group">
	<div class="input-group">
     <span class="input-group-addon" id="basic-addon1">邮箱</span>
     <input readonly type="text" class="form-control" value="<%=user.getEmail() %>" <%=cantAlter %>>
	</div>
	</div>
	
	<div class="form-group">
    <div class="input-group">
     <span class="input-group-addon" id="basic-addon1">电话</span>
     <input type="text" class="form-control" name="phone" value="<%=user.getPhone()==null?"":user.getPhone() %>" <%=cantAlter %>>
    </div>
    </div>
    
    <div class="form-group" style="display:none" id="set-pwd-input">
    
    <div class="input-group">
     <span class="input-group-addon" id="pwd1">新的密码</span>
     <input placeholder="不更新密码留空此项即可" name="pwd1" type="password" class="form-control" value="">
    </div>
    

    <div class="input-group">
     <span class="input-group-addon" id="pwd2">密码重复</span>
     <input type="password" name="pwd2" class="form-control" value="">
    </div>
    
	</div>
	<%if(isLogined && user.getId()==me.getId()){ %>
	<button id="set-pwd" type="button" class="btn btn-primary">设置密码</button>
	<button type="submit" class="btn btn-primary">更新我的资料</button>
	<%}else{%>
	<button onclick='window.open("user/personal.jsp?tab=mess&handle=write&toemail=<%=user.getEmail() %>%20==>%20<%=user.getName()%>")' id="send-mess-to-he" type="button" class="btn btn-primary">给他发送消息</button>
	<%}%>
	</form>
	</div>
</div>

<script>
$(document).ready(function(){
    $("#set-pwd").click(function(){
        $("#set-pwd-input").show(200);
        $("#set-pwd").hide(200);
    });
    $("#set-img").click(function(){
    	$("#up-img-body").show();
    	$("#set-img").hide();
    });
  });
</script>
<%
userHandle.close();
%>