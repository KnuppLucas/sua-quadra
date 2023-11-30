<%@ page import="java.util.List" %>
<%@ page import="models.Quadra" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</head>
<body class="container mt-5">
<%@ include file="navbar.jsp" %>
<%@ include file="header.jsp" %>
    <!-- Seção existente para buscar quadras por data -->
    <!-- ... -->

    <h2>Quadras por Tipo</h2>
    <div id="quadrasList" class="mt-4"></div>

    <script>
        function criarQuadraCard(quadra) {
            var card = $("<div class='col mb-5'></div>");
            card.append("<div class='card h-100'>");
            card.find(".card").append("<img class='card-img-top' src='" + quadra.foto + "' alt='...' />");
            card.find(".card").append("<div class='card-body p-4'>");
            card.find(".card-body").append("<div class='text-center'>");
            card.find(".text-center").append("<h5 class='fw-bolder'>" + quadra.titulo + "</h5>");
            card.find(".text-center").append("<span class='text-muted'>" + quadra.descricao + "</span>");
            card.find(".card").append("<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>");
            card.find(".card-footer").append("<div class='text-center'><a class='btn btn-outline-dark mt-auto' href='pagina_quadra.jsp?id=" + quadra.quadra_id + "'>Ver detalhes</a></div>");

            return card;
        }

        function buscarQuadrasPorTipo(tipo) {
            var url = "quadra?action=tipo&type=" + tipo;

            $.get(url, function (data, status) {
                if (status === "success") {
                    if (data.length > 0) {
                        var quadras = JSON.parse(data);
                        var quadrasHtml = "<div class='row'>";

                        for (var i = 0; i < quadras.length; i++) {
                            quadrasHtml += criarQuadraCard(quadras[i]).html();
                        }

                        quadrasHtml += "</div>";
                        $("#quadrasList").html(quadrasHtml);
                    } else {
                        $("#quadrasList").html("<p class='alert alert-info'>Nenhuma quadra disponível para o tipo selecionado.</p>");
                    }
                } else {
                    $("#quadrasList").html("<p class='alert alert-danger'>Erro ao buscar quadras. Por favor, tente novamente mais tarde.</p>");
                }
            }).always(function() {
                // Remover o indicador de carregamento, por exemplo, ocultar uma div com uma mensagem de carregamento
                // $("#loadingIndicator").hide(); // Se não tiver um elemento com id "loadingIndicator", pode remover ou ajustar conforme necessário
            });

        }

        // Verificar se há um parâmetro 'type' na URL
        var tipoSelecionado = new URLSearchParams(window.location.search).get("type");
        if (tipoSelecionado) {
            // Se houver um tipo selecionado, buscar quadras por esse tipo
            buscarQuadrasPorTipo(tipoSelecionado);
        } else {
            // Se não houver um tipo selecionado, exibir uma mensagem indicando isso
            $("#quadrasList").html("<p class='alert alert-warning'>Nenhum tipo de quadra selecionado.</p>");
        }
    </script>
<%@ include file="bottom.jsp" %>
</body>
</html>