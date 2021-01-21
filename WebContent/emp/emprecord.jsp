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
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">

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
					<li><a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
						<ul class="sub-menu">
							<li><a href="system.jsp"><i class="icon-font">&#xe017;</i>系统查看</a>
							</li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="main-wrap">
			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i> <a href="index.jsp">首页</a>
					<span class="crumb-step">&gt;</span> 
					<a href="emprecord.jsp"><span class="crumb-name">个人考勤信息</span></a>
				</div>
			</div>
			<div class="search-wrap">
				<div class="search-content">
					<form action="#" method="post">
						<table class="search-tab">
							<tr>
								<th width="70">关键字:</th>
								<th><input class="common-text" placeholder="要输入的关键字"
									name="keywords" value="" id="" type="text">
								</td>
								<th><input class="btn btn-primary btn2" name="sub"
									value="查询" type="submit">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="result-wrap">
				<form name="myform" id="myform" method="post">
					<div class="result-title">
						<div class="result-list">
							<a id="updateOrd" href="emprecord.jsp"><i class="icon-font">&#xe017;</i>更新个人信息</a>
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
								<td align="center">出勤天数</td>
								<td align="center">休假天数</td>
								<td align="center">迟到天数</td>
								<td align="center">早退天数</td>
								<td align="center">旷工天数</td>
							</tr>
							<%
								Statement stmt = null;
								ResultSet rs = null;
								Statement stmt1 = null;
								String sql = "select * from record where name = '" + session.getAttribute("username") + "';"; //查询语句
								System.out.print(sql);
								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
								while (rs.next()) {
							%>
							<tr>
								<td align="center"><%=rs.getString("chuqin")%></td>
								<td align="center"><%=rs.getString("xiujia")%></td>
								<td align="center"><%=rs.getInt("chidao")%></td>
								<td align="center"><%=rs.getString("zaotui")%></td>
								<td align="center"><%=rs.getString("kuanggong")%></td>
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