<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  	<link href="css/bootstrap.min.css" rel="stylesheet">
  	<script src="js/jquery.min.js"></script>
  	<script src="js/bootstrap.bundle.min.js"></script>

</head>
<body>
  <h1>Testando get todas as quadras</h1>
  <form id="frmLogin">
    <input type="hidden" name="action" value="all">
    <button type="button" id="btnFrmLogin" class="btn btn-primary">Enviar</button>
  </form>
  
  <div id="msgRequest">
  </div>
  <div id="msgResponse">
  </div>
  
	<form id="frmLogin">
    	<input type="hidden" name="action" value="all">
    	<button type="button" id="btnFrmLoginTest" class="btn btn-primary">Enviar</button>
	</form>

  <section id="products" class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="product-container">
            <!-- Os produtos serão dinamicamente adicionados aqui -->
        </div>
    </div>
</section>
  
  <h1>Testando get de quadras disponiveis por data (datas no formato aaaa-mm-dd)</h1>
  <form id="frmQuadra">
    <input type="hidden" name="action" value="data">
    Data Inicio<input type="text" name="data_inicio">
    Data fim<input type="text" name="data_fim">
    <button type="button" id="testQuadra" class="btn btn-primary">Enviar</button>
  </form>
  
  <div id="msgRequest1">
  </div>
  <div id="msgResponse1">
  </div>
  
  <h1>Testando get de quadras por endereco</h1>
  <form id="frmEnd">
    <input type="hidden" name="action" value="endereco">
   	UF<input type="text" name="uf">
    Cidade<input type="text" name="municipio">
    Bairro<input type="text" name="bairro">
    <button type="button" id="testEnd" class="btn btn-primary">Enviar</button>
  </form>
  
  <div id="msgRequest2">
  </div>
  <div id="msgResponse2">
  </div>
  
  <h1>Testando get de quadras disponiveis por endereco e data</h1>
  <form id="frmEndData">
    <input type="hidden" name="action" value="enderecoData">
   	UF<input type="text" name="uf">
    Cidade<input type="text" name="municipio">
    Bairro<input type="text" name="bairro">
    Data Inicio<input type="text" name="data_inicio">
    Data fim<input type="text" name="data_fim">
    <button type="button" id="testEndData" class="btn btn-primary">Enviar</button>
  </form>
  
  <div id="msgRequest3">
  </div>
  <div id="msgResponse3">
  </div>
  
    
  <h1>Testando post para inserir quadra</h1>
  <form id="frmSaveQuadra">
    <input type="hidden" name="action" value="save">
    titulo<input type="text" name="titulo">
    descricao<input type="text" name="descricao">
    foto<input type="text" name="foto">
    tipo<input type="text" name="tipo">
    cep<input type="number" name="cep">
   	preco<input type="number" name="preco">    
   	UF<input type="text" name="uf">
    Cidade<input type="text" name="municipio">
    Bairro<input type="text" name="bairro">
    Endereco<input type="text" name="endereco">
    <button type="button" id="testSaveQuadra" class="btn btn-primary">Enviar</button>
  </form>
  
  <div id="msgRequest4">
  </div>
  <div id="msgResponse4">
  </div>
  
    
  <h1>Testando post para deletar quadra</h1>
  <form id="frmDelQuadra">
    <input type="hidden" name="action" value="delete">
   	Quadra_id<input type="text" name="quadra_id">
    <button type="button" id="testDelQuadra" class="btn btn-primary">Enviar</button>
  </form>
  
  <div id="msgRequest5">
  </div>
  <div id="msgResponse5">
  </div>
  
  
<script type="text/javascript">

	$(document).ready(function(){
		$("#btnFrmLogin").click( function(){
			var url = "quadra";
			var dataForm = $("#frmLogin").serialize();
			alert("status "+status);
			//$("#msgRequest").html("HTTP REQUEST: "+dataForm);
			
			$.get( url, dataForm, function(data, status) {
				alert("status "+status);
				$("#msgResponse").html("HTTP RESPONSE:" + JSON.stringify( data ));
			}, "json");
			
		});
		
		$("#btnFrmLoginTest").click(function(){
	        var url = "quadra";
	        var dataForm = $("#frmLogin").serialize();

	        $.get(url, dataForm, function(data, status) {
	            $("#msgResponse").html("HTTP RESPONSE:" + JSON.stringify(data));

	            // Limpe o container de produtos antes de adicionar novos
	            $("#product-container").empty();

	            // Adicione cada quadra como um card na seção de produtos
	            data.forEach(function(quadra) {
	                var productCard = `
	                    <div class="col mb-5">
	                        <div class="card h-100">
	                            <!-- Product image-->
	                            <img class="card-img-top" src="${quadra.foto}" alt="..." />
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <h5 class="fw-bolder">${quadra.titulo}</h5>
	                                    <!-- Product price-->
	                                    ${quadra.preco}
	                                </div>
	                            </div>
	                            <!-- Product actions-->
	                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                                <div class="text-center">
	                                    <a class="btn btn-outline-dark mt-auto" href="pagina_produto.jsp?id=${quadra.quadra_id}">View options</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                `;
	                $("#product-container").append(productCard);
	            });
	        }, "json");
	    });
    
		
		$("#testQuadra").click( function(){
			var url = "quadra";
			var dataForm = $("#frmQuadra").serialize();
			alert("status "+status);
			//$("#msgRequest").html("HTTP REQUEST: "+dataForm);
			
			$.get( url, dataForm, function(data, status) {
				alert("status "+status);
				$("#msgResponse1").html("HTTP RESPONSE:" + JSON.stringify( data ));
			}, "json");
			
		});
		
		$("#testEnd").click( function(){
			var url = "quadra";
			var dataForm = $("#frmEnd").serialize();
			alert("status "+status);
			//$("#msgRequest").html("HTTP REQUEST: "+dataForm);
			
			$.get( url, dataForm, function(data, status) {
				alert("status "+status);
				$("#msgResponse2").html("HTTP RESPONSE:" + JSON.stringify( data ));
			}, "json");
			
		});
		
		$("#testEndData").click( function(){
			var url = "quadra";
			var dataForm = $("#frmEndData").serialize();
			alert("status "+status);
			//$("#msgRequest").html("HTTP REQUEST: "+dataForm);
			
			$.get( url, dataForm, function(data, status) {
				alert("status "+status);
				$("#msgResponse3").html("HTTP RESPONSE:" + JSON.stringify( data ));
			}, "json");
			
		});
		
		$("#testSaveQuadra").click( function(){
			var url = "quadra";
			var dataForm = $("#frmSaveQuadra").serialize();
			alert("status "+status);
			//$("#msgRequest").html("HTTP REQUEST: "+dataForm);
			
			$.post( url, dataForm, function(data, status) {
				alert("status "+status);
				$("#msgResponse4").html("HTTP RESPONSE:" + JSON.stringify( data ));
			}, "json");
			
		});
		
		$("#testDelQuadra").click( function(){
			var url = "quadra";
			var dataForm = $("#frmDelQuadra").serialize();
			alert("status "+status);
			//$("#msgRequest").html("HTTP REQUEST: "+dataForm);
			
			$.post( url, dataForm, function(data, status) {
				alert("status "+status);
				$("#msgResponse5").html("HTTP RESPONSE:" + JSON.stringify( data ));
			}, "json");
			
		});
	});
</script>

</body>
</html>