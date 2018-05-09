/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rocky
 */
public class CreateCandidate extends HttpServlet  {

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
                         
                         String candidate_name=req.getParameter("candidate_name");
                         String election_id=req.getParameter("election_id");
                         String party_id=req.getParameter("party_id");
                         //String starting_date=req.getParameter("starting_date");
                         String gender=req.getParameter("gender");
                         String address=req.getParameter("address");
                         String mobile_no=req.getParameter("mobile_no");
                         String description=req.getParameter("description");
                         String banner = "null";
                         
                         //SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                           // Date date = formatter.format(starting_date);
                        
        
         try  
           
                {
                    Class.forName("com.mysql.jdbc.Driver"); // MySQL database  connection
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_evoting?zeroDateTimeBehavior=convertToNull","root","");
                    Statement stmt=con.createStatement();
                    String s1="insert into tbl_candidate (name,election_id,party_id,gender,address,ph_no,desc1) values ('"+candidate_name+"',"+Integer.parseInt(election_id)+","+Integer.parseInt(party_id)+",'"+gender+"','"+address+"','"+mobile_no+"','"+description+"')";

                    int x =stmt.executeUpdate(s1);
                    
                    
                    
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
   
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
   
    
}
