package com.cybage.service;

import org.springframework.stereotype.Service;

import com.cybage.model.Student;

@Service
public interface IStudentService 
{
	public Integer addStudent(Student student);
}
