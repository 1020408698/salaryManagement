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
		String basicsalary = request.getParameter("basicsalary");
		String allowance = request.getParameter("allowance");
		String bonous = request.getParameter("bonous");
		String overtimepay = request.getParameter("overtimepay");
		String totalsalary = request.getParameter("totalsalary");
		
		String driverClass = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/salary";
		String username = "root";
		String password = "root";
		Class.forName(driverClass);//加载驱动 
		Connection connection = DriverManager.getConnection(url, username, password);
		String sql = "insert into allsalary "+"values "+"('"+name+"','"+basicsalary+"',"+allowance+",'"+bonous+"','"+overtimepay+"','"+totalsalary+"');";
		System.out.print(sql);
		Statement createtable = connection.createStatement();
		int rscreate = createtable.executeUpdate(sql);
		if(rscreate > 0){
			out.println("<script>alert('添加员工工资信息成功！');window.location.href='salarycheck.jsp';</script>");			
		}else{
			out.println("<script>alert('添加员工工资信息失败！');window.location.href='salarycheck.jsp';</script>");
		}			
	%>
</body>
</html>