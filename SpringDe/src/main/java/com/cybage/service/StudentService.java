package com.cybage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cybage.dao.StudentDao;
import com.cybage.model.Student;

@Service
@Transactional
public class StudentService implements IStudentService 
{
	@Autowired
	private StudentDao personDAO;

	public void setPersonDAO(StudentDao personDAO) {
		this.personDAO = personDAO;
	}
	
	public StudentService()
	{
		System.out.println("In Service");
	}
	
	@Override
	public Integer addStudent(Student student)
	{
		System.out.println("In Service . . ."+student.getCity());
		 return personDAO.addStudent(student);
	}
}
