<%-- 
    Document   : Tableau
    Created on : 19 janv. 2023, 13:59:02
    Author     : TERRAQUE
--%>

<%@page import="BaseModel.Benefice"%>
<%@page import="java.util.List"%>
<%

List<Benefice> liste = (List<Benefice>) request.getAttribute("liste");
    
 %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <title>Service</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <!-- Google Fonts -->
  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Tableau de bord</h1>
        
          <h3 class="modal-title">Tableau de bord</h3>
                      
                    </div>
                    <div class="modal-body">
                          <table class="table ">
                <thead>
                  <tr>
                    <th scope="col">Bénefice</th>
                          <th scope="col">Type service</th>
                  </tr>
                </thead>
                <tbody>
                <% for (Benefice b : liste) { %>
                   <tr>
                    <th scope="row"><%= b.getBenefice() %></th>
                    <td><%= b.getTypeservice() %></td>
                  </tr>
                <% } %>
                 
                </tbody>
              </table>
        
    </body>
</html>
