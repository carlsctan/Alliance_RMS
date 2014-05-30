import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
 

// Extend HttpServlet class
public class AddMember extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        	throws ServletException, IOException
   {
        String[] months={"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul","Aug","Sep","Oct", "Nov", "Dec"};
        int i;
        Member a;
        ArrayList array =new ArrayList();
        for(i=0;i<2;i++){
            a=new Member();
            array.add(a);
        }
        Member[] b = new Member[2];
        for(i=0;i<2;i++){
            b[i] = (Member) array.get(i);
        }
        
        
        Member m= new Member();
        m.setName(request.getParameter("member"));
        for(i=0;i<12;i++){
            m.setMonths(request.getParameter(months[i]), i);
        }
        request.setAttribute("selectedScreen", request.getServletPath());
        request.setAttribute("member", m); 
        RequestDispatcher dispatcher = request. 
        getRequestDispatcher("/ResourceSummary.jsp"); 
        if (dispatcher != null) 
            dispatcher.forward(request, response);
 

    }
}
