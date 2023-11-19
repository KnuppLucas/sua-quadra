select *
  from suaquadra.quadra;
  
SELECT q.*
FROM quadra q
WHERE 0 = 0
  AND q.quadra_id NOT IN (
    SELECT l.quadra_id
    FROM locacao l
    WHERE l.locacao_data BETWEEN '2023-11-11' AND '2023-11-17'
  OR l.locacao_data IS NULL
);


    SELECT *
    FROM locacao l;
    
    SELECT quadra_id, titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf FROM suaquadra.quadra WHERE quadra.quadra_id NOT IN ( SELECT l.quadra_id FROM locacao l WHERE l.locacao_data BETWEEN '2023-11-11' AND '2023-11-12' OR l.locacao_data IS NULL);
    
    INSERT INTO suaquadra.locacao ( locacao_id, quadra_id, locacao_data, horario_entrada, horario_saida, qtde_horas, cliente) VALUES ('0','1','2023-11-17','12:00','14:00','2','2');
    
  SELECT *
    FROM suaquadra.avaliacao;
    
        
  SELECT *
    FROM suaquadra.usuarios;
    
    SELECT quadra_id, titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf FROM suaquadra.quadra;
    
    
SELECT q.*
FROM quadra q
WHERE lower(q.endereco) like lower('%2%')
  AND q.quadra_id NOT IN (
    SELECT l.quadra_id
    FROM locacao l
    WHERE l.locacao_data BETWEEN '2023-11-17' AND '2023-11-24'
  OR l.locacao_data IS NULL
);

SELECT quadra_id, titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf FROM suaquadra.quadra WHERE UF = 'uf' AND quadra_id NOT IN ( SELECT l.quadra_id FROM locacao l WHERE l.locacao_data BETWEEN '2023-11-11' AND '2023-11-18' OR l.locacao_data IS NULL);
    
    