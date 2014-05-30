package com.rms.servlets;

import java.util.*;

import java.sql.*;
import com.rms.beans.*;

import com.opensymphony.xwork2.ActionSupport;

public class ViewUser extends ActionSupport{
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

		ABED db = new ABED();

		db.setDatabase("/alliance_project_outlook", "root", "", "//localhost");
		db.openDatabase();
		
		ResultSet rs;
		
		try {
			rs = db.getStatement().executeQuery("Select * from user ORDER BY username ASC;");

			while(rs.next()){
				
				String username = rs.getString("username");
				String first_name = rs.getString("first_name");
				String middle_name = rs.getString("middle_name");
				String last_name = rs.getString("last_name");
				String added_on = rs.getString("added_on");
				String password = rs.getString("password");
				
				listUser.add(new User(username, first_name, middle_name, last_name, added_on, password));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.closeDatabase();
		
		return "success";
	}
}