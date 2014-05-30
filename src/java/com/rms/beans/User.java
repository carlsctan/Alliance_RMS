package com.rms.beans;

public class User {
	private String username;
	private String firstname;
	private String middlename;
	private String lastname;
	private String addedon;
	private String password;
	
	public User(String username, String firstname, String middlename, String lastname, String addedon, String password) {
		this.username = username;
		this.firstname = firstname;
		this.middlename = middlename;
		this.lastname = lastname;
		this.addedon = addedon;
		this.password = password;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getFirstname() {
		return firstname;
	}
	
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	
	public String getMiddlename() {
		return middlename;
	}
	
	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}
	
	public String getLastname() {
		return lastname;
	}
	
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	public String getAddedon() {
		return addedon;
	}
	
	public void setAddedon(String addedon) {
		this.addedon = addedon;
	}
}