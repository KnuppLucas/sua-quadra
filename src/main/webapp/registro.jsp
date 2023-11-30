<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <!-- Adicione os links para os estilos CSS necessários -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#pwd2").blur(function(){
                var senha1 = document.querySelector("#pwd").value;
                var senha2 = document.querySelector("#pwd2").value;

                if(senha1 !== senha2){
                    alert("Senhas diferentes");
                }
            });

            function toggleAddressFields() {
                var cepValue = $('#cep').val();
                if (cepValue === '') {
                    $('.address-fields').hide();
                } else {
                    $('.address-fields').show();
                }
            }

            $('.address-fields').hide();

            $('#cep').on('input', function() {
                toggleAddressFields();
            });

            $("#cep").blur( function(){
                var url = "https://viacep.com.br/ws/"+$("#cep").val() +"/json/";
                $.get( url, function(response){
                    $("#logradouro").val(response.logradouro);
                    $("#complemento").val(response.complemento);
                    $("#bairro").val(response.bairro);
                    $("#cidade").val(response.localidade);
                    $("#uf").val(response.uf);
                    $("#ibge").val(response.ibge);
                    $("#gia").val(response.gia);
                    $("#ddd").val(response.ddd);
                    $("#siafi").val(response.siafi);
                }, "json");
            });

        });

    </script>
</head>
<body>
<%@ include file="navbar.jsp" %>
<%@ include file="header.jsp" %>
<div class="container mt-5">
    <h1>Registro</h1>

    <form id="frmLogin">

        <div class="mb-3 mt-3">
            <label for="nome">Nome: </label>
            <input type="text" class="form-control" id="nome" placeholder="Nome" name="nome" required>
        </div>

        <div class="mb-3 mt-3">
            <label for="cpf" class="form-label">CPF:</label>
            <input type="text" class="form-control" id="cpf" placeholder="CPF" name="cpf" required>
        </div>

        <div class="mb-3 mt-3">
            <label for="cep" class="form-label">CEP:</label>
            <input type="text" class="form-control" id="cep" placeholder="CEP" name="cep" required>
        </div>

        <div class="mb-3 mt-3">
            <label for="logradouro" class="form-label address-fields">Endereço: </label>
            <input type="text" class="form-control address-fields" id="logradouro" placeholder="Endereço" name="logradouro" required>
        </div>

        <div class="mb-3 mt-3">
            <label for="complemento" class="form-label address-fields">Complemento: </label>
            <input type="text" class="form-control address-fields" id="complemento" placeholder="Complemento" name="complemento" required>
        </div>

        <div class="mb-3 mt-3">
            <label for="bairro" class="form-label address-fields">Bairro:</label>
            <input type="text" class="form-control address-fields" id="bairro" placeholder="Bairro" name="bairro" required>
        </div>

        <div class="mb-3 mt-3">
            <label for="cidade" class="form-label address-fields">Município:</label>
            <input type="text" class="form-control address-fields" id="cidade" placeholder="Município" name="cidade" required>
        </div>

        <div class="mb-3 mt-3">
            <label for="uf" class="form-label address-fields">UF:</label>
            <input type="text" class="form-control address-fields" id="uf" placeholder="UF" name="uf" required>
        </div>

        <div class="mb-3 mt-3">
            <label for="email">Email:</label>
            <input type="text" class="form-control" id="email" placeholder="Email" name="email" required>
        </div>

        <div class="mb-3">
            <label for="pwd">Senha:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Senha" name="pswd" required>
        </div>

        <div class="mb-3">
            <label for="pwd2">Confirmar Senha:</label>
            <input type="password" class="form-control" id="pwd2" placeholder="Confirmar Senha" name="pswd2" required>
        </div>

        <input type="hidden" name="action" value="save">
        <button type="button" id="btnFrmLogin" class="btn btn-primary">Enviar</button>
    </form>

    <div id="msgRequest"></div>
    <div id="msgResponse"></div>
</div>

<script>
function registrar() {
    var email = $("#email").val();
    var pswd = $("#pswd").val();
    var nome = $("#nome").val();

    $.ajax({
        type: "POST",
        url: "usuario",
        data: {
            action: "save",
            email: email,
            pswd: pswd,
            nome: nome
        },
        success: function (data) {
            // Lógica de redirecionamento ou manipulação de sucesso
            console.log(data);

            // Obtenha o ID do cliente após o cadastro e armazene na sessão
            var clienteId = // Lógica para obter o ID do cliente após o cadastro
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

<script type="text/javascript">
    $(document).ready(function(){
        $("#btnFrmLogin").click( function(){
            var url = "usuario";
            var dataForm = $("#frmLogin").serialize();
            //$("#msgRequest").html("HTTP REQUEST: "+dataForm);
            $.post( url, dataForm, function(data, status) {
                //$("#msgResponse").html("HTTP RESPONSE:" + JSON.stringify( data ));
                if(data.idUsuario == '0'){
                    alert(data.idUsuario);
                    alert("E-mail ou CPF já cadastrado");
                } else {
                    alert("Cadastrado com sucesso!");
                }
            }, "json");

        });
    });
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
