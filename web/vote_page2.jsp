<%-- 
    Document   : show_elections
    Created on : Apr 22, 2018, 1:22:04 PM
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

    
  
    <%
            int cid = Integer.parseInt(request.getParameter("cid"));
            int vid = Integer.parseInt(request.getParameter("vid"));
            int eid = Integer.parseInt(request.getParameter("eid"));
            int rid = Integer.parseInt(request.getParameter("rid"));
            //int pid = Integer.parseInt(request.getParameter("pid"));
            int pid = 0;
            String time = new java.util.Date().toLocaleString();
            try{
         //out.print(session.getAttribute("voter_id"));
         Class.forName("com.mysql.jdbc.Driver"); // MySQL database  connection
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_evoting?zeroDateTimeBehavior=convertToNull","root","");
                    
                    
                    
                              Statement statement = con.createStatement();
                             String query_pname = "SELECT * from tbl_candidatefromregion where candidate_id="+cid;
                             ResultSet rs_pname = statement.executeQuery(query_pname);
                             while(rs_pname.next())
                             {
                                 pid = rs_pname.getInt("party_id");
                             }
                    
                    
                    
                    Statement stmt=con.createStatement();
                    String s1="insert into tbl_vote (election_id,voter_id,candidate_id,region_id,party_id,date1) values ("+eid+","+vid+","+cid+","+rid+","+pid+",'"+time+"')";

                    int x =stmt.executeUpdate(s1);
                    
           
                    if(x>0)
                        response.sendRedirect("index.jsp");
                    else
                        out.print("Error occors , Please try again.");
                    
// close all the connections.

stmt.close();
//statement2.close();

con.close();
} catch (Exception ex) {
    out.println("Unable to connect to database.");
}%>

    
    
   