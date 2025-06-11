<%@page import="com.student.dao.studentDAO"%>
<%@page import="com.student.dao.StudentDAOImp1"%>
<%@page import="com.student.dto.student"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
<style type="text/css">
  .table
  {
  width:100vw;
  }
  .success
  {
  color:green;
  }
  .head
  {
           width:100%;
            height:60px;
            background-color:black;
            display: flex;
            align-items: center;
  }
  button
  {
  margin-left:1100px;
  }
  a
  {
   text-decoration: none;
   color:white;
  }
</style>
</head>
<body>
 <%student user=(student)session.getAttribute("Student");
        if(user!=null){%>
        <div class="head">
        <h4 style="color:white">Welcome Admin:</h4>&nbsp;&nbsp;&nbsp;
        <h4 class="success"><%=user.getName()%></h4>
        <button type="button" class="btn btn-secondary back"><a href="home.jsp">Back</a></button><br><br>
        </div>
        <h1><center>Student Data</center></h1>
        <%String success=(String)request.getAttribute("success");
        if(success!=null){%>
        <h2 style="color:green"><center><%=success%></center></h2>
        <%}%>
        <%String error=(String)request.getAttribute("error");
        if(error!=null){%>
        <h2 style="color:red"><center><%=error%></center></h2>
        <%}%>
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
 <%studentDAO sdao=new StudentDAOImp1();
 ArrayList<student> studentList=sdao.getStudent();
 for(student s:studentList){%>
    <td><%=s.getId()%></td>
    <td><%=s.getName()%></td>
    <td><%=s.getPhone()%></td>
    <td><%=s.getMail()%></td>
    <td><%=s.getBranch()%></td>
    <td><%=s.getLoc()%></td>
    <td>
      <form action="delete" method="POST">
       <input type="hidden" name="id" class="btn btn-secondary" value=<%=s.getId()%>>
       <input type="submit" value="delete"  class="btn btn-danger">
       </form>
    </td>
 </tr>
 <%}%>
</table>
<%}%>
</body>
</html>