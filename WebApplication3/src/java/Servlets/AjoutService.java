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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Calendar;

/**
 *
 * @author ASUS
 */
public class AjoutService extends HttpServlet {
    
    public void doPost(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {

        try {
            DetailFacture df = new DetailFacture();
            //liste service
              Facture f = new Facture();
            Client c = new Client();
            int idclient = Integer.parseInt(request.getParameter("idclient").toString());
            int idfacture = Integer.parseInt(request.getParameter("idfacture").toString());
           int typeservice = Integer.parseInt(request.getParameter("typeservice").toString());
            int quantiter =  Integer.parseInt(request.getParameter("quantiter").toString());
            float prix = Float.parseFloat(request.getParameter("prix").toString());
          float r = Float.parseFloat(request.getParameter("remise").toString());
          
             String dateC = request.getParameter("dateC");
   
               Date d1 = Date.valueOf(dateC);
               LocalDate datefin = d1.toLocalDate();
            //systeme
             
    //    LocalDate datefin = LocalDate.now();
            int moisS = datefin.getMonthValue();
            int jourS = datefin.getDayOfMonth();
            //client
            Date d = c.getDate(idclient);
            LocalDate dc = d.toLocalDate();
            int mois = dc.getMonthValue();
            int jour = dc.getDayOfMonth();
            
            float remise = 0.0f;
            
            if(mois==moisS && jourS == jour)
            {
                remise = 50;   
                   float prix_remise = (prix * remise)/100;
           float prix_final = prix - prix_remise;
           
            df.insertDetailFacture(typeservice, idclient, idfacture, quantiter, prix_final,remise,prix,dateC);
            }    
            else {
            df.insertDetailFacture(typeservice, idclient, idfacture, quantiter, prix,0,prix,dateC);
            } 
         //   Remise r = new Remise();
       //    Remise remise = r.getRemise(typeservice);
           
        
            
                         List<Object[]> SituationFacture = f.SituationFacture(idclient);
            
            request.setAttribute("idfacture",idfacture);
             request.setAttribute("idclient",idclient);
             request.setAttribute("dated", d);
             request.setAttribute("SituationFacture",SituationFacture);
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
