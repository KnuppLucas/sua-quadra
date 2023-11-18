CREATE DATABASE suaquadra;

USE suaquadra;

CREATE TABLE nivelusuarios(
  idNivelUsuario int(11) NOT NULL AUTO_INCREMENT,
  nivel varchar(20) DEFAULT NULL,
  PRIMARY KEY (idNivelUsuario)
);

INSERT INTO nivelusuarios(nivel) VALUE('Funcionario');
INSERT INTO nivelusuarios(nivel) VALUE('Gerente');

CREATE TABLE usuarios(
  idUsuario int(11) NOT NULL AUTO_INCREMENT,
  email varchar(100) DEFAULT NULL,
  senha varchar(64) NOT NULL,
  idNivelUsuario int(11) DEFAULT 1,
  nome varchar(50) DEFAULT NULL,
  cpf varchar(14) DEFAULT NULL,
  endereco varchar(50) DEFAULT NULL,
  bairro varchar(30) DEFAULT NULL,
  cidade varchar(50) DEFAULT NULL,
  uf varchar(2) DEFAULT NULL,
  cep varchar(9) DEFAULT NULL,
  telefone varchar(15) DEFAULT NULL,
  foto varchar(255) DEFAULT NULL,
  ativo varchar(1) DEFAULT 'N',
  PRIMARY KEY (idUsuario),
  UNIQUE KEY email (email),
  UNIQUE KEY cpf (cpf),
  KEY idNivelUsuario (idNivelUsuario),
  CONSTRAINT usuarios_ibfk_1 FOREIGN KEY (idNivelUsuario) REFERENCES nivelusuarios (idNivelUsuario)
);

CREATE TABLE quadra(
    quadra_id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    titulo    VARCHAR(20),
    descricao VARCHAR(200),
    foto 	  VARCHAR(200),
    tipo      VARCHAR(200),
    cep       CHAR(8) NOT NULL,
    preco     REAL,
    endereco  VARCHAR(255),
    bairro    VARCHAR(100),
    municipio VARCHAR(50),
    uf	      CHAR(2)
);


CREATE TABLE locacao(
  locacao_id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  quadra_id INTEGER,
  locacao_data date,
  horario_entrada varchar(10),
  horario_saida varchar(10),
  qtde_horas integer,
  cliente integer,
  
  foreign key(quadra_id) references quadra(quadra_id),
  foreign key(cliente) references usuarios(idUsuario)
);


CREATE TABLE avaliacao(
  avaliacao_id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  locacao_id   INTEGER,
  pontuacao    INTEGER,
  comentario    TEXT,
  foreign key(locacao_id) references locacao(locacao_id)
);

