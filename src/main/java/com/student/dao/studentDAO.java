package com.student.dao;
import com.student.dto.student;
import java.util.*;
public interface studentDAO
{
   public boolean insertStudent(student s);
   public boolean updateStudent(student s);
   public boolean deleteStudent(student s);
   public student getStudent(String mail,String password);
   public student getStudent(Long phone,String  mail);
   public ArrayList<student> getStudent();
   public student getStudent(String name);
}
