package com.student.servlets;

import java.io.IOException;

import com.student.dto.student;
import com.student.dao.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/update")
public class Update extends HttpServlet
{
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
{
	   HttpSession session=req.getSession(false);
	   student user=(student)session.getAttribute("Student");
	   studentDAO sdao=new StudentDAOImp1();
	   user.setName(req.getParameter("Name"));
	   user.setPhone(Long.parseLong(req.getParameter("Phone")));
	   user.setMail(req.getParameter("Mail"));
	   user.setBranch(req.getParameter("Branch"));
	   user.setLoc(req.getParameter("Location"));
	   
	  boolean res=sdao.updateStudent(user);
	  if(res)
	  {
		  req.setAttribute("updated","Profile Successfully Updated");
		  RequestDispatcher rd=req.getRequestDispatcher("home.jsp");
		  rd.forward(req,resp);
	  }
	  else
	  {
		  req.setAttribute("updatefailed","Profile not Updated");
		  RequestDispatcher rd=req.getRequestDispatcher("updateAccount.jsp");
		  rd.forward(req,resp);
	  }
}
}
