package com.rms.servlets;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.rms.beans.ABED;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CheckUser extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
    private String[][] pass = new String[1][7];

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
	
	public String[][] getPass() {
		return pass;
	}

	public void setPass(String[][] pass) {
		this.pass = pass;
	}

	public String checkUser() {
    	ABED db = new ABED();
		
		db.setDatabase("/alliance_project_outlook", "root", "", "//localhost");
		db.browseEntry("user", pass, 7, "username = '" + username + "'");
        
        if (password.equals(pass[0][1]) && !(password.equals(""))) {
        	HttpSession session = ServletActionContext.getRequest().getSession();
        	session.setAttribute("username", username);
        	session.setAttribute("password", password);
        	session.setAttribute("usertype", pass[0][6]);
        	session.setMaxInactiveInterval(30 * 60);
        	
            return "isValid";
        } else {
            addActionError("Username or Password is incorrect!");
            return "isNotValid";
        }
    }
}