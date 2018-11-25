
<%/*
导航栏
*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="javax.servlet.http.HttpSession,src.dbHandle.*,src.vo.*,src.tools.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
		<a class="navbar-brand" href="<%=basePath %>index.jsp?ceta=0"
			style="font-size: 24px">合肥学院物品交易(demo)</a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
		</ul>
		<form action="search.jsp"
			class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<input type="text" name="key" class="form-control" placeholder="关键字">
			</div>
			<button type="submit" class="btn btn-default">查找物品</button>
		</form>

		<% UserHandle userHandle=new UserHandle();
		   Boolean isLogined=LoginVerify.isLogin(request);
			User user=null;
			String email="";
			
				//email 是邮箱或用户名（如果存在）
		   if(isLogined){
			   user=(User)session.getAttribute("loginUser");
			   //更新信息，seesion中的user信息可能滞后！
			   user=userHandle.findById(user.getId());
			   email=(user.getName()==null || user.getName().length()==0)?user.getEmail():user.getName();
		   }
                %>
		<ul class="nav navbar-nav navbar-right">
			<%  Integer goodsNum = 0; 
			    Integer messNum = 0;
                if(user!=null){
                	ShopCartHandle shopCartHandle=new ShopCartHandle();
                	goodsNum = shopCartHandle.getShopCartNum(user.getId());
                	shopCartHandle.close();//关闭连接
					messNum=user.getMessnum();
				}
			%>
			<%if (isLogined!=null && user!=null &&isLogined==true){
			%>
			<li><a href="user/personal.jsp?tab=shopcart&userid=<%=user.getId()%>">购物车(<span style="color: #d00;"
					id="goodsNum"><%=goodsNum %></span>)</a></li>
			<li><a href="user/personal.jsp?tab=mess&userid=<%=user.getId()%>">消息(<span id="mess-number" style="color: #e00;"
					id="messNum"><%=messNum %></span>)</a></li>
			<li class="dropdown"><a href="javascript:void(0)"
				class="dropdown-toggle" data-toggle="dropdown" role="button"
				aria-haspopup="true" aria-expanded="false"><%=email%> <span
					class="caret"></span> </a>
				<ul class="dropdown-menu">
					<li><a href="<%=basePath %>user/personal.jsp?userid=<%=user.getId()%>&tab=info">个人中心</a></li>
					<%if(LoginVerify.isAdmin(request)){%>
					<li><a href="<%=basePath %>user/personal.jsp?userid=<%=user.getId()%>&tab=auditing">物品审核</a></li>
					<%}%>
					<li><a href="<%=basePath %>user/personal.jsp?userid=<%=user.getId()%>&tab=history">购买历史</a></li>
					<li><a href="<%=basePath %>user/personal.jsp?userid=<%=user.getId()%>&tab=push">发布物品</a></li>
					<li><a href="<%=basePath %>user/personal.jsp?userid=<%=user.getId()%>&tab=like">收藏夹</a></li>
					<!-- 并不需要设置页 
					<li><a href="<%=basePath %>user/personal.jsp?userid=<%=user.getId()%>&tab=setting">设置</a></li>
					-->
					<li><a href="<%=basePath %>ExitLoginServlet">退出登录</a></li>
				</ul>
			</li>
			<%
                    }else{%>
			<li><a href="<%=basePath %>user/login.jsp">登录</a></li>
			<li><a href="<%=basePath %>user/register.jsp">注册</a></li>
			<% }%>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</div>
<!-- /.container-fluid --> </nav>
