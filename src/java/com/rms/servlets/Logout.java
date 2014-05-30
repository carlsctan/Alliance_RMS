package com.rms.servlets;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class Logout extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	public String execute() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession(false);
		
		session.setMaxInactiveInterval(0);
		session.invalidate();
		
		return "success";
	}
}