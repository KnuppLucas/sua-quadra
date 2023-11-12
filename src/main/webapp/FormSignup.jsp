<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Projeto Quadra - Cadastro</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
	<div class="container mt-3">
		<h2>Cadastrar Usuario</h2>
		<form id="frmLogin">
		
			<div class="mb-3 mt-3">
		    	<label for="nome">Nome: </label>
		      	<input type="text" class="form-control" id="nome" placeholder="Nome" name="nome">
		    </div>
		    
		    		    
		    <div class="mb-3 mt-3">
				    <label for="cep" class="form-label">cpf:</label>
				    <input type="text" class="form-control" id="cpf" placeholder="cpf" name="cpf">
			</div>
				
		    
		    <div class="mb-3 mt-3">
				    <label for="cep" class="form-label">CEP:</label>
				    <input type="text" class="form-control" id="cep" placeholder="cep" name="cep">
			</div>
				
			<div class="mb-3 mt-3">
				    <label for="logradouro" class="form-label address-fields">Endereço: </label>
				    <input type="text" class="form-control address-fields" id="logradouro" placeholder="logradouro" name="logradouro">
			</div>
				
			<div class="mb-3 mt-3">
				    <label for="complemento" class="form-label address-fields">Complemento: </label>
				    <input type="text" class="form-control address-fields" id="complemento" placeholder="complemento" name="complemento">
			</div>
				
			<div class="mb-3 mt-3">
				    <label for="bairro" class="form-label address-fields">Bairro:</label>
				    <input type="text" class="form-control address-fields" id="bairro" placeholder="bairro" name="bairro">
			</div>
				
			<div class="mb-3 mt-3">
				    <label for="localidade" class="form-label address-fields">Municipio:</label>
				    <input type="text" class="form-control address-fields" id="cidade" placeholder="localidade" name="cidade">
			</div>
				
			<div class="mb-3 mt-3">
				    <label for="uf" class="form-label address-fields">uf:</label>
				    <input type="text" class="form-control address-fields" id="uf" placeholder=" uf" name="uf">
			</div>
		
			<div class="mb-3 mt-3">
		    	<label for="email">Email:</label>
		      	<input type="text" class="form-control" id="email" placeholder="Email" name="email">
		    </div>
		    
		    <div class="mb-3">
		      <label for="pwd">Senha:</label>
		      <input type="password" class="form-control" id="pwd" placeholder="Senha" name="pswd">
		    </div>
		    
		    <div class="mb-3">
		      <label for="pwd">Confirmar Senha:</label>
		      <input type="password" class="form-control" id="pwd2" placeholder="Confirmar Senha" name="pswd2">
		    </div>
		    <input type="hidden" name="action" value="save">
    		<button type="button" id="btnFrmLogin" class="btn btn-primary">Enviar</button>
		</form>
		<div id="msgRequest">
  		</div>
  		<div id="msgResponse">
  		</div>
	</div>
	<script type="text/javascript">

	$(document).ready(function(){
		$("#btnFrmLogin").click( function(){
			var url = "usuario";
			var dataForm = $("#frmLogin").serialize();
			$("#msgRequest").html("HTTP REQUEST: "+dataForm);
			$.post( url, dataForm, function(data, status) {
		    $("#msgResponse").html("HTTP RESPONSE:" + JSON.stringify( data ));
		    if(data.idUsuario == '0'){
		    	alert(data.idUsuario);
		    	alert("E-mail ou cpf já cadastrado");
		    }else{
		    	alert("Cadastrado com sucesso!");
		    }
			}, "json");
			
		});
	});
</script>
</body>
</html>