<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Adicione os links para os estilos CSS necessários -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="navbar.jsp" %>
<%@ include file="header.jsp" %>
<div class="container mt-5">
    <h1>Login</h1>
    
    <form id="loginForm">
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="pswd" class="form-label">Senha</label>
            <input type="password" class="form-control" id="pswd" name="pswd" required>
        </div>
        <button type="button" class="btn btn-primary" onclick="login()">Entrar</button>
    </form>

</div>

<script>
function login() {
    var email = $("#email").val();
    var pswd = $("#pswd").val();

    $.ajax({
        type: "POST",
        url: "usuario",
        data: {
            action: "login",
            email: email,
            pswd: pswd
        },
        success: function (data) {
            // Lógica de redirecionamento ou manipulação de sucesso
            console.log(data);

            // Obtenha o ID do cliente após o login e armazene na sessão
            var clienteId = // Lógica para obter o ID do cliente após o login
            sessionStorage.setItem("clienteId", clienteId);

            window.location.href = "content.jsp";
        },
        error: function (error) {
            // Lógica de manipulação de erro
            console.error(error);
            exibirErroModal();
        }
    });
}
</script>

<!-- Modal de Erro -->
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
                Ocorreu um erro. Por favor, verifique seus campos.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp" %>
</body>
</html>