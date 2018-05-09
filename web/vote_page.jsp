<%-- 
    Document   : vote_page
    Created on : Apr 22, 2018, 12:49:16 AM
    Author     : Sanjoy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
if(session.getAttribute("voter_id")==null || session.getAttribute("voter_id")=="")
{
    response.sendRedirect("login.jsp");
}
%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>E-Voting System</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
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
    
<%
    int eid = Integer.parseInt(request.getParameter("eid"));
    int region_id = Integer.parseInt(request.getParameter("rid"));
%>    

<%
    //// secuirity check whether voter already voted or not ////////////////////////////////
            String QueryString4 = "SELECT count(*) from tbl_vote where voter_id="+session.getAttribute("voter_id")+" and election_id="+eid;
            rs4 = statement.executeQuery(QueryString4);

            while (rs4.next()) {
                if(rs4.getInt(1)>0)
                    response.sendRedirect("index.jsp");
            }
%>
<%
    //// secuirity check whether given region is right or not ////////////////////////////////
            String Query = "SELECT region_id from tbl_voters where id="+session.getAttribute("voter_id");
            ResultSet rs5 = statement.executeQuery(Query);

            while (rs5.next()) {
                if(rs5.getInt("region_id")!=region_id)
                    response.sendRedirect("index.jsp");
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
                <a class="navbar-brand" href="index.jsp">E-Voting System</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> <a href="<%=request.getContextPath()%>/userlogout" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
               <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					<li>
                        <a  class="active-user" href="myprofile.jsp"><i class="fa fa-user fa-3x"></i> My Profile</a>
                    </li>
                    <li>
                        <a  class="active-menu"  href="index.jsp"><i class="fa fa-table fa-3x"></i> Dashboard</a>
                    </li>
                    
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <h3 class="h3">Election : <span>
                <%
                    statement = connection.createStatement();
            
                String query_ename = "SELECT * from elections where id="+eid;
                ResultSet rs_ename = statement.executeQuery(query_ename);

                while(rs_ename.next())
                {
                    out.print(rs_ename.getString("ename"));
                   
                }
                %>
                </span></h3>
            <form action="vote_page2.jsp" method="get">
                <input type="hidden" name="eid" value="<%=eid %>" />
                <input type="hidden" name="vid" value="<%=session.getAttribute("voter_id") %>" />
                <input type="hidden" name="rid" value="<%=region_id %>" />
                
                
                <table class="table table-bordered table-striped table-hover" id="table1">
                <thead>
                    <tr>
                        <th class="col-md-1">Vote</th>
                        <th class="col-md-2">Party</th>
                        <th class="col-md-2">Candidate Name</th>
                        <th class="col-md-4">Description</th>
                        <th class="col-md-3">Image</th>
                        
                    </tr>
                    
                   
                </thead>
                <tbody>
                       <%
String QueryString = "SELECT * from tbl_candidatefromregion where election_id="+eid+" and region_id="+region_id;
rs = statement.executeQuery(QueryString);

            while (rs.next()) {
           
                statement2 = connection.createStatement();

String QueryString2 = "SELECT * from tbl_candidate where id="+rs.getInt("candidate_id");
rs2 = statement2.executeQuery(QueryString2);

String cname = "";
String desc1 = "";
String image = "";

while(rs2.next())
{
    cname = rs2.getString("name");
    desc1 = rs2.getString("desc1");
    image= rs2.getString("image");
    
    
}

%>
                     <tr>
                         <td ><input type="radio" name="cid" value="<%=rs.getString("candidate_id")%>" />
                         <input type="hidden" name="pid" value="<%=rs.getInt("party_id")%>" />
                         </td>
                         <td>
                             <%
                                 Statement statement3 = connection.createStatement();
                             String query_pname = "SELECT * from tbl_party where id="+rs.getString("party_id");
                             ResultSet rs_pname = statement3.executeQuery(query_pname);
                             while(rs_pname.next())
                             {
                                 out.print(rs_pname.getString("name"));
                                 out.print("<img src='assets/img/find_user.png' width='80' height='80' />");
                             }
                             %>
                             </td>
                        <td><%=cname%></td>
                        <td><%=desc1%></td>
                        <td><img src="assets/img/" width="120px" height="150px" /></td>
                    </tr>
                     <% 
                         }
                        %>
                        
                    <tr>
                        <td colspan="5"><input type="submit" name="submit" value="Vote" class="btn btn-success" /></td>
                    </tr>
                </tbody>
            </table>
            </form>
        
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
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- MORRIS CHART SCRIPTS -->
     <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    <script>
       /* $(document).ready(function(){
        $('#table1 tr').click(function() {
            $(this).find('td input:radio').prop('checked', true);
        });
    });*/

    </script>
   
</body>
</html>
