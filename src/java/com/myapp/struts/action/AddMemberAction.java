/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.action;
import com.myapp.struts.data.*;
import com.myapp.struts.form.MemberForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import java.sql.*;
/**
 *
 * @author Ma.NelleYap
 */
public class AddMemberAction extends Action{
    public ActionForward execute(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        System.out.println("UserLoginAction::execute()");
        //get the form value for username
        Connection conn;
        ResultSet rs, ra;
        DBconnection db= new DBconnection(); 
        MemberForm mem = (MemberForm)form;
        int member = mem.getMember();
        String sql;
        conn=db.toConnect();
        sql= "SELECT * from employee join member on employee.EmpIDNum=member.emp_id join memlist on " 
        + "memlist.mem_id = member.mem_id where employee.EmpIDNum=" + member + " && memlist.proj_id=" + mem.getProj_id();
        db.setSql(sql);
        db.executeQuery(conn);
        try{
        ra = db.getRs();
        if(ra.next() == false){
         sql= "INSERT INTO `member`(`emp_id`)" 
                   + " VALUES (" + member+ ")";
                
                db.setSql(sql);
                db.executeUpdate(conn);
                System.out.println((sql));
                System.out.println("EFFORT!" + (mem.getApr()));
        
        sql= "SELECT mem_id FROM `member` WHERE emp_id= " + member;
        db.setSql(sql);
        db.executeQuery(conn);
        rs = db.getRs();
        member = 0;
        
        while(rs.next())
        {
            if(rs.getInt("mem_id")>member)
                member = rs.getInt("mem_id");
        }
        
        sql= "INSERT INTO `memlist`(`mem_id`, `proj_id`)" 
                   + " VALUES (" + member+ "," + mem.getProj_id() + ")";
         db.setSql(sql);
                db.executeUpdate(conn);

        }
        else{
            member=ra.getInt("mem_id");
        }
                 sql= "INSERT INTO `effort`(`mem_id`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`, `sep`, `oct`, `nov`, `dec`, `year`)" 
                   + " VALUES (" + member + ",'" + mem.getJan() + "','" +  mem.getFeb() + "','" + mem.getMar()+ "','" + mem.getApr() + "','" + mem.getMay()+ "','"+mem.getJun()+ "','" + mem.getJul() + "','" + mem.getAug() + "','" + mem.getSep() + "','" + mem.getOct() + "','" + mem.getNov() + "','" + mem.getDec() + "','" + mem.getYear() + "')";
                db.setSql(sql);
        db.executeUpdate(conn);
        
        }
        catch(Exception E){}
        
            return mapping.findForward("loginsuccess");
    }
 /*  public static void main (String[] args){
      //  Connection conn;
        ResultSet rs;
        Connection conn;
        DBconnection db= new DBconnection(); 
        int member = 4;
        int id=4;
        String s = "7.2";
        String sql;
        
      sql= "INSERT INTO `effort`(`mem_id`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`, `sep`, `oct`, `nov`, `dec`, `year`)" 
                   + " VALUES (" + member+ ",'" + s + "','" +  s + "','" + s+ "','" + s + "','" + s+ "','"+s+ "','" + s + "','" + s + "','" + s + "','" + s + "','" + s + "','" + s + "','" + s + "')";
        System.out.println((sql)); 
                conn=db.toConnect();
                db.setSql(sql);
                db.executeUpdate(conn);
                rs = db.getRs();
                try{
                System.out.println(rs.next());
                }
                catch(Exception E){}
    }
         
        */     
                
    }


