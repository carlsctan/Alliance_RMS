/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author KurtJunsheanEspinosa
 */
public class LoginForm extends ActionForm {

//Create variables, setter and getter methods for form submission parameters
    private String userName;
    private String password;

    public String getuserName() {
        System.out.println("LoginForm::getuserName()");
        return userName;
    }

    public void setuserName(String user) {
        userName = user;
        System.out.println("LoginForm::setuserName()");
    }

    public String getPassword() {
        return password;
    }
    
    public void setPassword(String pass) {
        password = pass;
        System.out.println("LoginForm::setuserName()");
    }

    public void reset(ActionMapping mapping,
            HttpServletRequest request) {
        System.out.println("LoginForm::reset()");
        userName = null;
        password = null;
    }

    public ActionErrors validate(
            ActionMapping mapping,
            HttpServletRequest request) {
        System.out.println("LoginForm::validate()");
        ActionErrors errors = new ActionErrors();
        if (userName == null || userName.trim().equals("")) {
            errors.add("userName", new ActionMessage("login.userName.error"));
        }

        if (password == null || password.trim().equals("")) {
            errors.add("password", new ActionMessage("login.password.error"));
        }

        return errors;
    }
}