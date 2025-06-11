package com.student.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.student.connection.Connector;
import com.student.dto.student;

public class StudentDAOImp1 implements studentDAO
{
    private Connection con;
    int i=0;
    public StudentDAOImp1()
    {
    	this.con=Connector.requestConnection();
    }
    //here,we will be writing all the JDBC logic
	@Override
	public boolean insertStudent(student s) {
		String query="insert into student values(0,?,?,?,?,?,?,sysdate())";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,s.getName());
			ps.setLong(2,s.getPhone());
			ps.setString(3,s.getMail());
			ps.setString(4,s.getBranch());
			ps.setString(5,s.getLoc());
			ps.setString(6,s.getPassword());
			i=ps.executeUpdate();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0)
		{
			return true;
		}
		else
		{
		return false;
		}
	}

	@Override
	public boolean updateStudent(student s) {
		String query="update student set name=?,phone=?,mail=?,Branch=?,location=?,password=? where id=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,s.getName());
			ps.setLong(2,s.getPhone());
			ps.setString(3,s.getMail());
			ps.setString(4,s.getBranch());
			ps.setString(5,s.getLoc());
			ps.setString(6,s.getPassword());
			ps.setInt(7,s.getId());
			i=ps.executeUpdate();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0)
		{
			return true;
		}
		else
		{
		return false;
		}
	}

	@Override
	public boolean deleteStudent(student s) 
	{
		String query="delete from student where id=?";
		int i=0;
			PreparedStatement ps;
			try {
				ps = con.prepareStatement(query);
				ps.setInt(1,s.getId());
				i=ps.executeUpdate();
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(i>0)
			{
				return true;
			}
			else
			{
		        return false;
			}
	}

	@Override
	public student getStudent(String mail, String password) {
		String query="select * from student where mail=? and password=?";
		student s=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,mail);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				s=new student();
				s.setId(rs.getInt("ID"));
				s.setName(rs.getString("Name"));
				s.setPhone(rs.getLong("Phone"));
				s.setMail(rs.getString("mail"));
				s.setBranch(rs.getString("branch"));
				s.setLoc(rs.getString("Location"));
				s.setPassword(rs.getString("password"));
				
			}
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}

	@Override
	public student getStudent(Long phone, String mail) {
		String query="select * from student where phone=? and mail=?";
		PreparedStatement ps;
		student s=null;
		try {
			ps = con.prepareStatement(query);
			ps.setLong(1,phone);
			ps.setString(2,mail);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				s=new student();
				s.setId(rs.getInt("ID"));
				s.setName(rs.getString("Name"));
				s.setPhone(rs.getLong("Phone"));
				s.setMail(rs.getString("mail"));
				s.setBranch(rs.getString("branch"));
				s.setLoc(rs.getString("Location"));
				s.setPassword(rs.getString("password"));
				
			}
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}

	@Override
	public ArrayList<student> getStudent() {
		
	    String query="select * from student where id!=1";
	    ArrayList<student> a=new ArrayList<student>();
	    student s=null;
	    try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				s=new student();	
				//int id=rs.getInt(ID);
				//s.setID(id);
				s.setId(rs.getInt("ID"));
				s.setName(rs.getString("Name"));
				s.setPhone(rs.getLong("Phone"));
				s.setMail(rs.getString("mail"));
				s.setBranch(rs.getString("branch"));
				s.setLoc(rs.getString("Location"));
				s.setPassword(rs.getString("password"));
				
				a.add(s);
			}
		} 
	    catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public student getStudent(String name) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
