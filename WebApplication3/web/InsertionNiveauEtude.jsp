<%-- 
    Document   : insertionNiveauEtude
    Created on : 8 févr. 2023, 09:38:42
    Author     : TERRAQUE
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 List<Object[]> listEmploye = (List<Object[]>) request.getAttribute("listEmploye");
%>
 <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form action="niveauEtude" method="POST">
             <select name="Employer" class="form-select" required id="Employer" >
                       <option value="">Employer</option>
                         <% for(int i=0;i<listEmploye.size();i++) { %>
                         <option value="<%=  listEmploye.get(i)[0] %>"><%= listEmploye.get(i)[1] %> <%= listEmploye.get(i)[2] %></option>
                       <% } %>
              </select>
            <select name="niveau">
                <option value="">choisir niveau etude</option>
                <option value="1">L2</option>
                <option value="2">M1</option>       
                <option value="3">L3</option>
            </select>
            <input type="submit" value="enregister">    
        </form>
        
        <form action="specialiter" method="POST">
             <select name="Employer" class="form-select" required id="Employer" >
                       <option value="">Employer</option>
                         <% for(int i=0;i<listEmploye.size();i++) { %>
                         <option value="<%=  listEmploye.get(i)[0] %>"><%= listEmploye.get(i)[1] %> <%= listEmploye.get(i)[2] %></option>
                       <% } %>
              </select>
            <select name="specialiter">
                <option value="">choisir specialiter</option>
                <option value="1">Vidange</option>
                <option value="2">mecanicien/ne</option>       
                <option value="3">lavage</option>
            </select>
            <input type="submit" value="enregister">
        </form>
        
        
    </body>
</html>
