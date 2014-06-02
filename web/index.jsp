<%-- 
    Document   : index
    Created on : May 10, 2014, 10:37:35 PM
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.myapp.data.*"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<jsp:include page="checkSession.jsp"></jsp:include>
<!DOCTYPE html>
<html>
    <head>
        <title>Alliance Resource Management System</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/view.css">
        <link type="text/css" rel="stylesheet" href="media/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="media/css/dataTables.bootstrap.css">
        <script src="media/js/complete.js" type="text/javascript" ></script>
        <script src="media/js/jquery.js" type="text/javascript"></script>
        <script src="media/js/bootstrap.js" type="text/javascript"></script>
        <script src="media/js/jquery.dataTables.js" type="text/javascript"></script>    
        <script src="media/js/jquery.dataTables.columnFilter.js" type="text/javascript" ></script>

        <style type="text/css">
            @import "media/css/jquery.dataTables.css";
        </style>
        <style>
            .container{
               
                margin-left: auto;
     		margin-right: auto;				
            } 
            ul{
                font-size: 125%;
            }
            button{
                background-color: #f5f5f5;
            }
            .container-fluid{

                 margin-left: auto;
     		margin-right: auto;
            }
            body{
                padding-bottom: 70px;
            }
            
          
        </style>  
        <script type="text/javascript">
            $(document).ready(function(){
                $('#datatables').dataTable().columnFilter({
                    
                    aoColumns: [ null,null,
				     { type: "select", values: [ '1', '0.75', '0.5', '0.25', '0']  },
				     { type: "select", values: [ '1', '0.75', '0.5', '0.25', '0']  },
                                     { type: "select", values: [ '1', '0.75', '0.5', '0.25', '0']  },
                                     { type: "select", values: [ '1', '0.75', '0.5', '0.25', '0']  },
                                     { type: "select", values: [ '1', '0.75', '0.5', '0.25', '0']  },
                                     { type: "select", values: [ '1', '0.75', '0.5', '0.25', '0']  },
                                     { type: "select", values: [ '1', '0.75', '0.5', '0.25', '0']  },
                                     { type: "select", values: [ '1', '0.75', '0.5', '0.25', '0']  },
                                     { type: "select", values: [ '1', '0.75', '0.5', '0.25', '0']  },
                                     { type: "select", values: [ '1', '0.75', '0.5', '0.25', '0']  },
                                     { type: "select", values: [ '1', '0.75', '0.5', '0.25', '0']  },
                                     { type: "select", values: [ '1', '0.75', '0.5', '0.25', '0']  }
                                                                         
            ]
                });
                
                 /*var table = $('#datatables').DataTable();
                 
                 $("#example thead th").each( function ( i ) {
        var select = $('<select><option value=""></option></select>')
            .appendTo( $(this).empty() )
            .on( 'change', function () {
                table.column( i )
                    .search( $(this).val() )
                    .draw();
            } );
 
        table.column( i ).data().unique().sort().each( function ( d, j ) {
            select.append( '<option value="'+d+'">'+d+'</option>' );
        } );
    } );*/
                
            });
        </script>
    </head>
    <body>
        <div class="container" >
            <div class="row">
             <div style="background-color: #f5f5f5">
                <img src="media/images/header_logo.jpg" class="img-rounded" alt="Responsive image">
             </div>
                <nav class="navbar navbar-default " role="navigation">
                    <div class="container-fluid">
			<ul class="nav navbar-nav ">
                            <li><a href="view_project">Project Outlook Summary</a></li>
                            <li><a href="DisplayProjectAction.do"> Project Summary</a></li>
                            <li><a href="populateAction.do"> Resource Summary</a></li>
			</ul>
			<form action="logout.action" method="post">
				<input type="submit" id="logout-button" value="Log out"/>
			</form>
            </div>
                </nav>
                
            </div>
        </div>
        <div class="container-fluid" >
                <div class="row">
                    <div class="col-md-3"> <!--summary div-->
                        <table id="summary" class="table table-bordered"> <!--summary table-->
                            <thead>
                                <tr>
                                    <th><h3>Summary:</h3></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="font-weight: bold">Total Head Count:</td>
                                    <td><bean:write name="summary" property="numOfEmployees"/></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold"> Employees per business unit: </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Philippines</td>
                                    <td><bean:write name="summary" property="countPH"/></td>
                                </tr>
                                <tr>
                                    <td>Japan</td>
                                    <td><bean:write name="summary" property="countJP"/></td>
                                </tr>
                                <tr>
                                    <td>Rest of the World</td>
                                    <td><bean:write name="summary" property="countRoW"/></td>
                                </tr>
                                <tr>
                                    <td>Alliance</td>
                                    <td><bean:write name="summary" property="countAl"/></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold">Jobless:</td>
                                    <td><bean:write name="summary" property="countJl"/></td>
                                </tr>
                            </tbody>
                        </table>    <!--summary table-->
                    </div>
                    <div class="col-md-9">	
                <!-- employee list table-->
                <table id="datatables" class="display table">   
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Year</th>
                            <th>Jan</th>
                            <th>Feb</th>
                            <th>Mar</th>
                            <th>Apr</th>
                            <th>May</th>
                            <th>Jun</th>
                            <th>Jul</th>
                            <th>Aug</th>
                            <th>Sept</th>
                            <th>Oct</th>
                            <th>Nov</th>
                            <th>Dec</th>
                            
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Filters</th>                                           
                            <th>-</th>
                            <th>-</th>
                            <th>-</th>
                            <th>-</th>
                            <th>-</th>
                            <th>-</th>
                            <th>-</th>
                            <th>-</th>
                            <th>-</th>
                            <th>-</th>
                            <th>-</th>
                            <th>-</th>
                            <th>-</th>
                        </tr>
                    </tfoot>
                    
                    <tbody id="empbody">
      			<logic:iterate name="employees" id="employee">
                                <form id="form1">     
                                    <tr class="tbrow" data-toggle="modal" data-target="#myModal">
                                        <input type="hidden" class="empID" value="<bean:write name="employee" property="empIDNum"/>"/>                             
                                        <td><bean:write name="employee" property="lastName"/>,&nbsp;<bean:write name="employee" property="firstName"/>&nbsp;<bean:write name="employee" property="middleName"/></td>						
                                        <td><bean:write name="employee" property="effort.year"/></td>   
                                        <td><bean:write name="employee" property="effort.months[0]"/></td>
                                        <td><bean:write name="employee" property="effort.months[1]"/></td>
                                        <td><bean:write name="employee" property="effort.months[2]"/></td>
                                        <td><bean:write name="employee" property="effort.months[3]"/></td>
                                        <td><bean:write name="employee" property="effort.months[4]"/></td>
                                        <td><bean:write name="employee" property="effort.months[5]"/></td>
                                        <td><bean:write name="employee" property="effort.months[6]"/></td>
                                        <td><bean:write name="employee" property="effort.months[7]"/></td>
                                        <td><bean:write name="employee" property="effort.months[8]"/></td>
                                        <td><bean:write name="employee" property="effort.months[9]"/></td>
                                        <td><bean:write name="employee" property="effort.months[10]"/></td>
                                        <td><bean:write name="employee" property="effort.months[11]"/></td>
                                    </tr>
                                </form>
                        </logic:iterate>

                    </tbody>
                </table>
                        <p>Note: To refresh the table, select " - " in the dropdown menu from the column you have filtered. </p>
                        <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">Employee Information</h4>
                            </div>
                            <div class="modal-body">
                                <table>
                                    <tbody>
                                    <div class="container" id="modalbody">

                                    </div><!-- /.col-lg-6 -->
                                 
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div><!-- Modal -->  
                    </div>
                    </div>
           
        </div> <!-- Container -->
        <script>
            $(document).ready(function() {                        
                $( "#empbody" ).delegate( "tr", "click", function( e ){  
                    var employeeid=$(this).find(".empID").val();
                    $.get('EmployeeInfoAction.do',{empID:employeeid},function(responseText) { 
                        var json = $.parseJSON(responseText);
                        $('#modalbody').html("<h4>Basic Information</h4></br>Employee ID:  "+json.empIDNum+"</br>"
                                            +"Name:  "+json.firstName+"&nbsp"+json.middleName+"&nbsp"+json.lastName+"</br>"
                                            +"Business Unit:  "+json.businessUnit+"</br></br>"
                                            +"<h4>External and Tenure Information</h4></br>Date Hired:  "+json.dateHired+"</br>"
                                            +"Years IT Industry:  "+json.yearsITIndustry+"</br>"
                                            +"College School 1:  "+json.collegeSchool1+"</br>"
                                            +"College School 2:  "+json.collegeSchool2+"</br>"
                                            +"College Course 1:  "+json.collegeCourse1+"</br>"
                                            +"College Course 2:  "+json.collegeCourse2+"</br>"
                                            +"College Year:  "+json.collegeYear+"</br>"
                                            +"Job Titles:  "+json.jobTitles+"</br>"
                                            +"NRI Batch:  "+json.nriBatch+"</br></br>" 
                                            +"<h4>Current Projects</h4>"
                                            );        
                    });
                    $.get('EmployeeProjectAction.do',{empID:employeeid},function(responseText2) { 
                        var json2 = $.parseJSON(responseText2);
                        $.each(json2, function(i, item) {
                            $('#modalbody').append("</br><a href='ResourceSummary.jsp?param="+json2[i].id+"'>"+json2[i].project_name+"</a>"                                                                                   
                                            ); 
                        });       
                    });
                });
            });
        </script>
    </body>
</html>
