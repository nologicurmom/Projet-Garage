/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;



import BaseModel.Client;
import BaseModel.Employe;
import BaseModel.Facture;
import BaseModel.Marge;
import BaseModel.Materiel;
import BaseModel.Paiement_Facture;
import BaseModel.DetailFacture;
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

/**
 *
 * @author ASUS
 */
public class AjoutFacture extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {

        try {
            Facture f = new Facture();
            Client c = new Client();
            //liste service
            int idclient = Integer.parseInt(request.getParameter("idclient").toString());
           
             Date d = c.getDate(idclient);
            
            int idfacture = f.Facturer(idclient);
            
            List<Object[]> SituationFacture = f.SituationFacture(idclient);
                     
            request.setAttribute("idclient",idclient);
            request.setAttribute("idfacture",idfacture);
            request.setAttribute("SituationFacture",SituationFacture);
            request.setAttribute("dated", d);
            //liste service
            
            
            RequestDispatcher rd = request.getRequestDispatcher("DetailFacture.jsp");
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
