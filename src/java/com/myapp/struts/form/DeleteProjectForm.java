/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts.form;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author administrator
 */
public class DeleteProjectForm extends ActionForm {
    private int project_id;

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }
    
}
