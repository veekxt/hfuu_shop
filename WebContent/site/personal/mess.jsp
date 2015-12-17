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
	out.println("我的消息");
%>
	</div>
	<div class="panel-body">
	
<!-- 一条消息 -->	
<div class="media">
  <div class="media-left">
    <a href="#">
      <img width="65px" class="media-object" src="static/image/ac_24.png" alt="sss">
    </a>
  </div>
  <div class="media-body">
    <span class="media-heading">来自<a>解涛</a>，2015年3月10日 4:78　　</span>
    <button type="button" class="btn btn-xs btn-success"
	onclick="">回复</button><button type="button" class="btn btn-xs btn-danger"
	onclick="">删除此条消息</button>
    <pre>这是消息正文，、、、/////
更多的消息正文,这是加长版的消息正文、、、、、//////</pre>
  </div>
</div>
<!-- end of 一条消息 -->

<!-- 一条消息 -->	
<div class="media">
  <div class="media-left">
    <a href="#">
      <img width="65px" class="media-object" src="static/image/ac_31.png" alt="sss">
    </a>
  </div>
  <div class="media-body">
    <span class="media-heading">来自<a>解涛</a>，2015年3月10日 4:78　　</span>
    <button type="button" class="btn btn-xs btn-success"
	onclick="">回复</button><button type="button" class="btn btn-xs btn-danger"
	onclick="">删除此条消息</button>
    <pre>这是消息正文，、、、/////
更多的消息正文,这是加长版的消息正文、、、、、//////这是消息正文，、、、/////
更多的消息正文,这是加长版的消息正文、、、、、//////这是消息正文，、、、/////
更多的消息正文,这是加长版的消息正文、、、、、//////这是消息正文，、、、/////
更多的消息正文,这是加长版的消息正文、、、、、//////这是消息正文，、、、/////
更多的消息正文,这是加长版的消息正文、、、、、//////</pre>
  </div>
</div>
<!-- end of 一条消息 -->

	</div>
</div>