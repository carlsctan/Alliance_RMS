package com.rms.servlets;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.rms.beans.ABED;

public class UpdateProject extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private String projectname;
	private String from;
	private String to;
	private String status;
	private String businessunit;
	private Integer projectid;
	private String projecttype;
	private String resourcesneeded;
	private String remarks;
	
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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

	public Integer getProjectid() {
		return projectid;
	}

	public void setProjectid(Integer projectid) {
		this.projectid = projectid;
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

	public String addProject() {
		ABED db = new ABED();
		
		db.setDatabase("/alliance_project_outlook", "root", "", "//localhost");
		db.addEntry("project","'" + projectname + "', '" + from + "', '" + to + "', '" + status + "', '" + businessunit + "', '" + projecttype + "', '" + remarks + "', '" + resourcesneeded + "'","project_name, project_start_date, project_end_date, project_status, business_unit, project_type, remarks, resources_needed");
		
		return "success";
	}
	
	public String editProject() {
		ABED db = new ABED();
		
		db.setDatabase("/alliance_project_outlook", "root", "", "//localhost");
		db.command("update project set project_name = '" + projectname + "', project_start_date = '" + from + "', project_end_date = '" + to + "', business_unit = '"+ businessunit + "', project_type = '" + projecttype + "', resources_needed = '" + resourcesneeded + "', remarks = '" + remarks + "', project_status = '" + status + "' where project_id = " + projectid);

		return "success";
	}
	
	public String deleteProject() {
		ABED db = new ABED();
		
		db.setDatabase("/alliance_project_outlook", "root", "", "//localhost");
		db.command("delete from project where project_name = '" + projectname + "'");
		
		return "success";
	}
}