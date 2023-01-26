<%-- 
    Document   : index
    Created on : 12 janv. 2023, 09:09:01
    Author     : KTM
--%>
<% String Nom=null;
String Prenom=null;
String Date_de_naissance=null;
String Genre=null;
%>
<% if(request.getSession().getAttribute("Nom")!=null){ 
    Nom =  request.getSession().getAttribute("Nom").toString();
  


} ;%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!DOCTYPE html>
<html lang="en">

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
                 
                  <span class="badge border-success text-info">Insertion Employer</span>
                </a>
              </div><!--    <img src="assets/img/pngegg (3).png" width="40" height="40" alt="">-->

              <div class="card mb-3">
                    <form action="InsertionEmploye" method="post" class="row g-3 needs-validation" novalidate>
                    <div class="col-12">
                       
                        <h4> <label for="yourName" class="badge border-success border-1 text-info">Nom</label></h4>
                        <input type="text" name="nom" class="form-control" required id="Nom"<% if(Nom!=null) {  %>value=<%out.println(Nom); }%>></input>
                      <div class="invalid-feedback">Entrer un nom!</div>
                    </div>

                    <div class="col-12">
                        <h4> <label for="yourName" class="badge border-success border-1 text-info">Prenom</label></h4>
                      <input type="text" name="prenom" class="form-control" required id="Prenom" >
                      <div class="invalid-feedback">Entrer un prenom </div>
                    </div>

                    <div class="col-12">
                        <h4> <label for="yourName" class="badge border-success border-1 text-info">Genre</label></h4>
                      <div class="input-group has-validation">
                       <select name="id_genre" class="form-select" required id="Genre" >
                       <option value="">Genre</option>
                       <option value="1">Masculin</option>
                       <option value="2">Feminin</option>

              </select>
                        <div class="invalid-feedback">Entrer un genre</div>
                      </div>
                    </div>

                    <div class="col-12">
                        <h4> <label for="yourName" class="badge border-success border-1 text-info">Date_de_naissance</label></h4>
                      <input type="date" name="date_naissance" class="form-control" id="Date_de_naissance" required>
                      <div class="invalid-feedback">Entrer une Date_de_naissance!</div>
                    </div>
            </div>                
                    </div>
                    <div class="col-6">
                      <button class="btn  rounded-pill btn-dark w-100" type="submit"><h4> <label for="yourName" class="badge  text-info">Enregistrer</label></h4>
</button>
                    </div>
                               </form>
                      <a href="Choix.jsp">Vers page choisir produit</a>
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





<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		
            <form action="InsertionEmploye" method="Post">
                <input type="text" name="nom">
                <input type="text" name="prenom">
                <input type="date" name="date_naissance">
                <select name="id_genre">
                    <option value="1">Masculin</option>
                    <option value="2">Feminin</option>
                </select>
                <input type="submit" value="enregistrer">
            </form>
	</body>
</html>

