<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="models.Locacao"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%


    String quadraId = request.getParameter("quadraId");
    String dataReserva = request.getParameter("dataReserva");
    String horarioEntrada = request.getParameter("horarioEntrada");
    String horarioSaida = request.getParameter("horarioSaida");
    int clienteId = (int) request.getSession().getAttribute("idUsuario");
    
    SimpleDateFormat formato = new SimpleDateFormat("HH:mm");

    Date entrada = formato.parse(horarioEntrada);
    Date saida = formato.parse(horarioSaida);
    
    long diferencaEmMillis = saida.getTime() - entrada.getTime();
    int qtde_horas = (int) (diferencaEmMillis / (60 * 60 * 1000));
    
   

    // Realize as operações necessárias para salvar a reserva
    // Certifique-se de ajustar os métodos da classe Locacao conforme necessári
    
    // Crie uma instância de Locacao
    Locacao locacao = new Locacao();

    // Preencha os dados da reserva
    locacao.setQuadra_id(Integer.parseInt(quadraId));
    locacao.setLocacao_data(dataReserva);
    locacao.setHorario_entrada(horarioEntrada);
    locacao.setHorario_saida(horarioSaida);
    locacao.setCliente(clienteId);
    locacao.setQtde_horas(qtde_horas);
    

    // Adicione mais informações se necessário
    // ...

    // Salve a reserva
    locacao.save();

    // Redirecione o usuário para a página de detalhes da quadra
    // response.sendRedirect("details.jsp?id=" + quadraId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes da Reserva</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="navbar.jsp" %>
<%@ include file="header.jsp" %>
<div class="container mt-5">
    <h2>Detalhes da reserva</h2>
    <p>Quadra ID: <%= quadraId %></p>
    <p>Data da Reserva: <%= dataReserva %></p>
    <p>Horário de Entrada: <%= horarioEntrada %></p>
    <p>Horário de Saída: <%= horarioSaida %></p>

    <!-- Adicione os botões de cancelar e concluir reserva -->
    <a href="#" id="btnExcluir" class="btn btn-danger" data-toggle="modal" data-target="#confirmacaoExclusao">
        Excluir Reserva <i class="fas fa-times"></i>
    </a>
</div>

<!-- Adicione um modal de confirmação de exclusão -->
<div class="modal" id="confirmacaoExclusao">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Confirmação de Exclusão</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
                Tem certeza de que deseja excluir esta reserva?
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-danger" id="btnConfirmarExclusao">Excluir</button>
            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="erroModal" tabindex="-1" role="dialog" aria-labelledby="erroModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="erroModalLabel">Erro</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Ocorreu um erro. Por favor, tente novamente mais tarde.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        // Manipulador de clique no botão "Excluir"
        $("#btnConfirmarExclusao").click(function () {
            // Obtém o locacao_id da sua página JSP (substitua pelo valor correto)
            var locacao_id = <%= locacao.getLocacao_id() %>;

            // Chama o servlet para excluir a locação
            $.ajax({
                type: "POST",
                url: "locacao",
                data: {
                    action: "delete",
                    locacao_id: locacao_id
                },
                success: function (data) {
                    window.location.href = "content.jsp";
                },
                error: function (error) {
                    exibirErroModal();
                }
            });
        });

        function exibirErroModal() {
            $("#erroModal").modal("show");
        }
    });
</script>
<%@ include file="bottom.jsp" %>
</body>
</html>