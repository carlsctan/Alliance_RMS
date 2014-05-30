package com.rms.servlets;

import java.util.*;

import java.sql.*;
import com.rms.beans.*;

import com.opensymphony.xwork2.ActionSupport;

public class ViewProject extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	private List<Project> listProject;

	public List<Project> getListProject() {
		return listProject;
	}
 
	public void setListProject(List<Project> listProject) {
		this.listProject = listProject;
	}

	public String execute() throws Exception {
		listProject = new ArrayList<Project>();

		ABED db = new ABED();

		db.setDatabase("/alliance_project_outlook", "root", "", "//localhost");
		db.openDatabase();
		
		ResultSet rs;
		
		try {
			rs = db.getStatement().executeQuery("Select * from project ORDER BY project_name ASC;");

			while(rs.next()){
				
				Integer project_id = rs.getInt("project_id");
				String project_name = rs.getString("project_name");
				String start_date = rs.getString("project_start_date");
				String end_date = rs.getString("project_end_date");
				String project_type = rs.getString("project_type");
				String project_status = rs.getString("project_status");
				String business_unit = rs.getString("business_unit");
				String resources_needed = rs.getString("resources_needed");
				
				listProject.add(new Project(project_name, start_date, end_date, project_type, project_status, business_unit, resources_needed, project_id));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeDatabase();
		
		return "success";
	}
}