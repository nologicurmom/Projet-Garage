/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;



import BaseModel.Employe;
import BaseModel.Facture;
import BaseModel.Marge;
import BaseModel.Materiel;
import BaseModel.Paiement_Facture;
import BaseModel.DetailFacture;
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
public class VersPoste extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {

        try {
            
       
             Employe e = new Employe();
            
           
             List<Object[]> listEmploye = e.ListEmploye();
         
                     
               request.setAttribute("listEmploye",listEmploye);
            //liste service
            
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
