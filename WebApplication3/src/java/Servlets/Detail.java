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
import java.time.LocalDate;
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
public class Detail extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {

        try {
            DetailFacture df = new DetailFacture();
            //liste service
              Facture f = new Facture();
           
            int idfacture = Integer.parseInt(request.getParameter("id").toString());
            int idclient =  Integer.parseInt(request.getParameter("idclient").toString());
                 LocalDate datefin = LocalDate.now();
            int isa = df.CommandeParAnnee(idclient,datefin.getYear());
            
                         List<Object[]> SituationFacture = f.DetailFacture(idfacture);
         
                         List<Object[]> FactureFille = df.FactureFille(idfacture);
               
            request.setAttribute("idfacture",idfacture);
             request.setAttribute("SituationFacture",SituationFacture);
               request.setAttribute("facturefille", FactureFille);
            request.setAttribute("isa",isa);
            //liste service
            
            RequestDispatcher rd = request.getRequestDispatcher("Detail.jsp");
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
