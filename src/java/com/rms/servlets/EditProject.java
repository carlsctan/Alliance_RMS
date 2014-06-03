package com.rms.servlets;

import com.google.gson.Gson;
import com.myapp.data.EmployeeDAO;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.rms.beans.*;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletResponse;

public class EditProject extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	private List<Project> listProject;
	private List<Status> listStatus;
	private List<Status> listUnit;
	private List<Status> listType;
	 
	public List<Status> getListType() {
		return listType;
	}

	public void setListType(List<Status> listType) {
		this.listType = listType;
	}

	public List<Status> getListUnit() {
		return listUnit;
	}

	public void setListUnit(List<Status> listUnit) {
		this.listUnit = listUnit;
	}

	public List<Status> getListStatus() {
		return listStatus;
	}

	public void setListStatus(List<Status> listStatus) {
		this.listStatus = listStatus;
	}
	 
	public List<Project> getListProject() {
		return listProject;
	}
 
	public void setListProject(List<Project> listProject) {
		this.listProject = listProject;
	}

	public String execute() throws Exception {
		listProject = new ArrayList<Project>();
		listStatus = new ArrayList<Status>();
		listUnit = new ArrayList<Status>();
		listType = new ArrayList<Status>();
		
                HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession(false);

		ABED db = new ABED();
		
		String data[][] = new String[1][9];
		int id = Integer.parseInt(request.getParameter("project_id").toString());

		db.setDatabase("/alliance_project_outlook", "root", "", "//localhost");
		db.browseEntry("project", data, 9, "project_id="+ id);
		String json=null;
                Gson gson = new Gson();
                try {          
                    listProject.add(new Project(data[0][1], data[0][2], data[0][3], data[0][4], data[0][5], data[0][6], data[0][7], Integer.parseInt(data[0][0]), data[0][8]));
                    json = gson.toJson(listProject);
                    response.setContentType("text/plain");  
                    response.setCharacterEncoding("UTF-8"); 
                    response.getWriter().write(json); 

                }catch (Exception ex) {
                    ex.printStackTrace();
                }
                
		if(data[0][5].equals("no movement"))
			listStatus.add(new Status("no movement", "selected"));
		else
			listStatus.add(new Status("no movement", ""));
		if(data[0][5].equals("proposal"))
			listStatus.add(new Status("proposal", "selected"));
		else
			listStatus.add(new Status("proposal", ""));
		if(data[0][5].equals("official"))
			listStatus.add(new Status("official", "selected"));
		else
			listStatus.add(new Status("official", ""));
		if(data[0][5].equals("verbal go"))
			listStatus.add(new Status("verbal go", "selected"));
		else
			listStatus.add(new Status("verbal go", ""));
		if(data[0][5].equals("for_est"))
			listStatus.add(new Status("for_est", "selected"));
		else
			listStatus.add(new Status("for_est", ""));
		if(data[0][5].equals("ongoing_est"))
			listStatus.add(new Status("ongoing_est", "selected"));
		else
			listStatus.add(new Status("ongoing_est", ""));
		if(data[0][5].equals("dropped"))
			listStatus.add(new Status("dropped", "selected"));
		else
			listStatus.add(new Status("dropped", ""));
		
		if(data[0][6].equals("Local"))
			listUnit.add(new Status("Local", "selected"));
		else
			listUnit.add(new Status("Local", ""));
		if(data[0][6].equals("JP Independent"))
			listUnit.add(new Status("JP Independent", "selected"));
		else
			listUnit.add(new Status("JP Independent", ""));
		if(data[0][6].equals("Row"))
			listUnit.add(new Status("Row", "selected"));
		else
			listUnit.add(new Status("Row", ""));
		if(data[0][6].equals("Alliance"))
			listUnit.add(new Status("Alliance", "selected"));
		else
			listUnit.add(new Status("Alliance", ""));
		
		if(data[0][4].equals("Project-Based"))
			listType.add(new Status("Project-Based", "selected"));
		else
			listType.add(new Status("Project-Based", ""));
		if(data[0][4].equals("Time and Material"))
			listType.add(new Status("Time and Material", "selected"));
		else
			listType.add(new Status("Time and Material", ""));
		
		return null;
	}
}