<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.student.dto.student"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Update Page</title>
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
		.back
		{
		text-decoration: none;
		color:white;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
		        <%student user1=(student)session.getAttribute("Student");
				if(user1!=null){%>
				<form action="update" method="post">
					<h1 class="text-primary-emphasis">Pentagon Space</h1>
					<h3 class="text-primary">Update Your Account</h3>
					 <%String error=(String)request.getAttribute("error");
					 if(error!=null){%>
					 <h3 class="error"><%=error%></h3>
					 <%}%>
					 <%String NotUpdated=(String)request.getAttribute("updatefailed");
			         if(NotUpdated!=null){%>
			         <h3 class="error"><%=NotUpdated%></h3>
		             <%}%>
					<label>Enter Your Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="Name" value=<%=user1.getName()%>><br><br>

					<label>Enter the Phone Number</label>
					<input type="text" name="Phone" value=<%=user1.getPhone()%>><br><br>

					<label>Enter the Mail ID</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="email" name="Mail" value=<%=user1.getMail()%>><br><br>

					<label>Enter the Branch</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="Branch" value=<%=user1.getBranch()%>><br><br>

					<label>Enter the Location</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="Location" value=<%=user1.getLoc()%>><br><br>
					<input class="btn btn-primary" type="submit" value="Update Account"><br><br>
				    <button type="button" class="btn btn-secondary"><a href="home.jsp" class="back">Back</a></button><br><br>
				    <%}%>
				</form>
			</div>
		</div>
	</div>
</body>

</html>