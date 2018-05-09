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
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rocky
 */
public class Login extends HttpServlet {

    
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
                     {
                         
                         String vid=req.getParameter("voter_id");
                         String pwd=req.getParameter("pwd");
                    ResultSet rs = null;     
                         
        
         try  
           
                {
                    
                    Class.forName("com.mysql.jdbc.Driver"); // MySQL database  connection
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_evoting?zeroDateTimeBehavior=convertToNull","root","");
                    Statement stmt=con.createStatement();
                    //String s1="insert into tbl_candidate (name,election_id,party_id,gender,address,ph_no,desc1) values ('"+candidate_name+"',"+Integer.parseInt(election_id)+","+Integer.parseInt(party_id)+",'"+gender+"','"+address+"','"+mobile_no+"','"+description+"')";

                    String s1 = "select count(*) from tbl_voters where id="+Integer.parseInt(vid)+" and pwd = '"+pwd+"'";
                    rs =stmt.executeQuery(s1);
                    int c =0;
                    while(rs.next())
                    {
                        c = rs.getInt(1);
                    }
                    if(c > 0)
                    {
                         HttpSession session=req.getSession(true);
                       
                         session.setAttribute("voter_id",vid);
                         res.sendRedirect("index.jsp");
                    }else{
                     out.println("<p style=font-color:red;><center>Either user name or password is incorrect</center></p>");
                        RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
                       
                        rd.include(req, res);
                    }    
                    con.close();
                    
                }
             catch(Exception e)
                 
             {
                 System.out.println(e);
                    
                }
        
    }    
}
