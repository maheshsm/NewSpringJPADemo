package com.cybage.dao;

import javax.annotation.PostConstruct;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cybage.model.Student;

@Component
@Transactional
public class StudentDao implements IStudentDao 
{
	private SessionFactory sessionFactory;
	private Session session;
	
	@PostConstruct
	public void init()
	{
		System.out.println("In Init Dao . . . ");
	      this.session = sessionFactory.getCurrentSession();
	}
	
	@Autowired
	public StudentDao(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}
	
	public StudentDao()
	{
		System.out.println("In Dao Default constr . . .");
		System.out.println(sessionFactory.getClass());
	}

	@Override
	public Integer addStudent(Student student) 
	{
		Integer id = (Integer) session.save(student);
		
		return id;	
	}
}
