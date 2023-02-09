<%-- 
    Document   : DetailFacture
    Created on : 31 janv. 2023, 21:30:29
    Author     : TERRAQUE
--%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%
    int idclient = Integer.parseInt(request.getAttribute("idclient").toString());
    int idfacture = Integer.parseInt(request.getAttribute("idfacture").toString());
    List<Object[]> SituationFacture = (List<Object[]>) request.getAttribute("SituationFacture");
    Date d = (Date) request.getAttribute("dated");
%>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Date Naissance : <%= d %></p>
        <form action="AjoutService" method="post">
            <input type="hidden" name="idclient" value="<%= idclient %>"> 
            <input type="hidden" name="idfacture" value="<%= idfacture %>">    
            <select name="typeservice">
                <option value="">choisir service</option>
                <option value="1">Reparation</option>
                <option value="2">Depannage</option>
                <option value="3">Vidange</option>
            </select>
            <input type="text" name="quantiter" placeholder="quantiter">
            <input type="text" name="prix" placeholder="prix unitaire">
            <input type="text" name="remise" placeholder="remise">
            <input type="date" name="dateC" placeholder="date commande">
            <input type="submit" value="enregistrer">
        </form>
           
           <h1>Liste Facture</h1>
        
            <% for(int i=0;i<SituationFacture.size();i++) { %>
                                        
                                            <a href="Detail?id=<%= SituationFacture.get(i)[0]  %>&&idclient=<%= idclient %>">Facture<%= SituationFacture.get(i)[0]  %></p>
                                            <p>Date facture: <%=  SituationFacture.get(i)[6]  %></p>   
                                           <% if(Float.parseFloat(SituationFacture.get(i)[2].toString()) == 0.0f) { %>
       <p>non payé</p>
       <%  } else { %>
        <p>non payé</p>
       <% } %>
                                 <% } %>
           
                                
    </body>
</html>
