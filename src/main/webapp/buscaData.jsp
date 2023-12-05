<%@ page import="java.util.List" %>
<%@ page import="models.Quadra" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quadras Disponíveis por Data</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
  	<script src="js/jquery.min.js"></script>
  	<script src="js/bootstrap.bundle.min.js"></script>
    <!-- Inclua os links do Bootstrap 4 aqui -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script>
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

        $(document).ready(function () {
            $("#testQuadra").click(function () {
                var url = "quadra";
                var dataForm = $("#frmQuadra").serialize();

                $.get(url, dataForm, function (data, status) {
                    if (data.length > 0) {
                        var quadras = JSON.parse(data);
                        var quadrasHtml = "<h2>Quadras Disponíveis</h2><div class='row'>";

                        for (var i = 0; i < quadras.length; i++) {
                            quadrasHtml += criarQuadraCard(quadras[i]).html();
                        }

                        quadrasHtml += "</div>";
                        $("#quadrasList").html(quadrasHtml);
                    } else {
                        $("#quadrasList").html("<p class='alert alert-info'>Nenhuma quadra disponível para as datas selecionadas.</p>");
                    }
                }, "json");
            });
        });
    </script>
</head>
<%@ include file="navbar.jsp" %>
<%@ include file="header.jsp" %>
<body class="container mt-5">
    <h1>Buscar Quadras Disponíveis por Data</h1>
    <form id="frmQuadra">
        <div class="form-group">
            <input type="hidden" name="action" value="data">
        </div>
        <div class="form-group">
            <label for="data_inicio">Data Início:</label>
            <input type="date" class="form-control" name="data_inicio" required>
        </div>
        <div class="form-group">
            <label for="data_fim">Data Fim:</label>
            <input type="date" class="form-control" name="data_fim" required>
        </div>
        <button type="button" id="testQuadra" class="btn btn-primary">Buscar</button>
    </form>

    <div id="quadrasList" class="mt-4"></div>
    
<%@ include file="bottom.jsp" %>
</body>
</html>