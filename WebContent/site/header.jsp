
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="javax.servlet.http.HttpSession,src.vo.*,src.tools.*"%>

<nav class="navbar navbar-default">
<div class="container">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="" style="font-size: 24px">合肥学院物品交易网</a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
		</ul>
		<form class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="关键字">
			</div>
			<button type="submit" class="btn btn-default">查找物品</button>
		</form>

		<% Boolean isLogined=(Boolean)session.getAttribute("isLogined");
				//email 是邮箱或用户名（如果存在）
           String email=(String)session.getAttribute("EmailOrUserName");
           User user=(User)session.getAttribute("loginUser");
                %>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#">我的收藏</a>
			</li>
			<li><a href="#">购物车(0)</a>
			</li>
			<%if (isLogined!=null && user!=null &&isLogined==true){
                    	%>
            
			<li class="dropdown"><a href="javascript:void(0)"
				class="dropdown-toggle" data-toggle="dropdown" role="button"
				aria-haspopup="true" aria-expanded="false"><%=email%> <span
					class="caret"></span> </a>
				<ul class="dropdown-menu">
					<li><a href="user/personal.jsp?user=<%=user.getId()%>&tab=info">个人中心</a>
					</li>
					<li><a href="user/personal.jsp?user=<%=user.getId()%>&tab=setting">设置</a>
					</li>
					<li><a href="user/personal.jsp?user=<%=user.getId()%>&tab=message">我的消息</a>
					</li>
					<li><a href="ExitLoginServlet">退出登录</a>
					</li>
				</ul></li>
			<%
                    }else{%>
			<li><a href="user/login.jsp">登录</a>
			</li>
			<li><a href="user/register.jsp">注册</a>
			</li>
			<% }%>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</div>
<!-- /.container-fluid --> </nav>
