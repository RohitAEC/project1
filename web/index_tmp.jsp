<%-- 
    Document   : index_tmp
    Created on : Apr 29, 2018, 10:01:46 AM
    Author     : Rocky
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
Statement statement7 = null;
Statement statement8 = null;
Statement statement9 = null;
// declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
ResultSet rs2 = null;
ResultSet rs3 = null;
ResultSet rs4 = null;
ResultSet rs5 = null;
// Load JBBC driver "com.mysql.jdbc.Driver"
Class.forName("com.mysql.jdbc.Driver").newInstance();
/* Create a connection by using getConnection() method that takes parameters 
of string type connection url, user name and password to connect to database.*/
connection = DriverManager.getConnection(connectionURL, "root", "");
/* createStatement() is used for create statement object that is used for 
sending sql statements to the specified database. */
statement = connection.createStatement();
// sql query to retrieve values from the secified table.
int tmp_cand=0;
                                   int tmp_party=0;
                                   int tmp_vote=0;
                                   //int tmp_par = 0;
    %>
    <%
    String QueryString3 = "SELECT * from tbl_voters where id="+session.getAttribute("voter_id");
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
                <a class="navbar-brand" href="index.html">E-Voting</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;">
      <%
          String district = "";
          String state = "";
          int region_id=0;
          while(rs3.next())
          {
              region_id = rs3.getInt("region_id");
              break;
          }
          
          // get state & district from region table
          //statement = connection.createStatement();
          String QueryString5 = "SELECT * from tbl_region where id="+region_id;
          rs5 = statement.executeQuery(QueryString5);
          while(rs5.next())
          {
              district = rs5.getString("district");
              state = rs5.getString("state");
          }
          
      %>
      Last access : 30 May 2014 &nbsp;|&nbsp;IP Address : 192.168.5.1&nbsp; <a href="<%=request.getContextPath()%>/userlogout" class="btn btn-danger square-btn-adjust">Logout</a> </div>
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
                        <a  class="active-menu"  href="index.html"><i class="fa fa-table fa-3x"></i> Dashboard</a>
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
                         statement = connection.createStatement();
                         
String QueryString = "SELECT * from elections where status=0 and (district='"+district+"' and state='"+state+"') or (district='' and state='"+state+"') order by ldate";
rs = statement.executeQuery(QueryString);

