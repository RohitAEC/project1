<%-- 
    Document   : index
    Created on : Apr 22, 2018, 9:41:47 AM
    Author     : Rocky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
if(session.getAttribute("a_idd")==null || session.getAttribute("a_idd")=="")
{
    response.sendRedirect("../login_admin.jsp");
}
%>
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
<body>
    
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
// declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
ResultSet rs2 = null;
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
                                <a href="stand_candidate.jsp">Add Candidate To Election</a>
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
                                <a href="show_partys.jsp">Show All Party</a>
                            </li>

                        </ul>
                    </li>
                    
                
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
        
            <h3 class="h3"> Running Vote : </h3>
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th>Election name</th>
                        <th>State</th>
                        <th>District</th>
                        <th>Last Date</th>
                        
                        <th>Status</th>
                    </tr>
                    
                   
                </thead>
                <tbody>
                    
                     <%
                         int c = 0;
                         statement = connection.createStatement();
String QueryString = "SELECT * from elections where status=0 or status=2 order by ldate";
rs = statement.executeQuery(QueryString);

            while (rs.next()) {
%>

                     <tr>
                        <td ><%=rs.getString("ename")%></td>
                        <td><%=rs.getString("state")%></td>
                        <td><%=rs.getString("district")%></td>
                        <td><%=rs.getString("ldate")%></td>
                        <td>
                <%
                    if(rs.getInt("status")==2)
                    {
                %>
                <a href="election_start.jsp?eid=<%=rs.getInt(1)%>" class="btn btn-success">Start</a>
                <%
                }else{
                %>
                            <a href="view_details.jsp?eid=<%=rs.getString(1)%>" class="btn btn-success">Vote Details</a>
                            <a href="election_stop.jsp?eid=<%=rs.getString(1)%>" class="btn btn-success">Stop</a>
                <%
                }
                %>
                           </td>
     
                           
                     </tr>
           <% } %>         
                    
                </tbody>
            </table>
        
        <h3 class="h3"> Recent Results : </h3>
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th class="col-md-2">Election name</th>
                        <th class="col-md-2">State</th>
                        <th class="col-md-2">District</th>
                        <th class="col-md-2">Last Date</th>
                        <th class="col-md-4">Result</th>
                        <th class="col-md-4">Details</th>
                    </tr>
                    
                   
                </thead>
                <tbody>
                     <%
String QueryString2 = "SELECT * from elections where status=1 order by ldate desc";
rs2 = statement.executeQuery(QueryString2);

            while (rs2.next()) {
%>

                     <tr>
                        <td ><%=rs2.getString(2)%></td>
                        <td><%=rs2.getString("state")%></td>
                        <td><%=rs2.getString("district")%></td>
                        <td><%=rs2.getString("ldate")%></td>
                        
                    
                         <td>
                               <%
                                
                                   
                            statement = connection.createStatement();
                            String sql_totvote = "SELECT count(*) FROM `tbl_vote` WHERE election_id="+rs2.getInt("id");
                            ResultSet rs_totvote = statement.executeQuery(sql_totvote);
                            int totVote = 0;
                            while(rs_totvote.next())
                            {
                                totVote = rs_totvote.getInt(1);
                            }
                            
                            statement = connection.createStatement();
                            String sql_vote = "SELECT party_id,count(*) FROM `tbl_vote` WHERE election_id="+rs2.getInt("id")+" group by party_id";
                            ResultSet rs_vote1 = statement.executeQuery(sql_vote);
                            %>
                            
                            <div class="panel-body">
                                
                            <%
                            int winner = 0;
                            String party_name="";
                            String winner_party = "";
                            while(rs_vote1.next())
                            {
                               double vp = rs_vote1.getInt(2);
                               double votePercent2 = (vp/totVote)*100;
                                %>
                                
                       <div class="progress">
  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=votePercent2%>" aria-valuemin="0" aria-valuemax="100" style="width: <%=votePercent2%>%">
    <span class="sr-only">40% Complete (success)</span>
    
                            <%
                            statement = connection.createStatement();
                            String query_pname3 = "SELECT name from tbl_party where id="+rs_vote1.getInt("party_id");
                            ResultSet rs_pname3 = statement.executeQuery(query_pname3);
                            while(rs_pname3.next()){
                                    party_name = rs_pname3.getString("name");
                            }
                            out.print(party_name);
                            if(rs_vote1.getInt(2)>winner)
                            {
                                winner = rs_vote1.getInt(2);
                                winner_party = party_name;
                            }
                                out.print(" ("+rs_vote1.getInt(2)+" Votes)");
                            %>
  </div>
  
</div>                          
  
                                <%
                            }
                               out.print("Winner : "+winner_party);
                               %>
                               
                               
      
                               
                            </div>
                        </td>
                               <td><a href="vote_details.jsp?eid=<%=rs2.getInt("id")%>" class="btn btn-sm btn-primary" >View Details</a></td>
                     </tr>
           <% } %>      
                     
                    
                </tbody>
            </table>
        
        
        <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
    
    
    
  <%
// close all the connections.
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
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
