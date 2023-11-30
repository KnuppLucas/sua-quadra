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
VALUES (0 ,'Quadra 1', 'Quadra de Futebol Society', 'https://www.saopaulo.sp.gov.br/wp-content/uploads/2020/10/quadra-adolfo.jpg', 'Society', '12345678', 50.00, 'Rua da Quadra, 1', 'Cidade Exemplo', 'UF');

INSERT INTO quadra(quadra_id ,titulo, descricao, foto, tipo, cep, preco, endereco, municipio, uf)
VALUES (0, 'Quadra 2', 'Quadra de Tênis', 'https://www.rioquente.com.br/images/attractions/0011/02.jpg', 'Tênis', '87654321', 30.00, 'Rua da Quadra, 2', 'Cidade Exemplo', 'UF');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra A', 'Quadra de Futebol de Salão', 'data:image/jpeg;base64,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', 'Futebol de Salão', '01234567', 40.00, 'Rua das Esportes, 123', 'Centro', 'São Paulo', 'SP');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra A', 'Quadra de Futebol de Salão', 'https://www.elasta.com.br/wp-content/uploads/2020/11/Quadras-Poliesportivas-1024x526.jpg', 'Futebol de Salão', '01234568', 40.00, 'Rua das Esportes, 123', 'Itaquera', 'São Paulo', 'SP');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra A', 'Quadra de Futebol de Salão', 'https://educacao.sme.prefeitura.sp.gov.br/wp-content/uploads/2022/12/Quadra-EMEI-Manoel-Preto-1-825x470.jpg', 'Futebol de Salão', '01234569', 40.00, 'Rua das Esportes, 123', 'Tatuape', 'São Paulo', 'SP');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra I', 'Quadra de Tênis Externa', 'https://www.rioquente.com.br/images/attractions/0011/01.jpg', 'Tênis', '12345678', 40.00, 'Rua do Tênis, 456', 'Jardim das Raquetes', 'Osasco', 'SP');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra J', 'Quadra de Basquete Coberta', 'https://www.elasta.com.br/wp-content/uploads/2020/11/regras-da-quadra-de-basquete.jpg', 'Basquete', '87654321', 30.00, 'Avenida Coberta, 789', 'Bairro dos Arremessos', 'Santo André', 'SP');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra K', 'Quadra de Futebol Gramado', 'https://itograss.com.br/media/upload/ckeditor/2022/09/28/grama-grand-slam-de-wimbledon_zsckh84.jpg', 'Futebol', '54321098', 45.00, 'Rua Gramada, 101', 'Vila Rio de Janeiro', 'Guarulhos', 'SP');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra L', 'Quadra de Vôlei de Praia Noturna', 'data:image/jpeg;base64,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', 'Vôlei de Praia', '98765432', 35.00, 'Avenida Noturna, 202', 'Praia Iluminada', 'Mauá', 'SP');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra B', 'Quadra de Vôlei de Praia', 'https://blog.drastosa.com.br/wp-content/uploads/2022/08/roupas-para-jogar-vo%CC%82lei-de-praia-1024x683.jpg', 'Vôlei de Praia', '87654321', 25.00, 'Avenida da Praia, 456', 'Praia dos Jogadores', 'Rio de Janeiro', 'RJ');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra C', 'Quadra de Basquete', 'https://images.squarespace-cdn.com/content/5cee719a52ab760001a563d8/1561485181972-PCTLM3MWDZIPDZSTFUWA/56d450bbd5fd513636077becc9f843d50db0ee97a826b.jpg?content-type=image%2Fjpeg', 'Basquete', '54321098', 35.00, 'Praça da Bola, 789', 'Bairro dos Arremessos', 'Belo Horizonte', 'MG');

INSERT INTO quadra(titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf)
VALUES ('Quadra D', 'Quadra de Tênis de Mesa', 'https://www.ateme.com.br/wp-content/uploads/2020/12/sede-ateme-quadra.jpg', 'Tênis de Mesa', '98765432', 20.00, 'Alameda do Ping Pong, 101', 'Ping Pong Central', 'Porto Alegre', 'RS');
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