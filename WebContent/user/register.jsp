<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="../site/head.jsp" />
<base href=" <%=basePath%>">
<title>注册-合肥学院物品交易</title>
<link href="src/index.css" rel="stylesheet">
<link href="src/css/sign.css" rel="stylesheet">

</head>

<body>
<jsp:include page="../site/header.jsp"  flush="true" />

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
      <input type="checkbox" value=""> 我已阅读了<a href="user/agreement.jsp" target="_blank">《用户协议》</a>
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
    <jsp:include page="../site/footer.jsp" />
</body>
</html>