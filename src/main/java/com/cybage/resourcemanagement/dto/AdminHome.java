package com.cybage.resourcemanagement.dto;

public class AdminHome {
	String proj_name;
	String role;
	public AdminHome() {
		super();
	}
	public AdminHome(String proj_name, String role) {
		super();
		this.proj_name = proj_name;
		this.role = role;
	}
	public String getProj_name() {
		return proj_name;
	}
	public void setProj_name(String proj_name) {
		this.proj_name = proj_name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
	
	
}
