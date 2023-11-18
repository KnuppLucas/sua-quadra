select *
  from suaquadra.quadra;
  
SELECT q.*
FROM quadra q
WHERE 0 = 0
  AND q.quadra_id NOT IN (
    SELECT l.quadra_id
    FROM locacao l
    WHERE l.locacao_data BETWEEN '2023-11-11' AND '2023-11-12'
  OR l.locacao_data IS NULL
);

    SELECT *
    FROM locacao l;
    
    INSERT INTO suaquadra.locacao ( locacao_id, quadra_id, locacao_data, horario_entrada, horario_saida, qtde_horas, cliente) VALUES ('0','1','2023-11-17','12:00','14:00','2','2');
    
  SELECT *
    FROM suaquadra.avaliacao;
    
    
    
    