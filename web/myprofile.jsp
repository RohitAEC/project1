<%-- 
    Document   : myprofile
    Created on : Apr 22, 2018, 11:41:15 PM
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
// declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
ResultSet rs2 = null;
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
                <a class="navbar-brand" href="index.jsp">E-Voting System</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;">  <a href="<%=request.getContextPath()%>/userlogout" class="btn btn-danger square-btn-adjust">Logout</a> </div>
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
        
            <h3 class="h3"> My Profile &nbsp;&nbsp;&nbsp; <a href="change_password.jsp" class="btn btn-sm btn-primary">Change Password</a></h3>
          <hr />
              <%
                  /////// GET VOTER DETAILS//////////////////////////
String QueryString = "SELECT * from tbl_voters where id="+session.getAttribute("voter_id");
rs2 = statement.executeQuery(QueryString);

            while (rs2.next()) {
%>
       <div class="form-group row">
    <label  class="col-sm-2 col-form-label">Name : </label>
    <div class="col-sm-10">
      <%=rs2.getString("full_name")%>
    </div>
  </div>
  <div class="form-group row">
    <label  class="col-sm-2 col-form-label">Father's Name</label>
    <div class="col-sm-10">
      <%=rs2.getString("father_name")%>
    </div>
  </div>
  <div class="form-group row">
    <label  class="col-sm-2 col-form-label">Mother's Name</label>
    <div class="col-sm-10">
    <%=rs2.getString("mother_name")%>
    </div>
  </div>
  <div class="form-group row">
    <label  class="col-sm-2 col-form-label">Date of Birth</label>
    <div class="col-sm-10">
    <%=rs2.getString("dob")%>
        </div>
  </div>
    <div class="form-group row">
    <label class="col-sm-2 col-form-label">Gender</label>
    <div class="col-sm-10">
    <%=rs2.getString("gender")%>
    </div>
  </div>
               <%
                   ///////// GET STATE,DISTRICT AND CITY NAME BY REGION ID ////////////////////////////
                   statement = connection.createStatement();
                String Query2 = "SELECT * from tbl_region where id="+rs2.getInt("region_id");
                ResultSet rs3 = statement.executeQuery(Query2);

            while(rs3.next()) {
%>
    
    <div class="form-group row">
    <label  class="col-sm-2 col-form-label">State</label>
    <div class="col-sm-10">
   <%=rs3.getString("state")%>
    </div>
  </div>
    <div class="form-group row">
    <label  class="col-sm-2 col-form-label">District</label>
    <div class="col-sm-10">
    <%=rs3.getString("district")%>
    </div>
  </div>
    <div class="form-group row">
    <label  class="col-sm-2 col-form-label">City</label>
    <div class="col-sm-10">
    <%=rs3.getString("city")%>
    </div>
  </div>
    
    <%
    }
    %>
           <div class="form-group row">
    <label  class="col-sm-2 col-form-label">Landmark</label>
    <div class="col-sm-10">
    <%=rs2.getString("landmark")%>
    </div>
  </div>
           <div class="form-group row">
    <label   class="col-sm-2 col-form-label">Pincode</label>
    <div class="col-sm-10">
     <%=rs2.getInt("pincode")%>
    </div>
  </div>
          
                 <div class="form-group row">
    <label  class="col-sm-2 col-form-label">Email id</label>
    <div class="col-sm-10">
    <%=rs2.getString("email")%>
    </div>
  </div>
                 <div class="form-group row">
    <label  class="col-sm-2 col-form-label">Phone Number</label>
    <div class="col-sm-10">
    <%=rs2.getString("mobile_no")%>
    </div>
  </div>
            
   <% } %>         
                          
        
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
out.println("Unable to connect to database.");
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
    
   
        
    </body>
</html>
