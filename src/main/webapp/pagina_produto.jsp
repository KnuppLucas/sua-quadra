<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes do Produto</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</head>

<body>
<%@ include file="navbar.jsp" %>
<%@ include file="header.jsp" %>

    <div class="container mt-5">
        <h1>Detalhes do Produto</h1>
        
        <% 
            // Obtenha o ID da quadra a partir dos parâmetros da URL
            String quadraId = request.getParameter("id");

            // Conecte-se ao banco de dados e recupere as informações da quadra
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            try {
                // Configure a conexão com o banco de dados (substitua as informações necessárias)
                String url = "jdbc:mysql://localhost:3306/suaquadra?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
                String username = "root";
                String password = "";
                Class.forName("com.mysql.cj.jdbc.Driver"); // Carregue o driver
                connection = DriverManager.getConnection(url, username, password);

                // Crie uma instrução SQL preparada para recuperar as informações da quadra com base no ID
                String sql = "SELECT * FROM quadra WHERE quadra_id = ?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, quadraId);
                resultSet = preparedStatement.executeQuery();

                // Exiba as informações da quadra
                if (resultSet.next()) {
                    String titulo = resultSet.getString("titulo");
                    String descricao = resultSet.getString("descricao");
                    String foto = resultSet.getString("foto");
                    String tipo = resultSet.getString("tipo");
                    int cep = resultSet.getInt("cep");
                    double preco = resultSet.getDouble("preco");
                    String endereco = resultSet.getString("endereco");
                    String municipio = resultSet.getString("municipio");
                    String uf = resultSet.getString("uf");

                    // Exiba as informações na página
        %>

                <div class="card">
                    <img src="<%= foto %>" class="card-img-top img-fluid" alt="Imagem da Quadra">
                    <div class="card-body">
                        <h5 class="card-title"><%= titulo %></h5>
                        <p class="card-text"><%= descricao %></p>
                        <p class="card-text"><strong>Tipo:</strong> <%= tipo %></p>
                        <p class="card-text"><strong>CEP:</strong> <%= cep %></p>
                        <p class="card-text"><strong>Preço:</strong> <%= preco %></p>
                        <p class="card-text"><strong>Endereço:</strong> <%= endereco %></p>
                        <p class="card-text"><strong>Município:</strong> <%= municipio %></p>
                        <p class="card-text"><strong>UF:</strong> <%= uf %></p>
                    </div>
                </div>

                <!-- Adicione o formulário para selecionar a data e horário -->
                <form action="processarReserva.jsp" method="post">
                    <div class="mb-3">
                        <label for="dataReserva" class="form-label">Data da Reserva</label>
                        <input type="date" class="form-control" id="dataReserva" name="dataReserva" required>
                    </div>
                    <div class="mb-3">
                        <label for="horarioEntrada" class="form-label">Horário de Entrada</label>
                        <input type="time" class="form-control" id="horarioEntrada" name="horarioEntrada" required>
                    </div>
                    <div class="mb-3">
                        <label for="horarioSaida" class="form-label">Horário de Saída</label>
                        <input type="time" class="form-control" id="horarioSaida" name="horarioSaida" required>
                    </div>
                    <input type="hidden" name="quadraId" value="<%= quadraId %>">
                    <button type="submit" class="btn btn-primary">Reservar Quadra</button>
                </form>
    <%
            } else {
    %>
                <p>Quadra não encontrada.</p>
    <%
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Feche as conexões e recursos
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</div>
<%@ include file="bottom.jsp" %>

</body>

</html>
