<%-- 
    Document   : Choix_de_produit
    Created on : 26 janv. 2023, 12:17:08
    Author     : noctu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                 
                  <span class="badge border-success text-info">Estimation</span>
                </a>
              </div><!--    <img src="assets/img/pngegg (3).png" width="40" height="40" alt="">-->

              <div class="card mb-3">


                 

                    <form action="ChoixMateriel" method="post" class="row g-3 needs-validation" novalidate>
<div class="col-12">
                        <h4> <label for="yourName" class="badge border-success border-1 text-info">Choix de produit</label></h4>
                      <div class="input-group has-validation">
                       <select name="choix" class="form-select" required id="Produit" >
                       <option value="">choisir Produit</option>
                       <option  value="1">Huile</option>
                       <option value="2">Batterie</option>
                       <option value="3">Pneu</option>

              </select> 
                           </div>
                        <br></br>
                    <div class="col-6">
                      <button class="btn  rounded-pill btn-dark " type="submit"><h4> <label for="yourName" class="badge  text-info">Enregistrer</label></h4>
</button>
                    </div>
                               </form>


                </div>
              </div>

            
          </div>
</body>
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
