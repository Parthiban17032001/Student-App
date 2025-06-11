package com.student.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import com.student.dao.studentDAO;
import com.student.dao.StudentDAOImp1;
import com.student.dto.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/Singup")
public class Singup extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//PrintWriter out=resp.getWriter();
	student s =new student();
	studentDAO sdao=new StudentDAOImp1();
	//String name=req.getParameter("Name");
	//s.setName(name);
	s.setName(req.getParameter("Name"));
	
	//String phone=req.getParameter("phone");
	//long phone1=Long.parseLong(phone);
	//s.setPhone(phone1);
	s.setPhone(Long.parseLong(req.getParameter("Phone")));
	s.setMail(req.getParameter("Mail"));
	s.setBranch(req.getParameter("Branch"));
	s.setLoc(req.getParameter("Location"));
	if(req.getParameter("Password").equals(req.getParameter("CPassword"))) {
		s.setPassword(req.getParameter("Password"));
		
		
		//JDBC LOGIC
		if(sdao.insertStudent(s)) {
			//out.println("<h1>Data Saved Succesfully</h1>");
			req.setAttribute("success","Account successfully Created");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req,resp);
			
		}
		else 
		{
			//out.println("<h1>failed to saved the data</h1>");
			req.setAttribute("error","Failed to Create Account!");
			RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
			rd.forward(req,resp);
		}
	}
  }

}
