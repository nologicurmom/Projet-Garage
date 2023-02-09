<%-- 
    Document   : Detail
    Created on : 31 janv. 2023, 21:56:33
    Author     : TERRAQUE
--%>
<%@page import="java.util.List"%>
<%
    List<Object[]> SituationFacture = (List<Object[]>) request.getAttribute("SituationFacture");
    List<Object[]> facturefille = (List<Object[]>) request.getAttribute("facturefille");
    int idfacture = Integer.parseInt(request.getAttribute("idfacture").toString());
    int isa = Integer.parseInt(request.getAttribute("isa").toString());
%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Facture</h1>
        
        <h1>Detail facture:</h1>
          <% for(int i=0;i< facturefille.size();i++) { %>
                                        
       <p>
              idclient : <%= facturefille.get(i)[1]  %>
       designation :<%= facturefille.get(i)[2]  %>
         quantiter :<%= facturefille.get(i)[3]  %>
           prix avec remise : <%= facturefille.get(i)[4] %>
           remise : <%= facturefille.get(i)[5] %>%
           prix unitaire :  <%= facturefille.get(i)[6] %>
          
       </p>
                                        <% } %> 
       <%  if(isa==1) { %>
       
               <% for(int i=0;i<SituationFacture.size();i++) { %>
                                           
             <p>Facture <%= SituationFacture.get(i)[0]  %></p>
             <p>Affilie a <%= SituationFacture.get(i)[4]  %>  <%= SituationFacture.get(i)[5]  %></p>
             <p>Total a payer :<%= SituationFacture.get(i)[1]  %> </p>
             <p>Reste a payer: 0</p>
             <p>Gratuitt puisque c'est votre premiere commande de cette année</p>                    
                                      
         <%  } %>   
               
       <% } else { %>
                 
        <% for(int i=0;i<SituationFacture.size();i++) { %>
                                           
             <p>Facture <%= SituationFacture.get(i)[0]  %></p>
             <p>Affilie a <%= SituationFacture.get(i)[4]  %>  <%= SituationFacture.get(i)[5]  %></p>
             <p>Total a payer :<%= SituationFacture.get(i)[1]  %> </p>
             <p>Reste a payer: <%= SituationFacture.get(i)[2]  %></p>
              <% if(Float.parseFloat(SituationFacture.get(i)[2].toString()) == 0.0f) { %>
             <p>payé</p>
             <%  } else { %>
              <p>non payé</p>
       
                <% } %>
               <% } %>  
              
        <% } %>
                                        <form action="Paiement_facture" method="post">
                                            <input type="hidden" name="idfacture" value="<%= idfacture %>">
                                            <input type="text" name="montant">
                                            <input type="submit" value="payer">
                                        </form>                             
                                       
    </body>
</html>
