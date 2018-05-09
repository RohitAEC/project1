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
            String eid = request.getParameter("eid");
            
            


            // get from election table
            String QueryString = "SELECT * from elections where id="+Integer.parseInt(eid);
            rs = statement.executeQuery(QueryString);

            String ename = "";
            String district = "";
            String state = "";
            String city = "";
            while (rs.next()) {
                ename = rs.getString("ename");
                
                break;
            }
           
            
            
            
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
font-size: 16px;"> <a href="<%=request.getContextPath()%>/AdminLogout" class="btn btn-danger square-btn-adjust">Logout</a> </div>
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
            
         
                    
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                       
                        
                        <th class="col-md-2" >State</th>
                        <th class="col-md-2">District</th>
                        <th class="col-md-2">City</th>
                        <th class="col-md-6">Result</th>
                        
                    </tr>
                    
                   
                </thead>
                <tbody>
                    <%
            statement = connection.createStatement();
            String QueryString2 = "SELECT region_id from tbl_candidatefromregion where election_id="+Integer.parseInt(eid)+" group by region_id";
            rs2 = statement.executeQuery(QueryString2);

                        int c =0;
                    while (rs2.next()) {
                         c++;
                 state = "";
                district = "";
                city = "";
            statement = connection.createStatement();
            String QueryString3 = "SELECT * from tbl_region where id="+rs2.getInt("region_id");
            rs3 = statement.executeQuery(QueryString3);
                    while(rs3.next())
                    {
                    %>
                    
                     <tr>
                         <td ><input type="text" name="state"  class="form-control" size="15" value="<%=rs3.getString("state") %>" disabled /></td>
                        <td>
                            <input type="text" name="district" class="form-control"  size="15" value="<%=rs3.getString("district") %>" disabled />
               
                        </td>
                        <td ><input type="text" name="city" class="form-control"  size="15" value="<%=rs3.getString("city") %>" disabled /></td>
                          <td>
                        <!-----------------------  Result by region---------------------------->    
                            <div class="panel-body">
                                <%
                             int cc=0;
                             int ccc=0;
                             int cid=0;
                             int voteCandiate=0;
                            
                            int total = 0;
statement = connection.createStatement();
            String query_vote = "SELECT candidate_id,COUNT(*),party_id FROM `tbl_vote` WHERE region_id="+rs2.getInt("region_id")+" and election_id="+eid+" GROUP by party_id";
            ResultSet rs_vote = statement.executeQuery(query_vote);
           
                             while(rs_vote.next())
                            {
                                voteCandiate=0;
                                if(cc==0){
                                   // cid=rs_vote.getInt("candidate_id");
        
                                
                            statement = connection.createStatement();
                            String query_totVote = "SELECT count(*) FROM `tbl_vote` where election_id="+eid+" and  region_id="+rs2.getInt("region_id");
                            ResultSet rs_totVote = statement.executeQuery(query_totVote);

                                while(rs_totVote.next())
                                    total = rs_totVote.getInt(1);
                               }
                               
                               //rs_totVote.close();
                               ccc=1;
                               
                               voteCandiate = rs_vote.getInt(2);
                               double vc = voteCandiate;
                               double votePercent = (vc/total)*100;
                                %>
                       <div class="progress">
  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=votePercent%>" aria-valuemin="0" aria-valuemax="100" style="width: <%=votePercent%>%">
    <span class="sr-only">40% Complete (success)</span>
    <%
   ////////////////// get party name////////////////////////////////////////
                          
                            
                            statement = connection.createStatement();
                            String query_pname2 = "SELECT name from tbl_party where id="+rs_vote.getInt("party_id");
                            ResultSet rs_pname2 = statement.executeQuery(query_pname2);
                            while(rs_pname2.next()){
                                    out.print(rs_pname2.getString("name"));
                            }
                                out.print(" ("+rs_vote.getInt(2)+" Votes)");
                            
    %>
    
  </div>
                           </div>
                           <% 
                               
                           }
                           %>


                            </div>
                        </td>
                <%
                }
                %>        
                        
                    </tr>
                    
               
                </tbody>
                <%
                }
                %>      
            </table>
               
        <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
    
                
  <%
// close all the connections.
rs.close();

//statement2.close();
statement.close();
connection.close();
} 
catch (Exception ex) {
%>
<%
out.println(ex);
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
