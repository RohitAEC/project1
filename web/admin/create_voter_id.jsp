<%-- 
    Document   : create_voter_id
    Created on : Apr 23, 2018, 9:42:55 AM
    Author     : Rocky
--%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
if(session.getAttribute("a_idd")==null || session.getAttribute("a_idd")=="")
{
    response.sendRedirect("../login_admin.jsp");
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create Voter Id | E-Voting System</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="../assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   
   
   
<script>  
var request;  
function getDistricts()  
{  
    var v=document.getElementById("state").value;  
    var url="ajax_get_districts_by_state.jsp?state="+v;  
  
    if(window.XMLHttpRequest){  
        request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
       request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  
    try{  
        request.onreadystatechange=getInfo;  
        request.open("GET",url,true);  
        request.send();  
        }catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
    if(request.readyState==4){  
    var val=request.responseText;  
    document.getElementById('district').innerHTML=val;  
    }  
}

function getCity()  
{  
var v=document.getElementById("district").value;  
var url="ajax_get_city_by_district.jsp?district="+v;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo2;  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo2(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('city').innerHTML=val;  
document.getElementById('police_station').innerHTML=val;  
}  
}
  
</script>  

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

// Load JBBC driver "com.mysql.jdbc.Driver"
Class.forName("com.mysql.jdbc.Driver").newInstance();
/* Create a connection by using getConnection() method that takes parameters 
of string type connection url, user name and password to connect to database.*/
connection = DriverManager.getConnection(connectionURL, "root", "");
/* createStatement() is used for create statement object that is used for 
sending sql statements to the specified database. */
statement = connection.createStatement();
statement2 = connection.createStatement();
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
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Create New Voter Id</h2>   
                        <h5>Welcome Jhon Deo , Love to see you back. </h5>
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
                
                            <div class="row">
                                <div class="col-md-6">
                                    <!--<h3>Basic Form Examples</h3>-->
                                    <form role="form" action="../CreateVoterId" method="post">
                                       
                                        <div class="form-group">
                                            <label>Full Name</label>
                                            <input type="text" name="full_name" class="form-control" placeholder="" />
                                        </div>
                                        <div class="form-group">
                                            <label>Father's Name</label>
                                            <input type="text" name="father_name" class="form-control" placeholder="" />
                                        </div>
  
                                        <div class="form-group">
                                            <label>Mother's Name</label>
                                            <input type="text" name="mother_name" class="form-control" placeholder="" />
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Date of Birth</label>
                                            <input type="date" name="dob" class="form-control" placeholder="" id="id_dateOfBirth" onblur="checkDOB()" />
                                            
                                        </div>
                                        <span id="id_dateOfBirth1"></span>
  					<div class="form-group">
                                        	<label>Gender</label>&nbsp;&nbsp;&nbsp;
                                            <label class="radio-inline">
                                                <input type="radio" name="gender" value="Male">Male</label>
										<label class="radio-inline">
                                                                                    <input type="radio" name="gender" value="Female">Female</label>
                                        </div>
                                        <div class="form-group">
                                            <label>State</label>
                                            <select class="form-control" name="state" id="state" onchange="getDistricts()">
                                                 <option value="">Select</option>
                                                  <%
                         
String QueryString = "SELECT state from tbl_region group by state";
rs = statement.executeQuery(QueryString);

            while (rs.next()) {
%>

                                                 <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
<%
}
%>
    <%
// close all the connections.
rs.close();
statement.close();
} catch (Exception ex) {
%>
<%
out.println("Unable to connect to database.");
}%>%>

                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>District</label>
                                            <select class="form-control" name="district" id="district" onchange="getCity()" >
                                                 <option value="">Select</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>City / Town / Village</label>
                                            <select class="form-control" name="city" id="city">
                                                 <option value="">Select</option>
                                            </select>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Landmark</label>
                                            <input type="text" name="landmark" class="form-control" placeholder="" />
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Pincode</label>
                                            <input type="number" name="pincode" class="form-control" placeholder="" />
                                        </div>
                                        
                                       
                                     
                                        
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" name="email" class="form-control" placeholder="" />
                                        </div>
 
                                        <div class="form-group">
                                            <label>Mobile No.</label>
                                            <input type="number" name="mobile_no" class="form-control" placeholder="" />
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Image</label>
                                            <input type="file" name="image" />
                                        </div>
                                            <button type="submit" name="create" class="btn btn-primary">CREATE</button>
                                    </form>
                                </div>
                            </div>
<%
                         if(request.getParameter("msg") != null && !request.getParameter("msg").isEmpty()){
                         int msg = Integer.parseInt(request.getParameter("msg"));
                         if(msg == 1)
                            out.print("<h5>Successfully Added</h5>");
                         else if(msg == 0)
                            out.print("<h5>Failed to add new party. Please try again.</h5>");
                         }
                     %>
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="../assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="../assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="../assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="../assets/js/custom.js"></script>    
    <script type="text/javascript">
    function checkDOB() {
        //alert("hi");
        var dateString = document.getElementById('id_dateOfBirth').value;
        var myDate = new Date(dateString);
        var today = new Date();
        if ( myDate < today ) { 
            $('#id_dateOfBirth1').innerHTML('<p>You cannot enter a date in the past!.</p>');
            return false;
        }
        return true;
    }
    </script>
</body>
</html>