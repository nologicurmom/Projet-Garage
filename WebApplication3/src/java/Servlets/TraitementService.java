/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import BaseModel.Benefice;
import BaseModel.Employe;
import BaseModel.Employe_Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TERRAQUE
 */
public class TraitementService extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
        try {
             Connection con;
    {
        try {
            con = objectBdd.ManipDb.pgConnect("postgres","garage","hardi");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
            int id_employer = Integer.parseInt(request.getParameter("Employer").toString());
            int TypeService = Integer.parseInt(request.getParameter("TypeService").toString());
            int durree = Integer.parseInt(request.getParameter("durree").toString());
           
            Employe_Service es = new Employe_Service();
            es.setId_employe(id_employer);
            es.setId_type_service(TypeService);
            es.setDureeService(durree);
            es.New_Employe_Service();
            
            Benefice b = new Benefice();
            
            List<Benefice> getBenefice = b.getBenefice(con, TypeService);
            
            request.setAttribute("liste",getBenefice);
            
            RequestDispatcher rd = request.getRequestDispatcher("Tableau.jsp");
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
