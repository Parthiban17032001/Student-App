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
@WebServlet("/delete")
public class deleteUser extends HttpServlet
{
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
  {
	  student s=new student();
	  studentDAO sdao=new StudentDAOImp1();
	  s.setId(Integer.parseInt(req.getParameter("id")));
	  if(sdao.deleteStudent(s))
	  {
		  req.setAttribute("success","User Profile Successfully Deleted");
		  RequestDispatcher rd=req.getRequestDispatcher("viewData.jsp");
		  rd.forward(req, resp);
	  }
	  else
	  {
		  req.setAttribute("error","failed to deleted");
		  RequestDispatcher rd=req.getRequestDispatcher("viewDta.jsp");
		  rd.forward(req, resp);
	  }
  }
}
