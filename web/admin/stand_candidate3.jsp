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

//statement2 = connection.createStatement();
// sql query to retrieve values from the secified table.


    %>
    
    <%
            int election_id = Integer.parseInt(request.getParameter("election_id"));
            int party_id = Integer.parseInt(request.getParameter("party_id"));
            
            int count = Integer.parseInt(request.getParameter("count"));
            for(int i = 1;i<=count;i++)
            {
            int region_id = Integer.parseInt(request.getParameter("region_id"+i));
            
            int candidate_id = Integer.parseInt(request.getParameter("candidate"+i));
                if(candidate_id!=0)
                {
                    statement = connection.createStatement();
                    String s1="insert into tbl_candidatefromregion (election_id,party_id,region_id,candidate_id) values("+election_id+","+party_id+","+region_id+","+candidate_id+")";
                    int x =statement.executeUpdate(s1);
                    
                    if(x>0)
                        response.sendRedirect("stand_candidate.jsp?msg=1");
                    else
                        response.sendRedirect("stand_candidate.jsp?msg=0");
                    
                }
            }        
            
// close all the connections.
rs.close();

//statement2.close();
statement.close();
connection.close();
} catch (Exception ex) {
    //out.println("Unable to connect to database.");
}%>

    
    
   