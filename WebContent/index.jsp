<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<title>TechBlog</title>
			
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
	<!-- home navbar -->
	<%@include file="home_navbar.jsp" %>
	<!-- banner -->
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-background text-white banner-background">
			<div class="container">
				<h4 class="display-4"> Welcome to TechBlog</h4>
				
				<p> Welcome to technical blog, world of technology...</p>
				<p> Technical blog writing is a form of content writing which is more focused on engaging the audience with articles of high quality and getting more traffic to the websites. Technical bloggers write on topics with fine details of technical operations and focus on what the audience is interested in.</p>
			
				<a href="Register.jsp" class="btn btn-outline-light"><span class="fa fa-user-plus"></span> Start, It's free.</a>
				<a href="Login.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle fa-spin"></span> Login</a>
			</div>	
		</div>
	</div>
	<!-- cards -->
	
		<div class="container">
			<div class="row mb-2">
				<div class="col-md-4">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
				</div>
				
			</div>
			
			
			<div class="row">
				<div class="col-md-4">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
				</div>
				
			</div>
		</div>
	
	
	
	<!-- JavaScript -->
	<script
	  src="https://code.jquery.com/jquery-3.6.3.min.js"
	  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	  crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	

	
</body>
</html>