int c=0;
int rs_cid1 = 0;
            while (rs.next()) {
                c = 0;
//rs_cid1 = rs.getInt("candidate_id");
%>              


                  <%
                         try{
                             
                         
                         statement2 = connection.createStatement();
                        String QueryString4 = "SELECT count(*) from tbl_vote where voter_id="+session.getAttribute("voter_id")+" and election_id="+rs.getString(1);
                        rs4 = statement2.executeQuery(QueryString4);

            while (rs4.next()) {
                if(Integer.parseInt(rs4.getString(1))>0)
                    c = 1;
                
            }
            rs4.close();
            statement2.close();
                        }
                         catch(Exception e){
                            out.print("Error");
                        }
%>
                     <tr>
                        <td ><%=rs.getString("ename")%></td>
                        <td><%=rs.getString("state")%></td>
                        <td><%
                            if(rs.getString("district")=="" || rs.getString("district").isEmpty())
                                out.print("All");
                             else
                                out.print(rs.getString("district"));%></td>
                        <td><%=rs.getString("ldate")%></td>
                        <td>
                            <%
                                if(c > 0)
                                {
                                %>
                            <span class="badge badge-primary" >Thanks for Voting</span>
                        <%
                                }else{
                        %>
                        <span class="badge badge-primary" ><a href="vote_page.jsp?eid=<%=rs.getString(1)%>&rid=<%=region_id%>" class="btn btn-success">Click here to Vote</a></span>
                        
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
                        <th class="col-md-2">Last Date</th>
                        <th class="col-md-4">Result</th>
                        <th class="col-md-4">Overall</th>
                    </tr>
                    
                   
                </thead>
                <tbody>
                    
                        <!-----------------------  Result by region---------------------------->    
                     <%
String QueryString2 = "SELECT * from elections where status=1 and (district='"+district+"' and state='"+state+"') or (district='' and state='"+state+"') order by ldate desc";
rs2 = statement.executeQuery(QueryString2);

            while (rs2.next()) {
                
            
            statement = connection.createStatement();
            String query_vote2 = "SELECT candidate_id FROM `tbl_vote` WHERE voter_id="+session.getAttribute("voter_id");
            ResultSet rs_vote2 = statement.executeQuery(query_vote2);
           
            int candi=0;
             String rid = "";
                while(rs_vote2.next()){
                    candi = rs_vote2.getInt("candidate_id");
                }


                                    statement = connection.createStatement();
                                    String query_region = "SELECT region_id from tbl_candidatefromregion where candidate_id="+candi;
                                    ResultSet rs_region = statement.executeQuery(query_region);
                                    int party = 0;
                                    while(rs_region.next()){
                                        rid += "region_id="+rs_region.getInt("region_id")+" or ";
                                        //party = rs_region.getInt("party_id");
                                    }
                                
                                    rid = rid.substring(0, rid.length()-4);
                                

%>

                     <tr>
                        <td ><%=rs2.getString("ename")%></td>
                        <td><%=rs2.getString("ldate")%></td>
                        
                    
                        
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
            String query_vote = "SELECT candidate_id,COUNT(*) FROM `tbl_vote` WHERE "+rid+" and election_id="+rs2.getString("id")+" GROUP by candidate_id";
            ResultSet rs_vote = statement.executeQuery(query_vote);
           
                             while(rs_vote.next())
                            {
                                voteCandiate=0;
                                if(cc==0){
                                   // cid=rs_vote.getInt("candidate_id");
        
                                
                            statement = connection.createStatement();
                            String query_totVote = "SELECT count(*) FROM `tbl_vote` where election_id="+rs2.getInt("id")+" and "+rid;
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
                            String query_pname = "SELECT party_id from tbl_candidatefromregion where candidate_id="+rs_vote.getString("candidate_id");
                            ResultSet rs_pname = statement.executeQuery(query_pname);
                            ResultSet rs_pname2=null;
                            while(rs_pname.next()){
                            statement = connection.createStatement();
                            String query_pname2 = "SELECT name from tbl_party where id="+rs_pname.getInt("party_id");
                            rs_pname2 = statement.executeQuery(query_pname2);
                                
                            }
                            while(rs_pname2.next()){
                                    out.print(rs_pname2.getString("name"));
                                break;
                                }
    %>
    
  </div>
                           </div>
                           <% 
                               
                           }
                           %>


                            </div>
                        </td>
                           <td>
                               <%
                               /*    
                                   
                            statement7 = connection.createStatement();
                            String sql_cid = "SELECT DISTINCT(candidate_id) FROM `tbl_candidatefromregion` WHERE election_id="+rs2.getInt("id");
                            ResultSet rs_cid = statement7.executeQuery(sql_cid);
                            ResultSet rs_reg = null;
                            //int p_id = 0;
                            String rid2 = "";
                            
                            while(rs_cid.next())
                            {
                                rid2="";
                                    statement8 = connection.createStatement();
                                    String query_reg = "SELECT region_id from tbl_candidatefromregion where candidate_id="+rs_cid.getInt("candidate_id");
                                    rs_reg = statement8.executeQuery(query_reg);
                                    
                                    while(rs_reg.next()){
                                        rid2 += "region_id="+rs_reg.getInt("region_id")+" or ";
                                        //break;
                                    }
                                rid2 = rid2.substring(0, rid2.length()-4);
                                
                                    statement9 = connection.createStatement();
                                    String query_vote3 = "SELECT distinct(candidate_id),COUNT(*) FROM `tbl_vote` WHERE "+rid2+" and election_id="+rs2.getInt("id")+" GROUP by candidate_id";
                                    //out.print(query_vote3);
                                    ResultSet rs_vote3 = statement9.executeQuery(query_vote3);
                                
                                    while(rs_vote3.next())
                                    {
                                    statement9 = connection.createStatement();
                                    String query_vote4 = "SELECT party_id FROM tbl_candidatefromregion where candidate_id="+rs_vote3.getInt("candidate_id")+" group by party_id";
                                    ResultSet rs_vote4 = statement9.executeQuery(query_vote4);
                                   int par = 0;
                                    while(rs_vote4.next())
                                    {
                                        par = rs_vote4.getInt("party_id");
                                    }
                                        if(tmp_vote == 0)
                                            tmp_vote = rs_vote3.getInt(2);
                                        if(tmp_vote <= rs_vote3.getInt(2))
                                        {
                                            tmp_vote = rs_vote3.getInt(2);
                                            tmp_cand = rs_vote3.getInt("candidate_id");
                                            tmp_party = par;
                                        }
                                        //out.print(rs_vote3.getInt("candidate_id"));
                                        //out.print(rs_vote3.getInt(2));
                                        
                                    }
                                    
                                //break;
                                out.print(tmp_cand);
           out.print(tmp_party);
                            }*/
                            
                               //out.print(rid);
                               %>
                               
                               
                               <div class="panel-body">
                       <div class="progress">
  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
    <span class="sr-only">40% Complete (success)</span>BJP
  </div>
</div>
<div class="progress">
  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">TMC
    <span class="sr-only">20% Complete</span>
  </div>
</div>
<div class="progress">
  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
    <span class="sr-only">60% Complete (warning)</span>
  </div>
</div>
<div class="progress">
  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
    <span class="sr-only">80% Complete</span>
  </div>
</div>
                            </div>
                        </td>
                     </tr>
           <% } 
           
           %>      
                     
                    
                </tbody>
            </table>
        
        
        <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
    
    
    
  <%
// close all the connections.

statement.close();
connection.close();
} catch (Exception ex) {
%>
<%
    out.println(ex);
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
