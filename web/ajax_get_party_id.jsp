<%-- 
    Document   : ajax_get_party_id.jsp
    Created on : Apr 21, 2018, 11:58:24 PM
    Author     : Sanjoy
--%>

<%@ page import="java.sql.*"%>  
  
<%  
String s=request.getParameter("id");  
if(s==null || s.trim().equals("")){  
out.print("Please enter id");  
}else{  
int id=Integer.parseInt(s);  
out.print(id);  

%>