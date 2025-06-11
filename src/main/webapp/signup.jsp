<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>SingUp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
	<style>
		.container {
			text-align: center;
		}

		.button {
			height: 20px;
		}
		.error
		{
		color:red;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<form action="Singup" method="post">
					<h1 class="text-primary-emphasis">Pentagon Space</h1>
					<h3 class="text-primary">Application Form</h3>
					 <%String error=(String)request.getAttribute("error");
					 if(error!=null){%>
					 <h3 class="error"><%=error%></h3>
					 <%}%>
					<label>Enter Your
						Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="Name"><br><br>

					<label>Enter the Phone Number</label>
					<input type="text" name="Phone"><br><br>

					<label>Enter the Mail
						ID</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="email" name="Mail"><br><br>

					<label>Enter the
						Branch</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="Branch"><br><br>

					<label>Enter the Location</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="Location"><br><br>

					<label>Enter the Password</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="password" name="Password"><br><br>

					<label>Confirm the Password</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="password" name="CPassword">
					<br><br>
					<input class="btn btn-primary" type="submit" value="Create Account"><br><br>
					<p>already have a account?<a href="login.jsp">login</a></p>
				</form>
			</div>
		</div>
	</div>
</body>

</html>