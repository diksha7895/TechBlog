<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Error</title>
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
		<div class="container text-center">
			<img class="img-fluid" src="images/errors.png" style="height:50vh">
			<h4 class="display-4">Sorry! Something went wrong.</h4>
			<%= exception %>
			<a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
		</div>
	
	</body>
</html>