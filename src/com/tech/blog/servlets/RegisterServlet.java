package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helpers.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter())
		{
//			out.println("<!DOCTYPE html>");
//			out.println("<html>");
//			out.println("<head>");
//			out.println("<title>Servlet Register Servlet</title>");
//			out.println("</head>");
//			out.println("<body>");
			//out.println("<h1>Servlet RegisterServlet at" +request.getContextPath() + "</h1>");
	
			//fetch all form data
			String check = request.getParameter("check");
			if(check==null){
				out.println("Please select check box");
			}else{
				String name = request.getParameter("user_name");
				String email = request.getParameter("user_email");
				String password = request.getParameter("user_password");
				String gender = request.getParameter("gender");
				String about = request.getParameter("about");
				
				//create user object and set all data to that object
				User user = new User(name,email,password,gender,about);
				
				//create a userDao object
				UserDao dao = new UserDao(ConnectionProvider.getConnection());
				if(dao.saveUser(user)){
					out.println("done");
				}else{
					out.println("error");
				}
			}
			out.println("</body>");
			out.println("</html>");
		}
		
	}

}
