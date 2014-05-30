package com.rms.servlets;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.rms.beans.*;
import com.opensymphony.xwork2.ActionSupport;

public class EditUser extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	private List<User> listUser;
	 
	public List<User> getListUser() {
		return listUser;
	}
 
	public void setListUser(List<User> listUser) {
		this.listUser = listUser;
	}

	public String execute() throws Exception {
		listUser = new ArrayList<User>();
		
		HttpServletRequest request = ServletActionContext.getRequest();

		ABED db = new ABED();
		
		String data[][] = new String[1][7];
		String username = request.getParameter("username");

		db.setDatabase("/alliance_project_outlook", "root", "", "//localhost");
		db.browseEntry("user", data, 7, "username='"+ username + "'");
			
		listUser.add(new User(data[0][0], data[0][2], data[0][4], data[0][3], data[0][5], data[0][1]));
				
		return "success";
	}
}