/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rocky
 */
public class AdminLogout extends HttpServlet
{
 private static final long serialVersionUID = 1L;
 
 @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
 {
 
 HttpSession session = request.getSession(); //Fetch session object
 
 if(session!=null) //If session is not null
 {
     session.setAttribute("a_idd",null);
     session.invalidate(); //removes all session attributes bound to the session
 
 response.sendRedirect("login_admin.jsp");
 System.out.println("Logged out");
 }
 }
}