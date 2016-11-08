package com.cybage.resourcemanagement.dto;

public class AdminHomeResource {
	
	String empid;
	String ename;
	String designation;
	String billing;
	String startdate;
	
	public AdminHomeResource() {
		super();
	}
	public AdminHomeResource(String empid, String ename, String designation, String billing, String startdate) {
		super();
		this.empid = empid;
		this.ename = ename;
		this.designation = designation;
		this.billing = billing;
		this.startdate = startdate;
	}
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getBilling() {
		return billing;
	}
	public void setBilling(String billing) {
		this.billing = billing;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	
	
	
}
