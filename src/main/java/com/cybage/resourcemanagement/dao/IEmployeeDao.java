package com.cybage.resourcemanagement.dao;

import java.util.List;

import com.cybage.resourcemanagement.dto.AdminHome;
import com.cybage.resourcemanagement.dto.AdminHomeResource;
import com.cybage.resourcemanagement.model.Employee;
import com.cybage.resourcemanagement.model.ProjectTable;
import com.cybage.resourcemanagement.model.RoleTable;

public interface IEmployeeDao 
{
	
	public Integer getEmployee(String username, String password);
	
	public Object loginEmployee(String username, String password);
	
	public Employee searchEmployee(int rollno);
	
	public Integer addEmployee(Employee employee); 
	
	public List<Employee> listEmployee();
	
	public List<ProjectTable> listProjects() ;
	
	public List<ProjectTable> listManagerProjects(Integer empid);
	
	public List<RoleTable> listRoles() ;

	public List<AdminHomeResource> SearchProjectId(String proj_name,String role);
}
