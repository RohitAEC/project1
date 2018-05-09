<%-- 
    Document   : add_candidate2
    Created on : Apr 21, 2018, 11:45:26 PM
    Author     : Rocky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String candidate_name=request.getParameter("candidate_name");
                         //String election_id=request.getParameter("election_id");
                         //String party_id=request.getParameter("party_id");
                         //String starting_date=req.getParameter("starting_date");
                         String gender=request.getParameter("gender");
                         String address=request.getParameter("address");
                         String mobile_no=request.getParameter("mobile_no");
                         String description=request.getParameter("description");
                         String banner = "null";

Class.forName("com.mysql.jdbc.Driver"); // MySQL database  connection
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_evoting?zeroDateTimeBehavior=convertToNull","root","");
                    
Statement stmt= con.createStatement(); 
String s1="insert into tbl_candidate (name,gender,address,ph_no,desc1) values ('"+candidate_name+"','"+gender+"','"+address+"','"+mobile_no+"','"+description+"')";

                    int x =stmt.executeUpdate(s1);
                    if(x>0)
                        response.sendRedirect("add_candidate.jsp?msg=1");
                    else
                        response.sendRedirect("add_candidate.jsp?msg=0");
                    
%>