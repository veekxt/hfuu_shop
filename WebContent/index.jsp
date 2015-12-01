<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
  	<base href=" <%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>物品交易-合肥学院-首页</title>
    <!-- Bootstrap -->
    <link href="src/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
    <link href="src/index.css" rel="stylesheet">
  </head>
  <body>
    <nav class="navbar navbar-default" style="witdth:1000px;">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" style="font-size:24px">合肥学院物品交易网</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">


      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">查找物品</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">我的收藏</a></li>
        <li><a href="#">购物车(0)</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人中心 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">我的历史</a></li>
            <li><a href="#">个人资料</a></li>
            <li><a href="#">设置</a></li>
            <li><a href="#">我的消息</a></li>
            <li><a href="#">退出登录</a></li>
          </ul>
        </li>
        <li><a href="#">登录</a></li>
        <li><a href="#">注册</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="container">
<div class="row">
<div class="col-md-3">
<div class="row">
  <div class="col-md-12">
	<div class="list-group">
	  <a href="#" class="list-group-item active">
	    分类
	  </a>
	  <a href="#" class="list-group-item"><span class="badge">14</span>生活出行</a>
	  <a href="#" class="list-group-item"><span class="badge">27</span>书籍</a>
	  <a href="#" class="list-group-item"><span class="badge">3</span>体育运动</a>
	  <a href="#" class="list-group-item"><span class="badge">0</span>电子产品</a>
	  <a href="#" class="list-group-item"><span class="badge">51</span>衣物鞋包</a>
	</div>
  </div>
</div>

<div class="row">
  <div class="col-md-12">
	<div class="list-group">
	  <a href="#" class="list-group-item active">
	    最新发布
	  </a>
	  <a href="#" class="list-group-item">用户1：物品1</a>
	  <a href="#" class="list-group-item">用户2：物品n</a>
	  <a href="#" class="list-group-item">用户3：物品x</a>
	  <a href="#" class="list-group-item">用户4：物品f</a>
	  <a href="#" class="list-group-item">用户5：物品h</a>
	</div>
  </div>
  
</div>

</div>
<div class="col-md-8">
这是右侧主体,暂定：展开左侧分类
</div>
</div>



</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="src/jquery2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="src/bootstrap3/js/bootstrap.min.js"></script>
    
     <footer>
        <p><small>
            Powered By 
            <a href="about" target="_blank">HfuuShop</a>
             | 
             <a rel="license" href="license" target="_blank" title="用户协议">©</a>
             2015 - 2015
        </small></p>
</footer>
    
  </body>
</html>