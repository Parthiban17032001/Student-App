<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
<style>
	body
	{
		text-align: center;
	}
	form
	{
		margin-top: 150px;
	}
	#Forget
	{
		margin-left:180px;
	}
	.login
	{
		width: 100px;
	}
	.success
		{
		color:green;
		}
		.error
		{
		color:red;
		}
		a
		{
		color:blue;
		text-decoration:none;
		}
		a:hover
		{
		color:green;
		}
</style>
</head>
<body>
    <form action="Login" method="post">
		<h1 class="text-primary-emphasis">Pentagon Space</h1>
		<h3 class="text-primary">Login Page</h3>
			<%String successmessage=(String)request.getAttribute("success");
					 if(successmessage!=null){%>
					<h3 class="success"><%=successmessage%></h3> 
					 <%}%>
			<%String successfullyUpdated=(String)request.getAttribute("successful");
			if(successfullyUpdated!=null){%>
			<h3 class="success"><%=successfullyUpdated%></h3>
			<%}%>
			<%String failed=(String)request.getAttribute("loginfailed");
			if(failed!=null){%>
			<h3 class="error"><%=failed%></h3>
			<%}%>
			<%String logout=(String)request.getAttribute("logout");
			if(logout!=null){%>
			<h3 class="success"><%=logout%></h3>
			<%}%>
		<br>
		<label>Enter the Email</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="mail"  required>
		<br>
		<br>
		<label>Enter the Password</label>
		<input type="password" name="password"  required>
		<br><br>
		<p id="Forget"><a href="forget_password.jsp">Forget Password?</a></p>
		<input type="submit" value="login" class="btn btn-success login">
		<br><br>
		<p>Don't have Account <a href="signup.jsp">SignUp</a></p>
	</form>
</body>
</html>