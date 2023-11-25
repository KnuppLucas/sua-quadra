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

  <h1>Testando post para inserir locacao</h1>
  <form id="frmSaveLocacao">
    <input type="hidden" name="action" value="save">
    quadra_id<input type="number" name="quadra_id">
    locacao_data<input type="text" name="locacao_data">
    horario_entrada<input type="text" name="horario_entrada">
    horario_saida<input type="text" name="horario_saida">
    qtde_horas<input type="number" name="qtde_horas">
   	cliente<input type="number" name="cliente">    
    <button type="button" id="testSaveLocacao" class="btn btn-primary">Enviar</button>
  </form>
  
  <div id="msgRequest">
  </div>
  <div id="msgResponse">
  </div>
  
    
  <h1>Testando post para exluir locacao</h1>
  <form id="frmDelLocacao">
    <input type="hidden" name="action" value="delete">
   	locacao_id<input type="text" name="locacao_id">
    <button type="button" id="testDelLocacao" class="btn btn-primary">Enviar</button>
  </form>
  
  <div id="msgRequest2">
  </div>
  <div id="msgResponse2">
  </div>
  


<script type="text/javascript">

$(document).ready(function(){
	$("#testSaveLocacao").click( function(){
		var url = "locacao";
		var dataForm = $("#frmSaveLocacao").serialize();
		alert("status "+status);
		//$("#msgRequest").html("HTTP REQUEST: "+dataForm);
		
		$.post( url, dataForm, function(data, status) {
			alert("status "+status);
			$("#msgResponse").html("HTTP RESPONSE:" + JSON.stringify( data ));
		}, "json");
		
	});
	
	$("#testDelLocacao").click( function(){
		var url = "locacao";
		var dataForm = $("#frmDelLocacao").serialize();
		alert("status "+status);
		//$("#msgRequest").html("HTTP REQUEST: "+dataForm);
		
		$.post( url, dataForm, function(data, status) {
			alert("status "+status);
			$("#msgResponse").html("HTTP RESPONSE:" + JSON.stringify( data ));
		}, "json");
		
	});
});


</script>

</body>
</html>