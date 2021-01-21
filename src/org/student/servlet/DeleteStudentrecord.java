package org.student.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.student.service.StudentService;

public class DeleteStudentrecord extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteStudentrecord() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		StudentService service = new StudentService();
		boolean result = service.deleteStudentrecord(name);
		response.setContentType("text/html charset=utf-8");
		response.setCharacterEncoding("utf-8");
		if (result) {
			//response.getWriter().print("É¾³ý³É¹¦");
			response.sendRedirect("manager/allrecord.jsp");
		} else
			response.getWriter().print("É¾³ýÊ§°Ü");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
