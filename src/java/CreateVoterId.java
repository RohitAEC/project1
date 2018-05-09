/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rocky
 */
public class CreateVoterId extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
                     {
                         
                         String full_name=req.getParameter("full_name");
                         String father_name=req.getParameter("father_name");
                         String mother_name=req.getParameter("mother_name");
                         String dob=req.getParameter("dob");
                         String gender=req.getParameter("gender");
                         String state=req.getParameter("state");
                         String district=req.getParameter("district");
                         String city=req.getParameter("city");
                         String landmark=req.getParameter("landmark");
                         String pincode=req.getParameter("pincode");
                         String email=req.getParameter("email");
                         String mobile_no=req.getParameter("mobile_no");
                         String banner = "null";
                         String time = new java.util.Date().toLocaleString();
          
        
         try  
           
                {
                    Class.forName("com.mysql.jdbc.Driver"); // MySQL database  connection
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_evoting?zeroDateTimeBehavior=convertToNull","root","");
                    
                    Statement statement=con.createStatement();

                    String QueryString = "SELECT id from tbl_region where city='"+city+"' and district='"+district+"' and state='"+state+"'";
                    ResultSet rs = statement.executeQuery(QueryString);
                    int region_id=0;
                    while(rs.next()){
                        region_id = rs.getInt("id");
                        break;
                    }
                    
                    Statement stmt=con.createStatement();
                    String s1="insert into tbl_voters (full_name,father_name,mother_name,dob,gender,region_id,landmark,pincode,email,mobile_no,created_date,pwd) values('"+full_name+"','"+father_name+"','"+mother_name+"','"+dob+"','"+gender+"',"+region_id+",'"+landmark+"',"+Integer.parseInt(pincode)+",'"+email+"','"+mobile_no+"','"+time+"','123')";

                    int x =stmt.executeUpdate(s1);
                    if(x>0)
                        res.sendRedirect("admin/create_voter_id.jsp?msg=1");
                    else
                        res.sendRedirect("admin/create_voter_id.jsp?msg=0");
                    
                    
                    
                    con.close();
                    
                }
             catch(Exception e)
                 
             {
                 System.out.println(e);
                    
                }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
}