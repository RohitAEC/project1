<%-- 
    Document   : show_elections
    Created on : Apr 22, 2018, 1:22:04 PM
    Author     : Rocky
--%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
if(session.getAttribute("a_idd")==null || session.getAttribute("a_idd")=="")
{
    response.sendRedirect("../login_admin.jsp");
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>E-Voting System</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="../assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="../assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />


</head>
    <body >
    
     <%
try {
/* Create string of connection url within specified format with machine
name, port number and database name. Here machine name id localhost and 
database name is student. */
String connectionURL = "jdbc:mysql://localhost:3306/db_evoting?zeroDateTimeBehavior=convertToNull";
// declare a connection by using Connection interface
Connection connection = null;
/* declare object of Statement interface that is used for executing sql 
statements. */
Statement statement = null;
Statement statement2 = null;
Statement statement3 = null;
// declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
ResultSet rs2 = null;
ResultSet rs3 = null;
ResultSet rs4 = null;
// Load JBBC driver "com.mysql.jdbc.Driver"
Class.forName("com.mysql.jdbc.Driver").newInstance();
/* Create a connection by using getConnection() method that takes parameters 
of string type connection url, user name and password to connect to database.*/
connection = DriverManager.getConnection(connectionURL, "root", "");
/* createStatement() is used for create statement object that is used for 
sending sql statements to the specified database. */
statement = connection.createStatement();
// sql query to retrieve values from the secified table.


    %>
    
    <%
            String eid = request.getParameter("election_name");
            String pid = request.getParameter("party");
            


            // get from election table
            String QueryString = "SELECT * from elections where id="+Integer.parseInt(eid);
            rs = statement.executeQuery(QueryString);

            String ename = "";
            String district = "";
            String state = "";
            while (rs.next()) {
                ename = rs.getString("ename");
                state = rs.getString("state");
                district = rs.getString("district");
                break;
            }
            // get from party table
            statement = connection.createStatement();
            String QueryString2 = "SELECT * from tbl_party where id="+Integer.parseInt(pid);
            rs2 = statement.executeQuery(QueryString2);

            String pname = "";
            while (rs2.next()) {
                pname = rs2.getString("name");
                break;
            }
            //get from region table
            String QueryString3 = "";
            if(district.equals("") || district.isEmpty())
            {
                QueryString3 = "SELECT * from tbl_region where state='"+state+"' order by district";
            }
            else{
                QueryString3 = "SELECT * from tbl_region where district='"+district+"'";
            }
            statement = connection.createStatement();
           
            rs3 = statement.executeQuery(QueryString3);
            
    %>
    
    
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">E-Voting</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;">  <a href="<%=request.getContextPath()%>/AdminLogout" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					<li>
                        <a  class="active-user" href="#"><i class="fa fa-user fa-3x"></i> Sanjoy Sonar</a>
                    </li>
                    <li>
                        <a  class="active-menu"  href="index.jsp"><i class="fa fa-table fa-3x"></i> Dashboard</a>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i> Elections<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="add_election.jsp">Create New Election</a>
                            </li>
                            <li>
                                <a href="show_elections.jsp">Show All Election</a>
                            </li>
                            
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i> Candidate<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="add_candidate.jsp">Add Candidate</a>
                            </li>
                            <li>
                                <a href="show_candidates.jsp">Show All Candidate</a>
                            </li>
                            
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i> Voters<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="create_voter_id.jsp">Add New Voter</a>
                            </li>
                            <li>
                                <a href="show_voters.jsp">Show All Voters</a>
                            </li>

                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i> Party<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="add_party.jsp">Add New Party</a>
                            </li>
                            <li>
                                <a href="#">Show All Party</a>
                            </li>

                        </ul>
                    </li>
                    
                
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
        
            <h3>Election Name : <%=ename %></h3>
            <h3>Party Name : <%=pname %> </h3>
            <form action="stand_candidate3.jsp" method="post" >
                <input type="hidden" name="party_id" id="party_id" value="<%=pid %>" />
                <input type="hidden" name="election_id" id="election_id" value="<%=eid %>" />
                    
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                       
                        
                        <th>State</th>
                        <th>District</th>
                        <th>City</th>
                        <th>Candidate</th>
                        
                    </tr>
                    
                   
                </thead>
                <tbody>
                    <%
                        int c =0;
                    while (rs3.next()) {
                         c++;
                    %>
                    <input type="hidden" name="region_id<%=c%>" id="region_id<%=c%>" value="<%=rs3.getString("id") %>" />
                     <tr>
                         <td ><input type="text" name="state"  class="form-control" size="20" value="<%=rs3.getString("state") %>" disabled /></td>
                        <td>
                            <input type="text" name="district" class="form-control"  size="20" value="<%=rs3.getString("district") %>" disabled />
               
                        </td>
                        <td ><input type="text" name="city" class="form-control"  size="20" value="<%=rs3.getString("city") %>" disabled /></td>
                        <td>
                            <select name="candidate<%=c%>" class="form-control"  id="candidate<%=c%>" style="width:300px;">
                                <option value="0">Select</option>
                          <%
                              
            statement = connection.createStatement();
            String QueryString4 = "SELECT * from tbl_candidate";
            rs4 = statement.executeQuery(QueryString4);
            
                            while (rs4.next()) {
                           %>
                           <option value="<%=rs4.getString("id") %>"><%=rs4.getString("name")+"( From "+rs4.getString("address")+" )" %></option>
                           
                           <%
                            
                            }
                          
                          %>
                            </select>
                        </td>
                <%
                }
                %>        
                        
                    </tr>
                    
                <tr>
                    <td colspan="4"><button type="submit" class="btn btn-block btn-success" name="submit">Submit</button></td>
                </tr>
                </tbody>
            </table>
                <input type="hidden" name="count" id="count" value="<%=c %>" />
                    
            </form>
        <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
    
                
  <%
// close all the connections.
rs.close();
rs2.close();
rs3.close();
rs4.close();
//statement2.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
<%
out.println("Unable to connect to database.");
}%>

    
    
    
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="../assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="../assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="../assets/js/jquery.metisMenu.js"></script>
     <!-- MORRIS CHART SCRIPTS -->
     <script src="../assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="../assets/js/morris/morris.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="../assets/js/custom.js"></script>
    
   
</body>
</html>
