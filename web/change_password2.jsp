<%-- 
    Document   : show_elections
    Created on : Apr 22, 2018, 1:22:04 PM
    Author     : Sanjoy
--%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
if(session.getAttribute("voter_id")==null || session.getAttribute("voter_id")=="")
{
    response.sendRedirect("login.jsp");
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 


    
  
    <%
            String cpwd = request.getParameter("cpwd");
            String npwd = request.getParameter("npwd");
            
            
            try{
         //out.print(session.getAttribute("voter_id"));
         Class.forName("com.mysql.jdbc.Driver"); // MySQL database  connection
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_evoting?zeroDateTimeBehavior=convertToNull","root","");
                    Statement stmt=con.createStatement();
                    String sql = "select pwd from tbl_voters where id="+session.getAttribute("voter_id");
//String s1="update tbl_voters set (election_id,voter_id,candidate_id,region_id,party_id) values ("+eid+","+vid+","+cid+","+rid+","+pid+")";
                    ResultSet rs = stmt.executeQuery(sql);
                    while(rs.next())
                    {
                        if(cpwd.equals(rs.getString("pwd")))
                        {
                            stmt=con.createStatement();
                    String s1="update tbl_voters set pwd='"+npwd+"' where id="+session.getAttribute("voter_id");
                    int x =stmt.executeUpdate(s1);
                    
           
                    if(x>0)
                        out.print("Password has been changed successfully");
                    else
                        out.print("Current Password Didn't Match");
                        }
                        else
                        {
                            response.sendRedirect("change_password.jsp");
                        }
                    }
                    
                    
                    
                    
// close all the connections.

stmt.close();
//statement2.close();

con.close();
} catch (Exception ex) {
    out.println(ex);
}%>

    
    
   