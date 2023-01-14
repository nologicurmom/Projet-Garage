/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.lang.reflect.Constructor;
import java.util.ArrayList;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author KTM
 */
@WebServlet(urlPatterns = {"/inscription"})
public class inscription extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 public void doGet(HttpServletRequest request,
					HttpServletResponse response)
	  throws ServletException, IOException {
	response.setContentType("text/html");
        Connex cnx = new Connex();
	Connection cn = cnx.OracleConnect();
        Intermediaire in= new Intermediaire() ;
        Employer emp=new Employer();
      /*  try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Action</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Action at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
        if(request.getParameter("Nom")==null || request.getParameter("Prenom")==null || request.getParameter("Genre")==null||request.getParameter("Date_de_naissance")==null ){
        response.sendRedirect("index.jsp");
        }
       
	String Nom=request.getParameter("Nom") ;
	String Prenom=request.getParameter("Prenom");
	String Genre =request.getParameter("Genre"); 
        String Date=request.getParameter("Date_de_naissance"); 
        request.getSession().setAttribute("Nom",Nom );
        request.getSession().setAttribute("Prenom",Prenom );
        request.getSession().setAttribute("Genre",Genre );
        request.getSession().setAttribute("Date",Date );

        response.sendRedirect("index2.jsp");

        /*
     try {	    
         in.initial_emp(cn, Nom, Prenom, Date, Genre);
     } catch (SQLException ex) {
         Logger.getLogger(inscription.class.getName()).log(Level.SEVERE, null, ex);
     }
*/
	//response.sendRedirect("../faces/index.jsp");
    //    
       
				
  }
}

