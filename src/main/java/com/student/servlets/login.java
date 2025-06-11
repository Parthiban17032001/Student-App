package com.student.servlets;
import java.io.IOException;
import java.io.PrintWriter;

import com.student.dto.student;
import com.student.dao.studentDAO;
import com.student.dao.StudentDAOImp1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(urlPatterns="/Login",loadOnStartup=5)
public class login extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		HttpSession session=req.getSession(true);
		//student s=new student();
		studentDAO sdao=new StudentDAOImp1();
		 //PrintWriter responce=resp.getWriter();
		String email=req.getParameter("mail");
		// s.setMail(email);
		 String pass=req.getParameter("password");
	     //s.setPassword(pass);
	     
	     student s1=sdao.getStudent(email, pass);
	     if(s1!=null)
	     {
		     //responce.println("<h1 style=\"color:green;\">Login successful,Welcome "+email+"</h1>");
	    	 session.setAttribute("Student",s1);
	    	 req.setAttribute("success","Login Successful");
	    	 RequestDispatcher rs=req.getRequestDispatcher("home.jsp");
	    	 rs.forward(req,resp);
	     }
	     else
	     {
	    	 //responce.println("<h1 style=\"color:green;\">Invalid Crediantial</h1>");
	    	 req.setAttribute("loginfailed","Invalid Crediantial");
	    	 RequestDispatcher rs=req.getRequestDispatcher("login.jsp");
	    	 rs.forward(req, resp);
	     }
	}
	
}
