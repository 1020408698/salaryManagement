package org.student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

//数据库增删改查
public class StudentDao {

	public boolean deleteStudent(String sno) {
		try {
			String driverClass = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/salary";
			String username = "root";
			String password = "root";
			Class.forName(driverClass);// 加载驱动
			Connection connection = DriverManager.getConnection(url, username, password);
			String sql = "delete from allsalary where name=?";
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, sno);
			int count = pStatement.executeUpdate();
			if (count > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteStudentrecord(String sno) {
		try {
			String driverClass = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/salary";
			String username = "root";
			String password = "root";
			Class.forName(driverClass);// 加载驱动
			Connection connection = DriverManager.getConnection(url, username, password);
			String sql = "delete from record where name=?";
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, sno);
			int count = pStatement.executeUpdate();
			if (count > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteStudentnumber(String sno) {
		try {
			String driverClass = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/salary";
			String username = "root";
			String password = "root";
			Class.forName(driverClass);// 加载驱动
			Connection connection = DriverManager.getConnection(url, username, password);
			String sql = "delete from userlogin where name=?";
			String sql1 = "drop table "+sno+";";
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, sno);
			int count = pStatement.executeUpdate();
			PreparedStatement pStatement1 = connection.prepareStatement(sql1);
			int count1 = pStatement1.executeUpdate();
			if (count > 0 || count1 >0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean DeleteStudentmessage(String sno) {
		try {
			String driverClass = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/salary";
			String username = "root";
			String password = "root";
			Class.forName(driverClass);// 加载驱动
			Connection connection = DriverManager.getConnection(url, username, password);
			String sql = "delete from message where name=?";
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, sno);
			int count = pStatement.executeUpdate();
			if (count > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
