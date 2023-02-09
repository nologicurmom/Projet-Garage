<%-- 
    Document   : niveauEtude
    Created on : 18 janv. 2023, 21:08:53
    Author     : TERRAQUE
--%>
<%@page import="java.util.List"%>
<%
  int id_employe = Integer.parseInt(request.getAttribute("id_employe").toString());
    List<Object[]> listEmploye = (List<Object[]>) request.getAttribute("listEmploye");
%>
<%-- 
    Document   : service
    Created on : 17 janv. 2023, 20:33:26
    Author     : KTM
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

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
         <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-left justify-content-center py-0">
          <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-0 col-md-0  flex-column align-items-left justify-content-left">

              <div class="d-flex  py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                 
                  <span class="badge border-success text-info">Service Client</span>
                </a>
              </div><!--    <img src="assets/img/pngegg (3).png" width="40" height="40" alt="">-->

              <div class="card mb-3">
       <form action="TraitementService" method="post" class="row g-3 needs-validation" novalidate>
           <div class="col-12">
                        <h4> <label for="yourName" class="badge border-success border-1 text-info">Employer</label></h4>
                      <div class="input-group has-validation">
                       <select name="Employer" class="form-select" required id="Employer" >
                       <option value="">Employer</option>
                         <% for(int i=0;i<listEmploye.size();i++) { %>
                         <option value="<%=  listEmploye.get(i)[0] %>"><%= listEmploye.get(i)[1] %> <%= listEmploye.get(i)[2] %></option>
                       <% } %>
              </select>
                        <div class="invalid-feedback">Entrer un Employer</div>
                      </div>
                    </div>
              <div class="col-12">
                        <h4> <label for="yourEmployer" class="badge border-success border-1 text-info">Type de service</label></h4>
                      <div class="input-group has-validation">
                       <select name="TypeService" class="form-select" required id="Service" >
                       <option value="">Type Service</option>
                       <option value="1">Reparation</option>
                       <option value="2">Depannage</option>
                       <option value="3">Vidange</option>
              </select>
                        <div class="invalid-feedback">Entrer un Service</div>
                      </div>
                    </div>
   
          <div class="col-12">
                        <h4> <label for="Données" class="badge border-success border-1 text-info">Durreé</label></h4>
                      <input type="text" name="durree" class="form-control" required id="Service" >
                      <div class="invalid-feedback">Entrer des Durreé </div>
            </div>
         <div class="col-6">
             <input type="submit" value="Inserer">                     
             </form>
                 
                </tbody>
              </table>
                  </div>
                </div>
              </div>
         
                  </div>
                </div>
</div>
           
    </body>
    
    
  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.min.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</html>
