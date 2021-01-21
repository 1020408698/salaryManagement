 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String chuqin = request.getParameter("chuqin");
		String xiujia = request.getParameter("xiujia");
		String chidao = request.getParameter("chidao");
		String zaotui = request.getParameter("zaotui");
		String kuanggong = request.getParameter("kuanggong");
		
		String driverClass = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/salary";
		String username = "root";
		String password = "root";
		Class.forName(driverClass);//加载驱动 
		Connection connection = DriverManager.getConnection(url, username, password);
		String sql = "insert into record "+"values "+"('"+name+"','"+chuqin+"',"+xiujia+",'"+chidao+"','"+zaotui+"','"+kuanggong+"');";
		System.out.print(sql);
		Statement createtable = connection.createStatement();
		int rscreate = createtable.executeUpdate(sql);
		if(rscreate > 0){
			out.println("<script>alert('添加员工考勤信息成功！');window.location.href='allrecord.jsp';</script>");			
		}else{
			out.println("<script>alert('添加员工考勤信息失败！');window.location.href='allrecord.jsp';</script>");
		}			
	%>
</body>
</html>