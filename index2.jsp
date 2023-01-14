<%-- 
    Document   : index
    Created on : 12 janv. 2023, 09:09:01
    Author     : KTM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!DOCTYPE html>

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

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-left justify-content-center py-0">
          <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-0 col-md-0  flex-column align-items-left justify-content-left">

              <div class="d-flex  py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                 
                </a>
              </div><!--    <img src="assets/img/pngegg (3).png" width="40" height="40" alt="">-->

              <div class="card mb-3">


                 

                  <form action="index.jsp" method="post" class="row g-3 needs-validation" novalidate>                  
                    <div class="col-12">
                        <h3> <label for="yourName" class="badge border-success border-1 text-info">Niveau_d'Etude</label></h3>
                       
                       <label>
                           <h3>   <input class="form-check-input" name="Niveau_d'Etude" type="checkbox" value="" id="acceptTerms" required>
                       <label class="form-check-label">L1</label>
                      
                        <input class="form-check-input" name="Niveau_d'Etude" type="checkbox" value="" id="acceptTerms" required>
                         <label class="form-check-label" >L2</label>
                   
                         <input class="form-check-input" name="Niveau_d'Etude" type="checkbox" value="" id="acceptTerms" required>
                         <label class="form-check-label"> L3 </label>
                        
                           <input class="form-check-input" name="Niveau_d'Etude" type="checkbox" value="" id="acceptTerms" required>
                        <label class="form-check-label" >M1 </label>
                        
                          <input class="form-check-input" name="Niveau_d'Etude" type="checkbox" value="" id="acceptTerms" required>
                         <label class="form-check-label" >M2 </label></h3>
                        
                        
                       </label>
                       
                         </div>
                        <div class="col-12">
                        <h3> <label for="yourName" class="badge border-success border-1 text-info">Specialiter</label></h3>
                      <input type="text" name="Specialiter" class="form-control" id="Specialiter" required>
                      <div class="invalid-feedback">Entrer une Specialiter</div>
                    </div>
                   <button type="button" class="btn  rounded-pill btn-dark w-100" data-bs-toggle="modal" data-bs-target="#basicModal">
        
                                      <h4> <label for="yourName" class="badge border-success border-1 text-info">Specialiter rechercher</label></h4>

              </button>
              <div class="modal fade" id="basicModal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h3 class="modal-title">Specialiter rechercher</h3>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                       
                         <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">Specialiter</th>
                 
                  </tr>
                </thead>
                <tbody>
                <% for (int i=0; i < 4; i++) { %>
                   <tr>
                       <th scope="row"> # </th>
                    <td>???</td>
                  </tr>
                    <% } %>
                 
                </tbody>
              </table>

                        
                        
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div>

            </div>
                       
                    
                    </div>
                    <div class="col-6">
                      <button class="btn  rounded-pill btn-dark w-100" type="submit"><h4> <label for="yourName" class="badge  text-info">Enregistrer</label></h4>
</button>
                    </div>
                   

                </div>
              </div>

            
          </div>

        

    
  </main>

  <a href="#" class="back-to-top d-flex  justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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

</body>


</html>
