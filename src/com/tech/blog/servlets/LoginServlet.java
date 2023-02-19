package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helpers.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter())
		{
			//fetch username and password from request
			String username=request.getParameter("email");
			String password=request.getParameter("password");
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			User user = dao.getUserByEmailAndPassword(username, password);
			
			if(user==null){
				Message msg = new Message("Invalid details...Please fill correct details","error","alert-danger");
				HttpSession s = request.getSession();
				s.setAttribute("msg", msg);
				response.sendRedirect("Login.jsp");
				//out.println("Invalid details...Please fill correct details");
			}else{
				HttpSession s=request.getSession();
				s.setAttribute("currentUser", user);
				response.sendRedirect("profile.jsp");
			}
			
		  }
			
		}

}
