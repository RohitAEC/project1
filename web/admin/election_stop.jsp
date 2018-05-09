<%-- 
    Document   : election_start
    Created on : Apr 28, 2018, 3:23:21 PM
    Author     : Rocky
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String eid = request.getParameter("eid");
int x=0;
if(eid != null)
{
    PreparedStatement ps = null;
    int id = Integer.parseInt(eid);
    int cid = 0;
    int rid = 0;
    try
    {
        Class.forName("com.mysql.jdbc.Driver"); // MySQL database  connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_evoting?zeroDateTimeBehavior=convertToNull","root","");
        ///update elections table status
        Statement stmt=con.createStatement();
        String sql="Update elections set status=1 where id="+id;
        ps = con.prepareStatement(sql);
        int i = ps.executeUpdate();
        ////get all region,candidate by election id
        
        
    if(i > 0)
    {
        response.sendRedirect("index.jsp?msg=1");
    }
    else
    {
        response.sendRedirect("index.jsp?msg=1");
    } 
    }
    catch(SQLException sql)
    {
        request.setAttribute("error", sql);
        out.println(sql);
    }
}
%>