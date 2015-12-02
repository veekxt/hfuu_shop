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
<base href=" <%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>注册-合肥学院物品交易</title>
<!-- Bootstrap -->
<link href="src/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<link href="src/index.css" rel="stylesheet">
<link href="src/css/sign.css" rel="stylesheet">

</head>
<body>

    <div class="container">
<div class="xt_mid">
<form class="form-horizontal">
<h2 class="form-signin-heading">注册账号</h2>
  <div class="form-group">
    <label for="input_email" class="col-sm-2 control-label">邮箱</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="input_email" placeholder="123456@qq.com">
    </div>
  </div>
  <div class="form-group">
    <label for="input_password1" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="input_password1" placeholder="">
    </div>
  </div>
  
    <div class="form-group">
    <label for="input_password2" class="col-sm-2 control-label">密码重复</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="input_password2" placeholder="">
    </div>
  </div>
    <div class="form-group">
    <label for="stu_num" class="col-sm-2 control-label">学号</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="stu_num" placeholder="1204011010">
    </div>
  </div>
      <div class="form-group">
    <label for="name" class="col-sm-2 control-label">名字</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="name" placeholder="小华">
    </div>
  </div>
          <div class="form-group">
  <label class="col-sm-2 control-label"></label>
    <div class="col-sm-10" style="text-align:left;">
      <input type="checkbox" value=""> 我已阅读了<a href="src/user/agreement.jsp" target="_blank">《用户协议》</a>
    </div>
  </div>
        
  <div class="form-group">
  <label class="col-sm-2 control-label"></label>
    <div class="col-sm-10">
      <button type="submit" class="btn btn-block btn-primary btn-default">注册</button>
    </div>
  </div>
</form>
</div>
    </div> <!-- /container -->
</body>
</html>