<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.sql.*,src.tools.*,javax.servlet.http.HttpSession"%>
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
							<a href="#" class="list-group-item list-group-item-info"> 分类 </a> <a
								href="?ceta=0" class="list-group-item"><span class="badge">322</span>全部</a>
							<a href="#" class="list-group-item"><span class="badge">14</span>生活出行</a>
							<a href="#" class="list-group-item"><span class="badge">27</span>书籍</a>
							<a href="#" class="list-group-item"><span class="badge">3</span>体育运动</a>
							<a href="#" class="list-group-item"><span class="badge">0</span>电子产品</a>
							<a href="#" class="list-group-item"><span class="badge">51</span>衣物鞋包</a>
						</div>
					</div>
				</div>
			</div>
			<!-- 所有商品放在分类里就好
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
-->
			<div class="col-md-8">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-info">全部分类-最新 </a>
					<!-- 每个商品占一个此div -->
                    <div class="list-group-item">
                        <div class="row">
                            <div class="col-md-3">
                                <img class="img-rounded img-item-goods"
                                    src="static/image/ac_24.png" />
                            </div>
                            <div class="col-md-9">
                                <div class="row detail-goods lead">
                                    <a>全新野生AC娘</a>
                                </div>
                                <div class="row detail-goods text-muted">发布者: 涛哥</div>
                                <div class="row detail-goods text-danger">时间：2015-08-23
                                    04:23</div>
                            </div>
                        </div>
                    </div>
<!-- 每个商品占一个此div -->
                    <div class="list-group-item">
                        <div class="row">
                            <div class="col-md-3">
                                <img class="img-rounded img-item-goods"
                                    src="static/image/ac_31.png" />
                            </div>
                            <div class="col-md-9">
                                <div class="row detail-goods lead">
                                    <a>家养AC娘，3成新</a>
                                </div>
                                <div class="row detail-goods text-muted">发布者: wlzhizhen@163.com</div>
                                <div class="row detail-goods text-danger">时间：2015-02-21
                                    09:24</div>
                            </div>
                        </div>
                    </div>
				</div>
			</div>

		</div>
	</div>


	<jsp:include page="site/footer.jsp" />
</body>
</html>