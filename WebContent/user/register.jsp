<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"%>
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
	<jsp:include page="../site/header.jsp" flush="true" />
	<%
if(request.getAttribute("isRegister")!=null){
%>
	<div class="alert alert-danger" role="alert">
		<%if(!request.getAttribute("isEmail").equals("")){
    out.print(request.getAttribute("isEmail")+"<br />");}
if(!request.getAttribute("isPwd").equals("")){
    out.print(request.getAttribute("isPwd")+"<br />");}
if(!request.getAttribute("isPwdSame").equals("")){
    out.print(request.getAttribute("isPwdSame"));
}
%>
	</div>
	<%
}
%>
	<div class="container">
		<div class="xt_mid">

			<!--提交此form 注册 -->
			<form action="user/register" method="post" class="form-horizontal">
				<h2 class="form-signin-heading">注册账号</h2>
				<div class="form-group">
					<label for="input_email" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="input_email"
							name="input_email" placeholder="">
					</div>
				</div>
				<div class="form-group">
					<label for="input_password1" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="input_password1"
							name="input_password1" placeholder="请设置为六位以上">
					</div>
				</div>

				<div class="form-group">
					<label for="input_password2" class="col-sm-2 control-label">密码重复</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="input_password2"
							name="input_password2" placeholder="">
					</div>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">名字</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name"
							placeholder="请填写真实姓名">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-10" style="text-align: left;">
						同意注册说明您已阅读<a href="user/agreement.jsp" target="_blank">《用户协议》</a>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-10">
						<button type="submit" class="btn btn-block btn-primary">注册</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- /container -->
	<jsp:include page="../site/footer.jsp" />
</body>
</html>