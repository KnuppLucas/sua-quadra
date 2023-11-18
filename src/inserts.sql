-- Inserir dados na tabela nivelusuarios
INSERT INTO nivelusuarios(nivel) VALUES ('Funcionario');
INSERT INTO nivelusuarios(nivel) VALUES ('Gerente');

-- Inserir dados na tabela usuarios
INSERT INTO usuarios(email, senha, idNivelUsuario, nome, cpf, endereco, bairro, cidade, uf, cep, telefone, foto, ativo) 
VALUES ('funcionario@exemplo.com', 'senha123', 1, 'Funcionario Exemplo', '123.456.789-01', 'Rua Exemplo, 123', 'Bairro Exemplo', 'Cidade Exemplo', 'UF', '12345-678', '123456789', 'foto.jpg', 'S');

INSERT INTO usuarios(email, senha, idNivelUsuario, nome, cpf, endereco, bairro, cidade, uf, cep, telefone, foto, ativo) 
VALUES ('gerente@exemplo.com', 'senha456', 2, 'Gerente Exemplo', '987.654.321-09', 'Rua Exemplo, 456', 'Bairro Exemplo', 'Cidade Exemplo', 'UF', '98765-432', '987654321', 'foto.jpg', 'S');

-- Inserir dados na tabela quadra
INSERT INTO quadra(quadra_id, titulo, descricao, foto, tipo, cep, preco, endereco, municipio, uf)
VALUES (0 ,'Quadra 1', 'Quadra de Futebol Society', 'foto_quadra1.jpg', 'Society', '12345678', 50.00, 'Rua da Quadra, 1', 'Cidade Exemplo', 'UF');

INSERT INTO quadra(quadra_id ,titulo, descricao, foto, tipo, cep, preco, endereco, municipio, uf)
VALUES (0, 'Quadra 2', 'Quadra de Tênis', 'foto_quadra2.jpg', 'Tênis', '87654321', 30.00, 'Rua da Quadra, 2', 'Cidade Exemplo', 'UF');

-- Inserir dados na tabela locacao
INSERT INTO locacao(quadra_id, locacao_data, horario_entrada, horario_saida, qtde_horas, cliente)
VALUES (1, '2023-11-18', '08:00', '10:00', 2, 1);

INSERT INTO locacao(quadra_id, locacao_data, horario_entrada, horario_saida, qtde_horas, cliente)
VALUES (2, '2023-11-18', '14:00', '16:00', 2, 2);

-- Inserir dados na tabela avaliacao
INSERT INTO avaliacao(locacao_id, pontuacao, comentario)
VALUES (1, 5, 'Ótima quadra, recomendo!');

INSERT INTO avaliacao(locacao_id, pontuacao, comentario)
VALUES (2, 4, 'Boa quadra, mas pode melhorar.'); 