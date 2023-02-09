<%-- 
    Document   : FormPoste
    Created on : 8 févr. 2023, 14:18:56
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
       <form action="InsertionPoste" method="POST">
             <select name="Employer" class="form-select" required id="Employer" >
                       <option value="">Employer</option>
                         <% for(int i=0;i<listEmploye.size();i++) { %>
                         <option value="<%=  listEmploye.get(i)[0] %>"><%= listEmploye.get(i)[1] %> <%= listEmploye.get(i)[2] %></option>
                       <% } %>
              </select>
            <select name="poste">
                <option value="">choisir une poste</option>
                <option value="1">vidange</option>
                <option value="2">reparateur pneu</option>       
                <option value="3">lavagiste</option>
            </select>
              <input type="text" name="salaire" placeholder="salaire de base">  
            <input type="submit" value="enregister">    
        </form>
    </body>
</html>
