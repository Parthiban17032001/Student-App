<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Date" %>
     <%@page import="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body align='center'>
<%@include file="Header.jsp" %>
<%Date d=new Date();%>
<h1><%=d%>></h1>

<%Random rd=new Random(); %>
<h1><%=rd.nextLong()%></h1>
<%@include file="Footer.jsp" %>
</body>
</html>