package com.cybage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cybage.model.Student;
import com.cybage.service.StudentService;


@Controller
@RequestMapping("/home")
public class FormController 
{
	@Autowired(required=true)
	StudentService is;
	
	@RequestMapping(value="/Registration")
	public ModelAndView registerStudent(@ModelAttribute("Student")Student student,ModelMap model) 
	{
		System.out.println("In Controller");
		System.out.println(student.getFirstname());
		model.addAttribute("rollNo", student.getRollno());
		model.addAttribute("firstName", student.getFirstname());
		model.addAttribute("lastName",  student.getFirstname());
		model.addAttribute("marks", student.getMarks());
		model.addAttribute("city", student.getCity());
		
		
		return new ModelAndView("Registration","Student",new Student());
	}

	@RequestMapping("/status")
	public String registerStatus(@ModelAttribute("Student")Student student)
	{
		if(student.getRollno() != 0)
		System.out.println("In Status Method . . ."+student.getRollno());
		
		System.out.println("In Saving If . . . "+student.getRollno()+""+student.getFirstname()+""+student.getLastname());
		Integer id = is.addStudent(student);
		System.out.println(id);
		return "success";

	}
}