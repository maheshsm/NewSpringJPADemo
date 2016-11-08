package com.cybage.resourcemanagement.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cybage.resourcemanagement.dto.AdminHome;
import com.cybage.resourcemanagement.dto.AdminHomeResource;
import com.cybage.resourcemanagement.model.Employee;
import com.cybage.resourcemanagement.model.ProjectTable;
import com.cybage.resourcemanagement.model.RoleTable;


@Repository("empDAO")
public class EmployeeDao implements IEmployeeDao 
{
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session	session;
	
	public EmployeeDao()
	{
		System.out.println("In Dao Default constr . . .");
	}

	public Integer getEmployee(String username, String password) 
	{
		session =  sessionFactory.getCurrentSession();
		System.out.println(username+""+password);
		String hql = "from employee where employee.username = 'username' and employee.password = 'password'";
		Query query = session.createQuery(hql);
		int id = query.executeUpdate();
		System.out.println("Record Updated : "+id);
		return id;
	}
	
	public Object loginEmployee(String username, String password) 
	{
		session =  sessionFactory.getCurrentSession();
		System.out.println(username+"\n"+password);
		String hql = "from Employee where username =:username and password =:password";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		query.setParameter("password", password);
		Employee emp = (Employee) query.uniqueResult();
		if(emp == null)
			return 0;
		
		String hql1 = "from Employee where username =:username and password =:password and desigination=:desigination";
		Query query1 = session.createQuery(hql1);
		query1.setParameter("username", username);
		query1.setParameter("password", password);
		
		if(emp.getDesigination().equals("manager")||emp.getDesigination().equals("admin"))
		{
			query1.setParameter("desigination",emp.getDesigination());
			return emp;
		}
		
		String hql2 = "select RPT.projectTable.proj_id,RPT.projectTable.proj_name from ResourceProjectTable RPT where RPT.employee.empid =:id";	  
		Query query2 = session.createQuery(hql2);
		query2.setParameter("id", emp.getEmpid());
		
        List<Object> objs = (List<Object>)query2.list();
        for (Object obj : objs) {
            Object[] o = (Object[]) obj;
            String proj_id =  String.valueOf(o[0]);
            String proj_name =  String.valueOf(o[1]);
            System.out.println(proj_id +"   " + proj_name );
        }
        
    	return null;
	}
	
	public Employee searchEmployee(int rollno)
	{
		 session = sessionFactory.getCurrentSession();
		
		 Employee s = (Employee) session.get(Employee.class, rollno);
		 return s;
	}
	
	public Integer addEmployee(Employee employee) 
	{
		Integer id = (Integer) sessionFactory.getCurrentSession().save(employee);
		System.out.println("Object Saved");
		return id;	
	}
	
	public List<Employee> listEmployee() 
	{
		 session = sessionFactory.getCurrentSession();
		
		List<Employee> personsList = session.createQuery("from Employee").list();
		
		return personsList;
	}
	
	public List<ProjectTable> listProjects() 
	{
		session = sessionFactory.getCurrentSession();
		
		List<ProjectTable> projectLlist = session.createQuery("from ProjectTable").list();
		
		return projectLlist;
	}
	
	public List<ProjectTable> listManagerProjects(Integer empid)
	{
		System.out.println("In Project DAO");
		session = sessionFactory.getCurrentSession();
		
		System.out.println("In Dao Id : ----------->"+empid);
		List<ProjectTable> projectlist=session.createQuery
				(" select new com.cybage.resourcemanagement.model.ProjectTable(RPT.projectTable.proj_name)"
						+ " from ResourceProjectTable RPT where RPT.employee.empid =:empid ")
                .setParameter("empid", empid)
                .list();
		return projectlist;
	}
	
	public List<RoleTable> listRoles() 
	{
		 session = sessionFactory.getCurrentSession();
		
		List<RoleTable> roleList = session.createQuery("from RoleTable").list();
		
		return roleList;
	}

	

	public List<AdminHomeResource> SearchProjectId(String proj_name,String role) {
		
		session =  sessionFactory.getCurrentSession();
		System.out.println("In DAO Layer");
		String hql = "from ProjectTable where proj_name =:proj_name";
		Query query = session.createQuery(hql);
		query.setParameter("proj_name", proj_name);
		ProjectTable proj = (ProjectTable) query.uniqueResult();
		System.out.println(proj.getProj_id());
		String hql1 = "select e.empid,e.ename,e.desigination,rp.billing,"
                + "rp.start_date from ResourceProjectTable rp inner join "
                + "rp.employee e inner join rp.projectTable p, "
                + "RoleTable rtbl where p.proj_name=:projName and "
                + "rtbl.role=:role and rtbl.employee.empid=e.empid ";
       
		
		
		//String hql1 = "select RPT.employee.empid,RPT.employee.ename,RPT.employee.desigination,RPT.billing,RPT.start_date from ResourceProjectTable RPT where RPT.projectTable.proj_id =:id";	  
		
		
		
		Query query1 = session.createQuery(hql1);
		 query1.setParameter("projName",proj_name) ;
	     query1.setParameter("role",role );
		// query1.setParameter("id", proj.getProj_id());
        List<Object[]> objs = query1.list();
       
        List<AdminHomeResource> adminresourcelist= new ArrayList<AdminHomeResource>();
        
        for (Object[] aRow : objs) {
           adminresourcelist.add(new AdminHomeResource(String.valueOf(aRow[0]),String.valueOf(aRow[1]),String.valueOf(aRow[2]),String.valueOf(aRow[3]),String.valueOf(aRow[4])));
        }
        System.out.println(adminresourcelist);
		return adminresourcelist;
		
	//	return proj.getProj_id();
	}
	

	
}
