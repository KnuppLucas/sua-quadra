<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Sua Quadra</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
          	<link href="css/bootstrap.min.css" rel="stylesheet">
  	<script src="js/jquery.min.js"></script>
  	<script src="js/bootstrap.bundle.min.js"></script>
    </head>
<body>
<%@ include file="navbar.jsp" %>
<%@ include file="header.jsp" %>
    <!-- Content -->
    <div class="container mt-5">
        <h2>Detalhes da reserva</h2>

        <p id="productName"></p>


    </div>

    <!-- Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS -->
    <script src="js/scripts.js"></script>

    <script>
        // Wait for the DOM to be ready
	    document.addEventListener("DOMContentLoaded", function () {
	        var urlParams = new URLSearchParams(window.location.search);
	        var productName = urlParams.get('product');
	
	        document.getElementById('productName').innerText = 'Product Name: ' + productName;
	    });
    </script>

<%@ include file="bottom.jsp" %>
</body>
</html>