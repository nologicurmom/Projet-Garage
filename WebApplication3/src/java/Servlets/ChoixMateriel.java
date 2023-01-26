/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;



import BaseModel.Employe;
import BaseModel.Marge;
import BaseModel.Materiel;
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
public class ChoixMateriel extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {

        try {
            //liste genre
         int id_materiel = Integer.parseInt(request.getParameter("choix").toString());
         Materiel m = new Materiel();
         Marge me = new Marge();
         float prixAchat = m.getPrixAchat(id_materiel);
         float benefice = me.getBenefice(prixAchat);
         float prixVenteConseille = me.getPrixAchatConseiller(prixAchat);
         float pourcentage = me.getPourcentage(prixAchat);
         
  //       int id_employe = e.insererEmploye();
         request.setAttribute("pourcentage",pourcentage); 
         request.setAttribute("benefice",benefice);
         request.setAttribute("prixVenteConseille",prixVenteConseille);
         request.setAttribute("prixAchat",prixAchat);
         
            RequestDispatcher rd = request.getRequestDispatcher("Estimation.jsp");
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
