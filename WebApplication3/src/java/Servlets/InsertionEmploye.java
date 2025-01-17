/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;



import BaseModel.Employe;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.Period;
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
        
         Date d = Date.valueOf(date_naissance);
         
         //calcul age 
        LocalDate date = d.toLocalDate();
        LocalDate datefin = LocalDate.now();
        Period age = Period.between(date,datefin); 
         
         
         int id_employe = 0;
            Employe e = new Employe();
         e.setNom(nom);
         e.setPrenom(prenom);
         e.setD(date_naissance);
         e.setId_genre(id_genre);
         if (age.getYears() < 18) {
            res.sendRedirect("InsertionEmploye.jsp?error=1");
         }
         else {
               id_employe = e.insererEmploye();
         }
         List<Object[]> listEmploye = e.ListEmploye();
         request.setAttribute("id_employe",id_employe);
         request.setAttribute("listEmploye",listEmploye);
         
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
