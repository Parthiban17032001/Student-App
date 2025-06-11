package com.student.servlets;

import java.io.IOException;

import com.student.dao.StudentDAOImp1;
import com.student.dao.studentDAO;
import com.student.dto.student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/reset")
public class resetpassword extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		   HttpSession session=req.getSession(false);
		   student user=(student)session.getAttribute("Student");
		   studentDAO sdao=new StudentDAOImp1();
		   if(req.getParameter("password").equals(req.getParameter("CPassword")))
		   {
			   user.setPassword(req.getParameter("password"));
			   boolean res=sdao.updateStudent(user);
			   if(res)
			   {
				   req.setAttribute("success","Your Password Successfully reseted");
				   RequestDispatcher rd=req.getRequestDispatcher("home.jsp");
				   rd.forward(req, resp);
			   }
			   else
			   {
				   req.setAttribute("failedreset","Failed to Reset Password");
				   RequestDispatcher rd=req.getRequestDispatcher("resetPassword.jsp");
				   rd.forward(req, resp);
			   }
		   }
		   else
		   {
			   req.setAttribute("mismatch","Password is Mismatched");
			   RequestDispatcher rd=req.getRequestDispatcher("resetPassword.jsp");
			   rd.forward(req, resp);
		   }
	}

}
