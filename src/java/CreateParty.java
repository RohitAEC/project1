/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Rocky
 */
public class CreateParty extends HttpServlet {

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
                         
                         String pname=req.getParameter("party_name");
                         
                         String banner = "null";
                         
       
         
                         //SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                           // Date date = formatter.format(starting_date);
                        
        
         try  
           
                {
                    Class.forName("com.mysql.jdbc.Driver"); // MySQL database  connection
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_evoting?zeroDateTimeBehavior=convertToNull","root","");
                    Statement stmt=con.createStatement();
                    
       
                    
                    String s1="insert into tbl_party (name) values('"+pname+"')";

                    int x =stmt.executeUpdate(s1);
                    if(x>0)
                        res.sendRedirect("admin/add_party.jsp?msg=1");
                    else
                        res.sendRedirect("admin/add_party?msg=0");
                    
                    
                    
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