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
							员工（<%=session.getAttribute("username")%>），你好！
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
							<li><a href="salarycheck.jsp"><i class="icon-font">&#xe005;</i>基本工资查看</a></li>
							<li><a href="message.jsp"><i class="icon-font">&#xe004;</i>员工留言</a></li>
							<li><a href="emprecord.jsp"><i class="icon-font">&#xe004;</i>个人考勤信息</a></li>
						</ul>
					</li>
					<li>
						<a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
						<ul class="sub-menu">
							<li><a href="system.jsp"><i class="icon-font">&#xe017;</i>系统查看</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="main-wrap">
			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i><a href="index.jsp">首页</a><span class="crumb-step">&gt;</span>
					<a href="salarycheck.jsp"><span class="crumb-name">工资查看</span></a>
				</div>
			</div>
			<div class="search-wrap">
				<div class="search-content">
					<form action="#" method="post">
						<table class="search-tab">
							<tr>
								<th width="70">关键字:</th>
								<td><input class="common-text" placeholder="要输入的关键字" name="keywords" value="" id="" type="text"></td>
								<td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="result-wrap">
				<form name="myform" id="myform" method="post">
					<div class="result-title">
						<div class="result-list">
							<i class="icon-font">&#xe002;</i>个人工资查看
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
								<td align="center">基础工资</td>
								<td align="center">津贴</td>
								<td align="center">奖金</td>
								<td align="center">加班费</td>
								<td align="center">总工资</td>
							</tr>
							<%
								Statement stmt = null;
								ResultSet rs = null;
								Statement stmt1 = null;
								String sql = "select * from allsalary where name = '"+session.getAttribute("username")+"';"; //查询语句
								System.out.print(sql);
								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
								while (rs.next()) {
							%>
							<tr>
								<td align="center"><%=rs.getString("basicsalary")%></td>
								<td align="center"><%=rs.getString("allowance")%></td>
								<td align="center"><%=rs.getString("bonous")%></td>
								<td align="center"><%=rs.getString("overtimepay")%></td>
								<td align="center"><%=rs.getString("totalsalary")%></td>
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
</body>
</html>