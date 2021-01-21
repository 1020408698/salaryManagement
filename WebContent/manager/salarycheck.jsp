<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工资后台管理系统</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"
	media="all">
<style>

.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 50%;
	width: 13%;
	height: 35%;
	padding: 20px;
	border: 1px solid #ccc;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

.white_content1 {
	display: none;
	position: absolute;
	top: 25%;
	left: 50%;
	width: 13%;
	height: 35%;
	padding: 20px;
	border: 1px solid #ccc;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

</style>
</head>
<body>
	<div class="topbar-wrap white">
		<div class="topbar-inner clearfix">
			<div class="topbar-logo-wrap clearfix">
				<ul class="navbar-list clearfix">
					<li><a class="on" href="index.jsp">首页</a></li>
				</ul>
			</div>
			<div class="top-info-wrap">
				<ul class="top-info-list clearfix">
					<li>
						<p>
							管理员（<%=session.getAttribute("username")%>），你好！
						</p>
					</li>
					<li><a href="../login.jsp">退出</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container clearfix">
		<div class="sidebar-wrap">
			<div class="sidebar-title">
				<h1>菜单</h1>
			</div>
			<div class="sidebar-content">
				<ul class="sidebar-list">
					<li><a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
						<ul class="sub-menu">
							<li><a href="personinfo.jsp"><i class="icon-font">&#xe00c;</i>个人信息</a></li>
							<li><a href="employeeManagement.jsp"><i class="icon-font">&#xe00f;</i>员工管理</a></li>
							<li><a href="salarycheck.jsp"><i class="icon-font">&#xe005;</i>基本工资查看</a></li>
							<li><a href="message.jsp"><i class="icon-font">&#xe004;</i>留言管理</a></li>
							<li><a href="allrecord.jsp"><i class="icon-font">&#xe004;</i>员工考勤信息</a></li>
						</ul></li>
					<li><a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
						<ul class="sub-menu">
							<li><a href="system.jsp"><i class="icon-font">&#xe017;</i>系统设置查看</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="main-wrap">
			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i><a href="admin.jsp">首页</a><span
						class="crumb-step">&gt;</span> <a href="salarycheck.jsp"><span
						class="crumb-name">工资查看</span></a>
				</div>
			</div>
			<div class="search-wrap">
				<div class="search-content">
					<form action="#" method="post">
						<table class="search-tab">
							<tr>
								<th width="70">关键字:</th>
								<td><input class="common-text" placeholder="要输入的关键字"
									name="keywords" value="" id="" type="text"></td>
								<td><input class="btn btn-primary btn2" name="sub"
									value="查询" type="submit"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="result-wrap">
				<form name="myform" id="myform" method="post">
					<div class="result-title">
						<div class="result-list">
							<i class="icon-font">&#xe002;</i>全部员工工资查看
							<a href="javascript:void(0)" onclick="document.getElementById('light1').style.display='block';"><i class="icon-font">&#xe002;</i>添加员工工资信息</a>
						</div>
					</div>
					<%
						try {
							Class.forName("com.mysql.jdbc.Driver"); ////驱动程序名
							String url = "jdbc:mysql://localhost:3306/salary"; //数据库名
							String username = "root"; //数据库用户名
							String password = "root"; //数据库用户密码
							Connection conn = DriverManager.getConnection(url, username, password); //连接状态
							if (conn != null) {
					%>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<tr>
								<td align="center">姓名</td>
								<td align="center">基础工资</td>
								<td align="center">津贴</td>
								<td align="center">奖金</td>
								<td align="center">加班费</td>
								<td align="center">总工资</td>
								<td align="center">操作</td>
							</tr>
							<%
								Statement stmt = null;
								ResultSet rs = null;
								Statement stmt1 = null;
								String sql = "select * from allsalary;"; //查询语句
								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
								while (rs.next()) {
							%>
							<tr>
								<td align="center"><%=rs.getString("name")%></td>
								<td align="center"><%=rs.getString("basicsalary")%></td>
								<td align="center"><%=rs.getString("allowance")%></td>
								<td align="center"><%=rs.getString("bonous")%></td>
								<td align="center"><%=rs.getString("overtimepay")%></td>
								<td align="center"><%=rs.getString("totalsalary")%></td>
								<td align="center">
								<a href="javascript:void(0)" onclick="document.getElementById('light').style.display='block';">修改</a>
								<a class="link-del" href="../DeleteStudentsalary?name=<%=rs.getString("name")%>">删除</a>
								</td>
								
							</tr>
							<%
								}
									} else {
										out.print("连接失败！");
									}
								} catch (Exception e) {
									out.print("数据库连接异常！");
								}
							%>
						</table>
					</div>
				</form>
			</div>
		</div>
		<!--/main-->
	</div>
	<div id="light" class="white_content">
		<h2 align="center">员工工资信息修改表</h2>
		<form action="changesalary.jsp" method="post">
			<div class="input-group">
				<span><i class="fa fa-user" aria-hidden="true"></i></span> <input
					type="text" placeholder="姓名" required="" style="font-family: none"
					name="name">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="基础工资" required="" style="font-family: none"
					name="basicsalary">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="津贴" required="" style="font-family: none"
					name="allowance">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="奖金" required=""
					style="font-family: none" name="bonous">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="加班费" required="" style="font-family: none"
					name="overtimepay">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="总工资" required="" style="font-family: none"
					name="totalsalary">
			</div>
			<button class="btn btn-danger btn-block" type="submit">提交</button>
			<p>
				<a href="salarycheck.jsp">返回</a>
			</p>
		</form>
	</div>
	
	<div id="light1" class="white_content1">
		<h2 align="center">员工工资信息添加表</h2>
		<form action="addsalary.jsp" method="post">
			<div class="input-group">
				<span><i class="fa fa-user" aria-hidden="true"></i></span> <input
					type="text" placeholder="姓名" required="" style="font-family: none"
					name="name">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="基础工资" required="" style="font-family: none"
					name="basicsalary">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="津贴" required="" style="font-family: none"
					name="allowance">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="奖金" required=""
					style="font-family: none" name="bonous">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="加班费" required="" style="font-family: none"
					name="overtimepay">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="总工资" required="" style="font-family: none"
					name="totalsalary">
			</div>
			<button class="btn btn-danger btn-block" type="submit">提交</button>
			<p>
				<a href="salarycheck.jsp">返回</a>
			</p>
		</form>
	</div>
</body>
</html>