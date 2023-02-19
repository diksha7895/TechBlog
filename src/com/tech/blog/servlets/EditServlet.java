package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helpers.ConnectionProvider;
import com.tech.blog.helpers.Helper;

/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter())
		{
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet Register Servlet</title>");
			out.println("</head>");
			out.println("<body>");
			
			//fetch all profile data
			String userEmail = request.getParameter("user_email");
			String userName = request.getParameter("user_name");
			String password = request.getParameter("user_parameter");
			String about = request.getParameter("about");
			Part part = request.getPart("image");
			String imageName = part.getSubmittedFileName();
			
			//get the user detail from session
			HttpSession s = request.getSession();
			User user=(User)s.getAttribute("currentUser");
			user.setEmail(userEmail);
			user.setName(userName);
			user.setPassword(password);
			user.setAbout(about);
			user.setProfilePhoto(imageName);
			
			//update database...
			UserDao dao=new UserDao(ConnectionProvider.getConnection());
			boolean result=dao.updateUser(user);
			if(result){
				//out.println("Profile details updated");
				
				String path = request.getRealPath("/")+"pics"+File.separator+user.getProfilePhoto();
				
					Helper.deleteFile(path);
				
					if(Helper.saveFile(part.getInputStream(), path)){
						out.println("Profile details updated in db");
						Message msg = new Message("Profile details updated successfully","success","alert-success");
						HttpSession httpS = request.getSession();
						s.setAttribute("msg", msg);
					}
				
				
			}else{
				out.println("Not updated");
			}
			
			out.println("</body>");
			out.println("</html>");
		}
	}
}
