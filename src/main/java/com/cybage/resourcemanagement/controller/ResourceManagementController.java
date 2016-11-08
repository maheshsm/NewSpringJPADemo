package com.cybage.resourcemanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.cybage.resourcemanagement.dto.AdminHome;
import com.cybage.resourcemanagement.dto.AdminHomeResource;
import com.cybage.resourcemanagement.model.Employee;
import com.cybage.resourcemanagement.model.ProjectTable;
import com.cybage.resourcemanagement.model.RoleTable;
import com.cybage.resourcemanagement.service.IEmployeeService;



@RestController
public class ResourceManagementController 
{
	Employee emp;
	String username;
	String password;

	@Autowired
	IEmployeeService employeeService;


	@RequestMapping(value = "/employees/", method = RequestMethod.GET)
	public ResponseEntity<List<Employee>> listAllUsers() 
	{
		System.out.println("In List Resource Controller . . . ");
		List<Employee> users = employeeService.listEmployee();

		return new ResponseEntity<List<Employee>>(users, HttpStatus.OK);
	}

	@RequestMapping(value = "/projects/", method = RequestMethod.GET)
	public ResponseEntity<List<ProjectTable>> listAllProjects() 
	{
		System.out.println("In List Resource Controller . . . ");
		List<ProjectTable> projects = employeeService.listProjects();

		return new ResponseEntity<List<ProjectTable>>(projects, HttpStatus.OK);
	}

	@RequestMapping(value = "/roles/", method = RequestMethod.GET)
	public ResponseEntity<List<RoleTable>> listAllRoles() 
	{
		System.out.println("In List Resource Controller . . . ");
		List<RoleTable> projects = employeeService.listRoles();

		return new ResponseEntity<List<RoleTable>>(projects, HttpStatus.OK);
	}

	@RequestMapping(value = "/login/", method = RequestMethod.POST)
	public ResponseEntity<Void> loginEmployee(@RequestBody Employee employee, UriComponentsBuilder ucBuilder) 
	{
		System.out.println("In login Resource Controller . . . "+employee.getUsername()+""+employee.getPassword());

		username = employee.getUsername();
		password = employee.getPassword();

		emp  = (Employee) employeeService.loginEmployee(username, password);

		System.out.println("Employee Id : ---------------------"+emp);

		HttpHeaders headers = new HttpHeaders();

		return new ResponseEntity<Void> (headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/loginSuccess/", method = RequestMethod.GET)
	public ResponseEntity<Employee> loginSuccess() 
	{
		return new ResponseEntity<Employee> (emp, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/loginManagerSuccess/", method = RequestMethod.GET)
	public ResponseEntity<List<ProjectTable>> loginManagerSuccess() 
	{
		System.out.println("In List Resource Controller . . . ");
		List<ProjectTable> projects = employeeService.listManagerProjects(emp.getEmpid());

		return new ResponseEntity<List<ProjectTable>>(projects, HttpStatus.OK);	}

	

	@RequestMapping(value = "/SearchProjectId/", method = RequestMethod.POST)
	public  ResponseEntity<List<AdminHomeResource>> SearchProjectId(@RequestBody AdminHome adminhome, UriComponentsBuilder ucBuilder) 
	{
		System.out.println("In controller");
		System.out.println(adminhome.getProj_name());
		System.out.println(adminhome.getRole());

		String proj_name = adminhome.getProj_name();
		String role = adminhome.getRole();

		List<AdminHomeResource> project_resource = employeeService.SearchProjectId(proj_name,role);
		/*
		for (Object obj : project_resource) {
	            Object[] o = (Object[]) obj;
	            String empid =  String.valueOf(o[0]);
	            String ename =  String.valueOf(o[1]);
	            String designation =  String.valueOf(o[2]);
	            String billing =  String.valueOf(o[3]);
	            String startdate =  String.valueOf(o[4]);
	            System.out.println("Resource Details -------------\n " + empid +"   " + ename +"   " + designation +"   " + billing +"   " + startdate);
	        }	
		 */

		return  new ResponseEntity<List<AdminHomeResource>>(project_resource, HttpStatus.OK);

	}




}