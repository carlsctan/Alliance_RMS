package com.rms.beans;

public class Project {
	private String projectname;
	private String from;
	private String to;
	private String status;
	private String businessunit;
	private Integer projectid;
	private String projecttype;
	private String resourcesneeded;
	private String remarks;
	
	public Project(String projectname, String from, String to, String projecttype, String status, String businessunit, String resourcesneeded, Integer projectid) {
		this.projectname = projectname;
		this.from = from;
		this.to = to;
		this.projecttype = projecttype;
		this.status = status;
		this.businessunit = businessunit;
		this.resourcesneeded = resourcesneeded;
		this.projectid = projectid;
	}
	
	public Project(String projectname, String from, String to, String projecttype, String status, String businessunit, String resourcesneeded, Integer projectid, String remarks) {
		this.projectname = projectname;
		this.from = from;
		this.to = to;
		this.projecttype = projecttype;
		this.status = status;
		this.businessunit = businessunit;
		this.resourcesneeded = resourcesneeded;
		this.projectid = projectid;
		this.remarks = remarks;
	}
	
	public String getRemarks() {
		return remarks;
	}
	
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public String getProjectname() {
		return projectname;
	}
	
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	
	public String getFrom() {
		return from;
	}
	
	public void setFrom(String from) {
		this.from = from;
	}
	
	public String getTo() {
		return to;
	}
	
	public void setTo(String to) {
		this.to = to;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getBusinessunit() {
		return businessunit;
	}
	
	public void setBusinessunit(String businessunit) {
		this.businessunit = businessunit;
	}
	
	public Integer getProjectid() {
		return projectid;
	}
	
	public void setProjectid(Integer projectid) {
		this.projectid = projectid;
	}
	
	public String getProjecttype() {
		return projecttype;
	}
	
	public void setProjecttype(String projecttype) {
		this.projecttype = projecttype;
	}
	
	public String getResourcesneeded() {
		return resourcesneeded;
	}
	
	public void setResourcesneeded(String resourcesneeded) {
		this.resourcesneeded = resourcesneeded;
	}
}