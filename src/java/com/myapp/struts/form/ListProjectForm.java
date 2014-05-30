/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.form;

import com.myapp.struts.data.Project;
import java.util.ArrayList;
import java.util.List;
import org.apache.struts.action.ActionForm;

/**
 *
 * @author Ma.NelleYap
 */
public class ListProjectForm extends ActionForm{
    
    private List<Project> proj=new ArrayList<Project>();

    public ListProjectForm() {
	        super();
    }
    public List<Project> getProj() {
        return proj;
    }

    public void setProj(List<Project> proj) {
        this.proj = proj;
    }

    
}
	 

	 
	 

	 
	 

