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
        int member;
        int start_year, end_year, year;
        int empid = mem.getMember();
        String sql;
        conn=db.toConnect();
        sql= "SELECT * from project where project_id='"+mem.getProj_id()+"'";       
        db.setSql(sql);
        db.executeQuery(conn);
        rs=db.getRs();
        rs.next();
        start_year=rs.getDate("start_date").getYear() + 1900;
        end_year=rs.getDate("end_date").getYear() + 1900;
        System.out.println("ADD MEMBER" + mem.getMember() + " " + mem.getProj_id() );
        sql= "SELECT * from employee join member on employee.EmpIDNum=member.emp_id join memlist on " 
        + "memlist.mem_id = member.mem_id where employee.EmpIDNum=" + empid + " && memlist.proj_id=" + mem.getProj_id();
        db.setSql(sql);
        db.executeQuery(conn);
        try{
        ra = db.getRs();
        if(ra.next() == false){
         sql= "INSERT INTO `member`(`emp_id`)" 
                   + " VALUES (" + empid+ ")";
                
                db.setSql(sql);
                db.executeUpdate(conn);
                System.out.println((sql));
                System.out.println("EFFORT!" + (mem.getApr()));
        
        sql= "SELECT mem_id FROM `member` WHERE emp_id= " + empid;
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
        for(year=start_year;year<=end_year;year++){         
        sql= "INSERT INTO `effort`(`mem_id`,`jan`,`feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`, `sep`, `oct`, `nov`, `dec`, `year`)" 
                   + " VALUES ('" + member  + "','" +  0 + "','" + 0 + "','" + 0 + "','" + 0+ "','"+0+ "','" +0+ "','" + 0 + "','" + 0 + "','" + 0 + "','" + 0 + "','" + 0 + "','" + 0 + "','" + year + "')";
              
                 db.setSql(sql);
                
        db.executeUpdate(conn);
        sql="SELECT * FROM `gen_effort` WHERE emp_id = "+ empid +" && year =" + year;
        db.setSql(sql); 
        db.executeQuery(conn);
        rs = db.getRs();
         
        if(rs.next() == false)
        {
           
            sql= "INSERT INTO `gen_effort`(`emp_id`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`, `sep`, `oct`, `nov`, `dec`, `year`)" 
                   + " VALUES ('" + empid  + "','" +  0 + "','" + 0+ "','" + 0 + "','" + 0+ "','"+0+ "','" + 0 + "','" + 0 + "','" + 0 + "','" + 0 + "','" + 0 + "','" + 0 + "','" + year + "')";
                db.setSql(sql);
                db.executeUpdate(conn);
               System.out.println("NEWSQL" +" " +sql );  
        }
        else 
            
        {
            
           sql= "UPDATE `gen_effort` SET "+"`feb`=" + (Float.parseFloat(mem.getFeb())+rs.getFloat("feb")) + " ,`mar`="  + (Float.parseFloat(mem.getMar())+rs.getFloat("mar"))+ " ,`apr`="  + (Float.parseFloat(mem.getApr())+rs.getFloat("apr")) + " ,`may`="  + (Float.parseFloat(mem.getMay())+rs.getFloat("may"))+ " ,`jun`=" +(Float.parseFloat(mem.getJun())+rs.getFloat("jun"))+ " ,`jul`="  + (Float.parseFloat(mem.getJul())+rs.getFloat("jul")) + " ,`aug`="  + (Float.parseFloat(mem.getAug())+rs.getFloat("aug")) + " ,`sep`="  + (Float.parseFloat(mem.getSep())+rs.getFloat("sep")) + " ,`oct`="  + (Float.parseFloat(mem.getOct())+rs.getFloat("oct")) + " ,`nov`="  + (Float.parseFloat(mem.getNov())+rs.getFloat("nov")) + " ,`dec`="  + (Float.parseFloat(mem.getDec())+rs.getFloat("dec"))
                   + " WHERE emp_id = "+ empid +"&& year =" + mem.getYear();
           System.out.println(sql);
                db.setSql(sql);
                db.executeUpdate(conn);
        }
        }
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


