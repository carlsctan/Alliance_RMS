package com.rms.servlets;

import java.util.Calendar;
import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;
import com.rms.beans.ABED;

public class UpdateUser extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	private String first_name;
	private String last_name;
	private String middle_name;
	private String old_password;
	private String new_password;
	private String con_password;
	
	public String getOld_password() {
		return old_password;
	}

	public void setOld_password(String old_password) {
		this.old_password = old_password;
	}
	
	public String getNew_password() {
		return new_password;
	}

	public void setNew_password(String new_password) {
		this.new_password = new_password;
	}

	public String getCon_password() {
		return con_password;
	}

	public void setCon_password(String con_password) {
		this.con_password = con_password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getMiddle_name() {
		return middle_name;
	}

	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}

	public String addUser() {
		ABED db = new ABED();
		
		db.setDatabase("/alliance_project_outlook", "root", "", "//localhost");
		db.addEntry("user","'" + username + "', '" + first_name + "', '" + middle_name + "', '" + last_name + "', '" + password + "', " + 2 + ", '" + Calendar.getInstance().get(Calendar.YEAR) + "-" + (new Date().getMonth() + 1) + "-" + new Date().getDate() + "'","username, first_name, middle_name, last_name, password, user_type, added_on");
		
		return "success";
	}

	public String editUser() {
		ABED db = new ABED();
		
		if(!username.equals("") && !first_name.equals("") && !middle_name.equals("") && !last_name.equals("") && old_password.equals("") && new_password.equals("") && con_password.equals("")) {
			db.setDatabase("/alliance_project_outlook", "root", "", "//localhost");
			
			db.command("update user set username = '" + username + "', first_name = '" + first_name + "', middle_name = '" + middle_name + "', last_name = '"+ last_name + "' where username = '" + username + "'");
			
			System.out.println("update user set username = '" + username + "', first_name = '" + first_name + "', middle_name = '" + middle_name + "', last_name = '"+ last_name + "' where username = '" + username + "'");
		}
		else if(!username.equals("") && !first_name.equals("") && !middle_name.equals("") && !last_name.equals("") && !old_password.equals("") && !new_password.equals("") && !con_password.equals("")) {
			db.setDatabase("/alliance_project_outlook", "root", "", "//localhost");
			
			db.command("update user set username = '" + username + "', first_name = '" + first_name + "', middle_name = '" + middle_name + "', password = '" + password + "', last_name = '"+ last_name + "' where username = '" + username + "'");
			
			System.out.println("update user set username = '" + username + "', first_name = '" + first_name + "', middle_name = '" + middle_name + "', password = '" + new_password + "', last_name = '"+ last_name + "' where username = '" + username + "'");
		}

		return "success";
	}
	
	public String deleteUser() {
		ABED db = new ABED();
		
		db.setDatabase("/alliance_project_outlook", "root", "", "//localhost");
		db.command("delete from user where username = '" + username + "'");
		
		return "success";
	}
}