<%-- 
    Document   : depence
    Created on : 12 janv. 2023, 16:54:33
    Author     : KTM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Insert</title>
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
 <header id="header" class="header fixed-top d-flex align-items-center  bg-dark">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <span class="badge border-success border-1 text-info">Garage</span>
      </a>
    </div
                 <% for (int i=0; i < 5; i++) { %>
     <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <span class="d-none d-lg-block"></span>
      </a>
    </div>
                       <% } %>

        <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
      <span class="badge border-success border-1 text-info">Accueil</span>      </a>
            
   <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <span class="badge border-success border-1 text-info">Employer</span>
      </a>
            
    </div>
    </div>
 </header>
    <body>
         <section class="section register min-vh-100 d-flex flex-column align-items-left justify-content-center py-0">
          <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-0 col-md-0  flex-column align-items-left justify-content-left">

              <div class="d-flex  py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                 
                  <span class="badge border-success text-info">Insertion Employer</span>
                </a>
              </div><!--    <img src="assets/img/pngegg (3).png" width="40" height="40" alt="">-->

              <div class="card mb-3">


                 

                  <form class="row g-3 needs-validation" novalidate>
                    <form action="Action.java" method="post" >
                             <div class="col-12">
                        <h4> <label for="yourName" class="badge border-success border-1 text-info">Caracteristique</label></h4>
                      <div class="input-group has-validation">
                       <select name="Caracteristique" class="form-select" id="Caracteristique" required>
                       <option value=""></option>
                       <option>Salaire</option>
                       <option>Loyer</option>
                       <option>Facture</option>

              </select>
                        <div class="invalid-feedback">Entre un caractere</div>
                      </div>
                    </div>

                    <div class="col-12">
                        <h4> <label for="yourName" class="badge border-success border-1 text-info">Montant</label></h4>
                      <input type="text" name="Montant" class="form-control" id="Montant" required>
                      <div class="invalid-feedback">Entrer un Montant!</div>
                    </div>

                    <div class="col-12">
                        <h4> <label for="yourName" class="badge border-success border-1 text-info">Date</label></h4>
                      <input type="date" name="Date" class="form-control" id="Date" required>
                      <div class="invalid-feedback">Entrer un Date </div>
                    </div>

               
                 


            </div>
                       
                    
                    </div>
                    <div class="col-6">
                      <button class="btn  rounded-pill btn-dark w-100" type="submit"><h4> <label for="yourName" class="badge  text-info">Enregistrer</label></h4>
</button>
                    </div>
                                   </form>


                </div>
              </div>

            
          </div>

    </body>
</html>
