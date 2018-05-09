/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Date;

public class CreateVoter extends HttpServlet {

    public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException //first Request then Response
      {
        /*  res.setContentType("text/html");
          PrintWriter pw1=res.getWriter();
          String fnm=req.getParameter("full Name");
          String fanm=req.getParameter("father_name");
          String mnm=req.getParameter("mother_name");
          int dob=Integer.parseInt(req.getParameter("dob"));
          String gnd=req.getParameter("gender");
          String state=req.getParameter("state");
          String city=req.getParameter("city");
          String address=req.getParameter("address");
          int pin=Integer.parseInt(req.getParameter("pincode"));
          String pstn=req.getParameter("police_station");
          String email=req.getParameter("email");
          int mob=Integer.parseInt(req.getParameter("mobile"));
          String image=req.getParameter("image");
          */
        
             try  
           
                {
                    Class.forName("com.mysql.jdbc.Driver"); // MySQL database  connection
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");
                    Statement stmt=con.createStatement();
                    String s1="select * from 'test1'.test";
//String q1="insert into user_id values('"+fnm+"','"+fanm+"','"+mnm+"','+dob+','"+state+"','"+address+"','+pin+','"+pstn+"','"+email+"','+mob+','"+image+"')";
                    ResultSet rs =stmt.executeQuery(s1);
                    
                    if(rs.next())
                         
                    {
                         System.out.println("id"+rs.getInt(1));
                         System.out.println("name"+rs.getString(2));
                         System.out.println("addr"+rs.getString(3));
                         System.out.println("ph"+rs.getInt(4));
                    }
                    
                    else
                        
                    {
                       System.out.println("no such record");
                    }
                    
                    con.close();
                    
                }
             catch(Exception e)
                 
             {
                 System.out.println(e);
                    
                }
          
          
      }

}

