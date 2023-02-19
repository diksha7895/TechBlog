<%@page import="com.tech.blog.entities.Message" %>
<%@page import="com.tech.blog.entities.User" %>
<%@page errorPage="Error.jsp" %>
<%
	User user=(User)session.getAttribute("currentUser");
	if(user==null){
		response.sendRedirect("Login.jsp");
	}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Profile</title>
		
		<!-- CSS -->
				<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
				<link href="css/style.css" rel="stylesheet" type="text/css"/>
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
				<style>
					.banner-background{
						clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 85%, 70% 94%, 25% 88%, 0 95%, 0 0);
					}
				</style>
		
	</head>
	<body>
		<!-- start navbar -->
		
		<nav class="navbar navbar-expand-lg navbar-dark primary-background">
			  <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>TechBlog</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item active">
			        <a class="nav-link" href="#"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
			      </li>
			     
			      <li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          <span class="fa fa-tasks"></span> BlogCategory
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="#">Programming</a>
			          <a class="dropdown-item" href="#">Project Implementation</a>
			          <div class="dropdown-divider"></div>
			          <a class="dropdown-item" href="#">Data Structure</a>
			        </div>
			      </li>
			       <li class="nav-item">
			        <a class="nav-link" href="#"><span class="fa fa-phone"></span> Contact Us</a>
			      </li>
			      
			      <li class="nav-item">
			        <a class="nav-link" href="Register.jsp"><span class="fa fa-user-plus"></span> Logout</a>
			      </li>
			   
			    </ul>
			     <ul class="navbar-nav mr-right">
			     	  <li class="nav-item">
				        <a class="nav-link" href="#" data-toggle="modal" data-target="#profileModal"><span class="fa fa-user-circle"></span> <%= user.getName() %></a>
				      </li>
				       <li class="nav-item">
				        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
				      </li>
			     	
			     </ul>
			   
			  </div>
		</nav>
		
		<!-- end navbar -->
		
						   <%
								Message m = (Message)session.getAttribute("msg");
								if(m!=null){
									%>
									<div class="alert <%= m.getCssClass() %>" role="alert">
										<%= m.getContent() %>
									</div>
									<% 
									session.removeAttribute("msg");
								}
							%>
		
		<!-- profile modal -->
		
				<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header primary-background text-white text-center">
				        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <div class="container text-center">
				        	<img scr="pics/<%= user.getProfilePhoto() %>" class="img-fluid" style="border-radius:50%;max-width:150px">
				        	<br/>
				        	<h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>
				        	
				        	<!-- Profile Details -->
				        	<div id="profile-details">
				        	<table class="table">
								  
								  <tbody>
								    <tr>
								      <th scope="row">ID :</th>
								      <td><%= user.getId() %></td>
								    </tr>
								    <tr>
								      <th scope="row">Email :</th>
								      <td><%= user.getEmail() %></td>
								    </tr>
								    <tr>
								      <th scope="row">Gender :</th>
								      <td><%= user.getGender() %></td>
								    </tr>
								     <tr>
								      <th scope="row">Status :</th>
								      <td><%= user.getAbout() %></td>
								    </tr>
								    <tr>
								      <th scope="row">Registered On :</th>
								      <td><%= user.getDateTime().toString() %></td>
								    </tr>
								  </tbody>
								</table>
				        	</div>
				        	
				        	<!-- profile Edit -->
				        	<div id="profile-edit" style="display:none">
				        		<h3 class="mt-2">Edit your details</h3>
				        		<form action="EditServlet" method="post" enctype="multipart/form-data">
				        			<table class="table">
				        				<tr>
				        					<th scope="row">ID :</th>
								      		<td><%= user.getId() %></td>
				        				</tr>
				        				<tr>
				        					<th scope="row">Email :</th>
								      		<td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
				        				</tr>
				        				<tr>
				        					<th scope="row">Name :</th>
								      		<td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"></td>
				        				</tr>
				        				<tr>
				        					<th scope="row">Password :</th>
								      		<td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"></td>
				        				</tr>
				        				<tr>
				        					<th scope="row">Gender :</th>
								      		<td><%= user.getGender().toUpperCase() %></td>
				        				</tr>
				        				<tr>
				        					<th scope="row">About :</th>
								      		<td><textarea class="form-control" name="about" rows="3">
								      			<%= user.getAbout() %></textarea></td>
				        				</tr>
				        				<tr>
				        					<th scope="row">Profile pic :</th>
								      		<td><input type="file" class="form-control" name="image"></td>
				        				</tr>
				        				
				        			</table>
				        			<div class="container">
				        				<button type="submit" class="btn btn-outline-primary">Save</button>
				        			</div>
				        		</form>
				        		
				        	</div>
				        	
				        </div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        <button type="button" id="edit-profile-btn" class="btn btn-primary">Edit</button>
				      </div>
				    </div>
				  </div>
				</div>
		
		<!-- end of profile modal -->
		
		
			<!-- JavaScript -->
		<script
		  src="https://code.jquery.com/jquery-3.6.3.min.js"
		  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		  crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<script src="js/myjs.js" type="text/javascript"></script>
		
		<script>
			$(document).ready(function(){
				let editStatus=false;
				$('#edit-profile-btn').click(function(){
					if(editStatus==false){
							$('#prfile-details').hide();
							$('#profile-edit').show();
							editStatus=true;
							$(this).text("Back");
					}else{
							$('#prfile-details').show();
							$('#profile-edit').false();
							editStatus=false;
					}
				})
			});
		</script>
	</body>
</html>