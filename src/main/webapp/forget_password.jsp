<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forget Password</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
<style>
	form
	{
		text-align: center;
		margin-top:100px;
	}
	.reset
	{
		width:100px;
	}
		.error
		{
		color:red;
		}
</style>
</head>
<body>
     <form action="forget" method="post">
		 <h1 class="text-primary-emphasis">Pentagon Space</h1>
		<h3 class="text-primary">Reset Your Page Password</h3>
		<%String failedmessage=(String)request.getAttribute("failed");
		if(failedmessage!=null){%>
		<h3 class="error"><%=failedmessage%></h3>
		<%}%>
		<%String failedmessage1=(String)request.getAttribute("failed1");
		if(failedmessage1!=null){%>
		<h3 class="error"><%=failedmessage1%></h3>
		<%}%>
		<%String failedmessage2=(String)request.getAttribute("mismatch");
		if(failedmessage2!=null){%>
		<h3 class="error"><%=failedmessage2%></h3>
		<%}%>
		<label>Enter the Email</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="mail"  required>
		<br><br>
		<label>Enter the Phone</label>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="tel" name="phone"  required>
		<br><br>
		<label>New Password</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="password" name="password"  required>
		<br><br>
		<label>Confirm Password</label>
		<input type="password" name="CPassword"  required>
		<br><br>
		<input type="submit" value="Reset" class="btn btn-primary reset">
	 </form>
</body>
</html>