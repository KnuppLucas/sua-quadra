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

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra A', 'Quadra de Futebol de Salão', 'foto_quadraA.jpg', 'Futebol de Salão', '01234567', 40.00, 'Rua das Esportes, 123', 'Centro', 'São Paulo', 'SP');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra A', 'Quadra de Futebol de Salão', 'foto_quadraA.jpg', 'Futebol de Salão', '01234568', 40.00, 'Rua das Esportes, 123', 'Itaquera', 'São Paulo', 'SP');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra A', 'Quadra de Futebol de Salão', 'foto_quadraA.jpg', 'Futebol de Salão', '01234569', 40.00, 'Rua das Esportes, 123', 'Tatuape', 'São Paulo', 'SP');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra I', 'Quadra de Tênis Externa', 'foto_quadraI.jpg', 'Tênis', '12345678', 40.00, 'Rua do Tênis, 456', 'Jardim das Raquetes', 'Osasco', 'SP');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra J', 'Quadra de Basquete Coberta', 'foto_quadraJ.jpg', 'Basquete', '87654321', 30.00, 'Avenida Coberta, 789', 'Bairro dos Arremessos', 'Santo André', 'SP');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra K', 'Quadra de Futebol Gramado', 'foto_quadraK.jpg', 'Futebol', '54321098', 45.00, 'Rua Gramada, 101', 'Vila Rio de Janeiro', 'Guarulhos', 'SP');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra L', 'Quadra de Vôlei de Praia Noturna', 'foto_quadraL.jpg', 'Vôlei de Praia', '98765432', 35.00, 'Avenida Noturna, 202', 'Praia Iluminada', 'Mauá', 'SP');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra B', 'Quadra de Vôlei de Praia', 'foto_quadraB.jpg', 'Vôlei de Praia', '87654321', 25.00, 'Avenida da Praia, 456', 'Praia dos Jogadores', 'Rio de Janeiro', 'RJ');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra C', 'Quadra de Basquete', 'foto_quadraC.jpg', 'Basquete', '54321098', 35.00, 'Praça da Bola, 789', 'Bairro dos Arremessos', 'Belo Horizonte', 'MG');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra D', 'Quadra de Tênis de Mesa', 'foto_quadraD.jpg', 'Tênis de Mesa', '98765432', 20.00, 'Alameda do Ping Pong, 101', 'Ping Pong Central', 'Porto Alegre', 'RS');
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