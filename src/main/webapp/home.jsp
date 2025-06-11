
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="com.student.dto.student"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    <style>
        .head
        {
            width:100%;
            height:60px;
            background-color:black;
            display: flex;
            align-items: center;
        }
        ul
        {
            display: flex;
            list-style: none;
            margin-left:900px;
            margin-right:30px;
            margin-top: 15px;
        }
        li
        {
            margin-left:10px;
            color: white;
        }
        .logout
        {
           height:50px;
        }
        .table
        {
            width:100vw;
        }
        .success
        {
        color:green;
        }
        a
        {
        color:white;
        text-decoration:none;
        }
    </style>
</head>
<body>
    <div class="head">
        <%student user=(student)session.getAttribute("Student");
        if(user!=null){%>
        
        <h4 style="color:white">Welcome</h4>&nbsp;&nbsp;&nbsp;
        <h4 class="success"><%=user.getName()%></h4>
        <ul>
           <% if(user.getId()==1){%>
            <li><a href="viewData.jsp">ViewData</a></li>
            <%}%>
            <li><a href="resetPassword.jsp">ResetPassword</a></li>
            <li><a href="updateAccount.jsp">UpdateData</a></li>
        </ul>
        <form action="logout" method="post">
        <input type="submit" value="LogOut" class="btn btn-danger logout">
        </form>
    </div>
    <div class="main">
        <h1><center>Dashboard</center></h1>
        
            <%String successfullyUpdated=(String)request.getAttribute("updated");
			if(successfullyUpdated!=null){%>
			<h3 class="success"><center><%=successfullyUpdated%></center></h3>
			<%}%>
			 <%String successfullyReseted=(String)request.getAttribute("success");
			if(successfullyReseted!=null){%>
			<h3 class="success"><center><%=successfullyReseted%></center></h3>
			<%}%>
        <h3>View Your Data</h3>
        <table class="table">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Mail ID</th>
                <th>Branch</th>
                <th>Location</th>
            </tr>
            <tr>
                <td><%=user.getId()%></td>
                <td><%=user.getName()%></td>
                <td><%=user.getPhone()%></td>
                <td><%=user.getMail()%></td>
                <td><%=user.getBranch()%></td>
                <td><%=user.getLoc()%></td>
            </tr>
        </table>
    </div>
    <%}%>
</body>
</html>