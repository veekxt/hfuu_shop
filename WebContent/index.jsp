<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page language="java" %>
    <%@ page import="java.sql.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>

<base href="<%=basePath%>">
<jsp:include page="site/head.jsp" />
<title>物品交易-合肥学院-首页</title>
</head>
<body>
<jsp:include page="site/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="row">
					<div class="col-md-12">
						<div class="list-group">
							<a href="#" class="list-group-item active"> 分类 </a> <a href="#"
								class="list-group-item"><span class="badge">14</span>生活出行</a> <a
								href="#" class="list-group-item"><span class="badge">27</span>书籍</a>
							<a href="#" class="list-group-item"><span class="badge">3</span>体育运动</a>
							<a href="#" class="list-group-item"><span class="badge">0</span>电子产品</a>
							<a href="#" class="list-group-item"><span class="badge">51</span>衣物鞋包</a>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="list-group">
							<a href="#" class="list-group-item active"> 最新发布 </a> <a href="#"
								class="list-group-item">用户1：物品1</a> <a href="#"
								class="list-group-item">用户2：物品n</a> <a href="#"
								class="list-group-item">用户3：物品x</a> <a href="#"
								class="list-group-item">用户4：物品f</a> <a href="#"
								class="list-group-item">用户5：物品h</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8">这是右侧主体,暂定：展开左侧分类
			<br />


			</div>
		</div>
	</div>


	<jsp:include page="site/footer.jsp" />
</body>
</html>