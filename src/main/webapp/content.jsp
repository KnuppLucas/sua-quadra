<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	<section class="py-5">
	    <div class="container px-4 px-lg-5 mt-5" id="quadrasContainer">
	        <!-- O conteúdo das quadras será inserido aqui dinamicamente -->
	    </div>
	</section>
	
	<script>
	    // Função para carregar dinamicamente as quadras na página
	    function carregarQuadras() {
	        $.ajax({
	            type: "GET",
	            url: "quadra?action=all",
	            success: function (data) {
	                exibirQuadras(data);
	            },
	            error: function (error) {
	                console.error(error);
	            }
	        });
	    }
	
	    // Função para exibir as quadras na página
	    function exibirQuadras(quadras) {
	        var quadrasContainer = $("#quadrasContainer");
	
	        // Limpar conteúdo existente
	        quadrasContainer.empty();
	
	        // Iterar sobre as quadras e criar elementos HTML correspondentes
	        $.each(quadras, function (index, quadra) {
	            var quadraCard = criarQuadraCard(quadra);
	            quadrasContainer.append(quadraCard);
	        });
	    }
	
	    // Função para criar um card HTML para uma quadra
	    function criarQuadraCard(quadra) {
	        var card = $("<div class='col mb-5'></div>");
	        card.append("<div class='card h-100'>");
	        card.find(".card").append("<img class='card-img-top img-fluid' src='" + quadra.foto + "' alt='...' />");
	        card.find(".card").append("<div class='card-body p-4'>");
	        card.find(".card-body").append("<div class='text-center'>");
	        card.find(".text-center").append("<h5 class='fw-bolder'>" + quadra.titulo + "</h5>");
	        card.find(".text-center").append("<span class='text-muted'>" + quadra.descricao + "</span>");
	        card.find(".card").append("<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>");
	        card.find(".card-footer").append("<div class='text-center'><a class='btn btn-outline-dark mt-auto' href='pagina_quadra.jsp?id=" + quadra.id + "'>Ver detalhes</a></div>");
	
	        return card;
	    }
	
	    // Carregar quadras quando a página estiver pronta
	    $(document).ready(function () {
	        carregarQuadras();
	    });
	</script>
<%@ include file="bottom.jsp" %>
</body>
</html>