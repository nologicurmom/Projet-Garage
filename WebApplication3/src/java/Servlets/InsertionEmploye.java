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
public class InsertionEmploye extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {

        try {
            //liste genre
         String nom = request.getParameter("nom");
         String prenom = request.getParameter("prenom");
         String date_naissance = request.getParameter("date_naissance");
         int id_genre = Integer.parseInt(request.getParameter("id_genre"));
          Employe e = new Employe();
         e.setNom(nom);
         e.setPrenom(prenom);
         e.setDate_naissance(date_naissance);
         e.setId_genre(id_genre);
  //       int id_employe = e.insererEmploye();
         
         request.setAttribute("id_employe",1);
            RequestDispatcher rd = request.getRequestDispatcher("niveauEtude.jsp");
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
