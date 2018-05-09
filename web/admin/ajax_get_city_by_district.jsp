<%-- 
    Document   : ajax_get_districts_by_state
    Created on : Apr 27, 2018, 1:03:04 PM
    Author     : Rocky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
  
<%  
String s=request.getParameter("district");  
//if(s==null || s.trim().equals("")){  
//out.print("Please enter id");  
//}else{  
//int id=Integer.parseInt(s);  
//out.print(id);  
try{  
Class.forName("com.mysql.jdbc.Driver"); // MySQL database  connection
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_evoting?zeroDateTimeBehavior=convertToNull","root","");
Statement statement=con.createStatement();

String QueryString = "SELECT city from tbl_region where district='"+s+"'";
ResultSet rs = statement.executeQuery(QueryString);

           
String output = "<option value=''>Select</option>";
while(rs.next()){  
    output+="<option value='"+rs.getString("city")+"'>"+rs.getString("city")+"</option>";
//out.print("<option value='"+rs.getString("district")+"'>"></option>");  
} 
out.print(output);
rs.close();
statement.close();
con.close();  
}catch(Exception e){e.printStackTrace();}  
//}  
%>  