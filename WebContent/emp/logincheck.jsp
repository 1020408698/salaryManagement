<%@page import="Bean.DBBean"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<!--javaBean-->
	<jsp:useBean id="db" class="Bean.DBBean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
		String username = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");//取出login.jsp的值

		//下面是数据库操作
		String sql = "select * from userlogin where name=" + "'" + username + "'";//定义一个查询语句
		ResultSet rs = db.executeQuery(sql);//运行上面的语句
		if (rs.next()) {
			if (password.equals(rs.getObject("pass"))) {
				//response.sendRedirect("index.jsp");
				session.setAttribute("username", username);
				if(username.equals("admin")){
					request.getRequestDispatcher("manager/admin.jsp").forward(request, response);
				}
				request.getRequestDispatcher("emp/index.jsp").forward(request, response);
			} else {
				out.print("<script language='javaScript'> alert('密码输入错误');</script>");
				response.setHeader("refresh", "0;url=login.jsp");
			}
		} else {
			out.print("<script language='javaScript'> alert('账号输入错误');</script>");
			response.setHeader("refresh", "0;url=login.jsp");
		}
	%>
</body>
</html>