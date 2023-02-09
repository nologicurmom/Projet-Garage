/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;



import BaseModel.Employe;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class InsertionPoste extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {

        try {
            Employe e = new Employe();
          
         int idemployer = Integer.parseInt(request.getParameter("Employer"));
         int idposte = Integer.parseInt(request.getParameter("poste"));
         float salaire = Float.parseFloat(request.getParameter("salaire"));
     
         e.insererEmployePoste(idemployer, idposte, salaire);
         
         List<Object[]> listEmploye = e.ListEmploye();
         request.setAttribute("listEmploye",listEmploye);
         
            RequestDispatcher rd = request.getRequestDispatcher("FormPoste.jsp");
            rd.forward(request, res);
            
        } catch (Exception e) {
            PrintWriter out = res.getWriter();
            out.print(e.fillInStackTrace());
        }

    }
    
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         {
          
        }
    }
      
      
}
