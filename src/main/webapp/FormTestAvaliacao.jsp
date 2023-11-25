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

  <h1>Testando post para inserir avaliacao</h1>
  <form id="frmSaveAvaliacao">
    <input type="hidden" name="action" value="save">
    locacao_id<input type="text" name="locacao_id">
    pontuacao<input type="number" name="pontuacao">
    comentario<input type="text" name="comentario">
    <button type="button" id="testSaveAvaliacao" class="btn btn-primary">Enviar</button>
  </form>
  
  <div id="msgRequest">
  </div>
  <div id="msgResponse">
  </div>
  
    
  <h1>Testando post para exluir avaliacao</h1>
  <form id="frmDelAvaliacao">
    <input type="hidden" name="action" value="delete">
   	avaliacao_id<input type="text" name="avaliacao_id">
    <button type="button" id="testDelAvaliacao" class="btn btn-primary">Enviar</button>
  </form>
  
  <div id="msgRequest2">
  </div>
  <div id="msgResponse2">
  </div>
  


<script type="text/javascript">

$(document).ready(function(){
	$("#testSaveAvaliacao").click( function(){
		var url = "avaliacao";
		var dataForm = $("#frmSaveAvaliacao").serialize();
		alert("status "+status);
		//$("#msgRequest").html("HTTP REQUEST: "+dataForm);
		
		$.post( url, dataForm, function(data, status) {
			alert("status "+status);
			$("#msgResponse").html("HTTP RESPONSE:" + JSON.stringify( data ));
		}, "json");
		
	});
	
	$("#testDelAvaliacao").click( function(){
		var url = "avaliacao";
		var dataForm = $("#frmDelAvaliacao").serialize();
		alert("status "+status);
		//$("#msgRequest").html("HTTP REQUEST: "+dataForm);
		
		$.post( url, dataForm, function(data, status) {
			alert("status "+status);
			$("#msgResponse2").html("HTTP RESPONSE:" + JSON.stringify( data ));
		}, "json");
		
	});
});


</script>

</body>
</html>