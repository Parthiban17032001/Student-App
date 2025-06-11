<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.student.dto.student"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</head>
<style>
body
{
text-align:center;
margin-top:100px;
}
	.back
		{
		text-decoration: none;
		color:white;
		}
		.error
		{
		color:red;
		}
</style>
<body>
     <form action="reset" method="post">
     <h1 class="text-primary-emphasis">Pentagon Space</h1>
	 <h3 class="text-primary">Reset Your Password</h3>
	 <%String messege=(String)request.getAttribute("failedreset");
	 if(messege!=null){%>
	 <h2 class="error"><%=messege%></h2>
	 <%}%>
	  <%String mismatched=(String)request.getAttribute("mismatch");
	 if(mismatched!=null){%>
	 <h2 class="error"><%=mismatched%></h2>
	 <%}%>
	 <%student user=(student)session.getAttribute("Student");
	 if(user!=null){%>
	    <label>Your Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="Name" value=<%=user.getName()%>><br><br>
	    <label>Your Phone Number</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="Phone" value=<%=user.getPhone()%>><br><br>
        <label>New Password</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="password" name="password"  required>
		<br><br>
		<label>Confirm Password</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="password" name="CPassword"  required>
		<br><br>
		<input type="submit" value="Reset" class="btn btn-primary reset">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-secondary"><a href="home.jsp" class="back">Back</a>
		<%}%>
	</form>
</body>
</html>