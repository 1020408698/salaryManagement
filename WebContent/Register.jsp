<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<title>注册页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<meta name="keywords" content="" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="css/register.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body>
	<div class="signupform">
		<h1>用户注册表</h1>
		<div class="container">

		<div class="agile_info">
			<div class="w3l_form">
				<div class="left_grid_info">
					<h3>欢迎!</h3>
					<h4>这里是最大的员工基地</h4>
					<p>欢迎来到这个大家庭，请填写左边的表格以进行注册成为我们的一员吧</p>
					<ul class="social_section_1info">
						<li><a href="#" class="w3_facebook"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#" class="w3_twitter"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#" class="w3_instagram"><i class="fa fa-instagram"></i></a></li>
						<li><a href="#" class="w3_google"><i class="fa fa-google-plus"></i></a></li>
						<li><a href="#" class="w3_pinterest"><i class="fa fa-pinterest"></i></a></li>
						<li><a href="#" class="w3_vimeo"><i class="fa fa-vimeo"></i></a>
						</li>
					</ul>
				</div>
			</div>
		<div class="w3_info">
			<h2>创建表单</h2>
			<form action="checkRegister.jsp" method="post">
				<div class="input-group">
					<span><i class="fa fa-user" aria-hidden="true"></i></span> 
					<input type="text" placeholder="用户名" required="" name="username">
				</div>
				<div class="input-group">
					<span><i class="fa fa-lock" aria-hidden="true"></i></span> 
					<input type="password" placeholder="密码" required="" name="password">
				</div>
				<div class="input-group">
					<span><i class="fa fa-lock" aria-hidden="true"></i></span> 
					<input type="password" placeholder="确认密码" required="" name="password">
				</div>
				<input type="checkbox" value="remember-me" />
				<h4>向我发送最新更新</h4>
				<button class="btn btn-danger btn-block" type="submit">注册</button>
				<p>
					已有帐号？<a href="login.jsp">登录</a>
				</p>
			</form>
		</div>
			<div class="clear"></div>
		</div>

		</div>
		<div class="footer">
			<p>Copyright &copy; 2020.吉首大学计科一班章煜版权所有</p>
		</div>
	</div>
</body>
</html>