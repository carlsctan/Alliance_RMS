<%-- 
    Document   : addMemberForm
    Created on : May 26, 2014, 10:27:11 AM
    Author     : Ma.NelleYap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<html>
    <body>
                            <html:form action="AddMemberAction">
                           
                        <label for="Member"><strong>Member name</strong></label>        
                 <select property="member" name="member" class="form-control" style="width:300px">
                <option>Majam, Irus</option>     
                <option>Tan, Carl</option>
                <option>Ymbong, Michael Vincent</option>
                </select>               <br>
                <label for="Effort"><strong>Effort</strong></label>
                <table> <tbody><tr>
               
                            <td> <label for="Effort">Jan</label>

                <select property="Jan" name="Jan" class="form-control" style="width:80px">
                <option>0</option>
                <option>0.25</option>
                <option>0.50</option>
                <option>0.75</option>
                <option>1</option>
                </select>
                            </td>
                            <td><label for="Effort">Feb</label>
                <select property="Feb" name="Feb" class="form-control" style="width:80px">
                <option>0</option>
                <option>0.25</option>
                <option>0.50</option>
                <option>0.75</option>
                <option>1</option>
                </select></td>
                                
                <td>
                    <label for="Effort">Mar</label>
                    <select property="Mar" name="Mar" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>
                <td>
                    <label for="Effort">Apr</label>
                    <select property="Apr" name="Apr" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>                        
                <td>
                    <label for="Effort">May</label>
                    <select property="May" name="May" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>     
                <td>
                    <label for="Effort">Jun</label>
                    <select property="Jun" name="Jun" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>                
                </tr>
                <tr>
                <td>
                    <label for="Effort">Jul</label>
                    <select property="Jul" name="Jul" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td> 
                <td>
                    <label for="Effort">Aug</label>
                    <select property="Aug" name="Aug" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>  
                <td>
                    <label for="Effort">Sep</label>
                    <select property="Sep" name="Sep" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>
                <td>
                    <label for="Effort">Oct</label>
                    <select property="Oct" name="Oct" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>   
                <td>
                    <label for="Effort">Nov</label>
                    <select property="Nov" name="Nov" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>  
                <td>
                    <label for="Effort">Dec</label>
                    <select property="Dec" name="Dec" class="form-control" style="width:80px">
                        <option>0</option>
                        <option>0.25</option>
                        <option>0.50</option>
                        <option>0.75</option>
                        <option>1</option>
                    </select>
                </td>                
                </tr>    
                    </tbody> </table>
            <br>
                    <button type="submit" id="submitAddMember" class="btn btn-success">OK</button>
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancel</button>
                     </html:form>
    </body>
</html>
