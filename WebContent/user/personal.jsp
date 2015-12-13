<%@page import="org.apache.el.lang.ELSupport"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*,src.vo.*,src.tools.*,javax.servlet.http.HttpSession"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
if(request.getParameter("userid")==null && session.getAttribute("isLogined").equals(false)){
	 response.sendRedirect("login.jsp?login-info="+java.net.URLEncoder.encode("请先登录网站","UTF-8"));
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<jsp:include page="../site/head.jsp" />
<title>用户中心 - HfuuShop</title>
</head>
<body>
	<jsp:include page="../site/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="row">
					<div class="col-md-12">
						<div class="list-group">
							<div class="list-group-item personal-main-info">
								<img class="img-rounded img-personal-main-info"
									src="static/image/ac_24.png" />
								<div class="row detail-goods text-muted">姓名：涛哥</div>
								<div class="row detail-goods text-muted">邮箱：wklzhizhen@163.com</div>
							</div>
							<a href="user/personal.jsp?tab=info" class="list-group-item">个人信息</a>
							<%if((session.getAttribute("isLogined").equals(true))){%>
							<%if(((User) session.getAttribute("loginUser")).getId()<1000){%>
							<a href="user/personal.jsp?tab=auditing" class="list-group-item">物品审核</a>
							<%}%>
							<a href="user/personal.jsp?tab=push" class="list-group-item">发布商品</a>
							<a href="user/personal.jsp?tab=history&page=1"
								class="list-group-item">购买历史</a> <a
								href="user/personal.jsp?tab=setting" class="list-group-item">设置
							</a> <a href="user/personal.jsp?tab=like&page=1"
								class="list-group-item">收藏夹 </a>
							<%}%>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<%if(request.getParameter("tab").equals("push")){%>
				<jsp:include page="../site/personal/push.jsp" />
				<%} else if(request.getParameter("tab").equals("info")){%>
				<jsp:include page="../site/personal/info.jsp" />
				<%}else if(request.getParameter("tab").equals("auditing")){%>
				<jsp:include page="../site/personal/auditing.jsp" />
				<%}%>
			</div>
		</div>
	</div>
	<jsp:include page="../site/footer.jsp" />
</body>
</html>