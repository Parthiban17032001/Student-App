package com.student.servlets;
import com.student.dao.studentDAO;
import com.student.dto.student;

import java.io.IOException;
import java.io.PrintWriter;

import com.student.dao.StudentDAOImp1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/forget")
public class ForgetPassword extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		 studentDAO sdao=new StudentDAOImp1();
		 PrintWriter out=resp.getWriter();
		 student s=sdao.getStudent(Long.parseLong(req.getParameter("phone")),req.getParameter("mail"));
		 if(s!=null)
		 {
				if(req.getParameter("password").equals(req.getParameter("CPassword")))
				{
					s.setPassword(req.getParameter("password"));
					boolean res=sdao.updateStudent(s);
					if(res)
					{
						//out.println("<h1>Password Successfully Updated</h1>");
						req.setAttribute("successful","Successfully Password Updated!");
						RequestDispatcher rs=req.getRequestDispatcher("login.jsp");
						rs.forward(req, resp);
					}
					else
					{
						//out.println("<h1>Failed to update Password!</h1>");
						req.setAttribute("failed","Failed to Updated Password!");
						RequestDispatcher rs=req.getRequestDispatcher("forget_password.jsp");
						rs.forward(req, resp);
					}
				}
				else
				{
					//out.println("<h1>Password MisMatched</h1>");
					req.setAttribute("mismatch","Password MisMatched");
					RequestDispatcher rs=req.getRequestDispatcher("forget_password.jsp");
					rs.forward(req, resp);
				}
			 }
			 else
			 {
				 //out.println("<h1>Check Ones Phone Number and email Id</h1>");
				 req.setAttribute("failed1","Check Ones Phone Number and Email!");
				 RequestDispatcher rs=req.getRequestDispatcher("forget_password.jsp");
				 rs.forward(req, resp);
			 }
	}
}
