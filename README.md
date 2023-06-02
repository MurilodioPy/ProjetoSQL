# ProjetoSQL
Trabalho para treino da linguagem SQL
    2. Criar uma restrição para o atributo VALOR da tabela PRECOS (mínimo = 2,50).
R: ALTER TABLE Precos
ADD CONSTRAINT preco_minimo CHECK (valor >= 2.50);

    3. Criar uma restrição para o atributo DT_COMPRA da tabela FILMES (mínimo = 10 de janeiro de 2020).
R: ALTER TABLE Filmes
ADD CONSTRAINT chk_dt_compra
CHECK (Dt_Compra >= '2020-01-10');

    4. Criar uma restrição para o atributo DT_LOCACAO da tabela LOCACOES (mínimo = 1º de março de 2020).
R:
ALTER TABLE LOCACOES
ADD CONSTRAINT locacoes_dt_locacao_min
CHECK (DT_LOCACAO >= TO_DATE('2020-03-01', 'YYYY-MM-DD'));
    5. Remover todas as restrições criadas acima
R: ALTER TABLE Precos DROP CONSTRAINT precos_valor_minimo;

    6. Selecionar código e nome dos filmes cuja descrição do gênero seja “ação”
R: SELECT f.filme, f.nome
FROM Filmes f
INNER JOIN Genero g ON f.genero = g.genero
WHERE g.descricao = 'Ação';

     FILME NOME                                                                                                
---------- ----------------------------------------------------------------------------------------------------
         1 The Dark Knight                                                                                     
         2 The Avengers                                                                                        
         3 Black Panther                                                                                       
         4 Spider-Man: Into the Spider-Verse                                                                   
         5 Wonder Woman                                                                                        
         6 Captain America: Civil War                                                                          
         7 X-Men: Days of Future Past                                                                          
         8 Iron Man                                                                                            
         9 Guardians of the Galaxy                                                                             
        10 The Incredibles                                                                                     
        11 Superman                                                                                            

     FILME NOME                                                                                                
---------- ----------------------------------------------------------------------------------------------------
        12 Batman v Superman: Dawn of Justice                                                                  
        13 Thor: Ragnarok                                                                                      
        14 Avengers: Endgame                                                                                   
        15 Logan                                                                                               
        16 Deadpool                                                                                            
        17 Doctor Strange                                                                                      
        18 The Amazing Spider-Man                                                                              
        19 Ant-Man                                                                                             
        20 Blade  

    7. Selecionar código e nome dos filmes em que trabalham os atores “pedro silva” e “mara souza” e que sejam do gênero “documentário”
R: 	SELECT f.codigo, f.nome
FROM Filmes f
JOIN Genero g ON f.cod_genero = g.codigo
WHERE g.descricao = 'documentário'
AND (LOWER(e.nome) LIKE '%pedro silva%'
   		 OR LOWER(e.nome) LIKE '%mara souza%');

    8. Selecionar todos os dados dos clientes cujo nome inicie com “ant” e cuja cidade seja igual a “maresias”
R: 	SELECT * 
FROM Clientes 
WHERE nome LIKE 'ant%' AND cidade = 'maresias';

    9. Selecionar código e nome dos filmes cuja devolução seja “24 hs” e que sejam do gênero “policial”
R:	 ALTER TABLE Locacoes
ADD Duracao INT;

UPDATE Locacoes
SET Duracao = NUMTODSINTERVAL((Dt_Devolucao - Dt_Locacao), 'DAY');

    10. Selecionar codigo e nome dos filmes, codigo e categoria de preços, cujos preços sejam > 3,50
R: 	SELECT f.filme, f.nome, p.precos, p.categoria
FROM filmes f
INNER JOIN precos p ON f.preco = p.precos
WHERE p.valor > 3.50;

    11. Selecionar codigo e nome dos filmes, codigo e nome dos atores, dos filmes cujo preço < 2,00
R: 	SELECT f.filme, f.nome, a.Ator, a.Nome
FROM Filmes f
INNER JOIN filmes_ator e ON f.filme = e.ator
INNER JOIN Atores a ON e.ator = a.ator
INNER JOIN Precos p ON f.genero = p.categoria
WHERE p.Valor < 2.00;

    12. Selecionar codigo e nome dos clientes que locaram filmes do gênero “épico”
R:  	SELECT DISTINCT c.Cod_Cliente, c.Nome
FROM Clientes c
JOIN Locacoes l ON c.Cod_Cliente = l.Cliente
JOIN Filmes f ON l.Filme = f.Cod_Filme
JOIN Generos g ON f.Genero = g.Cod_Genero
WHERE g.Descricao = 'épico';

    13. Selecionar código e nome dos atores que trabalharam em filmes cujo código de gênero = 4
R: 	SELECT DISTINCT A.Cod_Ator, A.Nome_Ator
FROM Atores A
INNER JOIN Elenco E ON E.Cod_Ator = A.Cod_Ator
INNER JOIN Filmes F ON F.Cod_Filme = E.Cod_Filme
WHERE F.Cod_Genero = 4;

    14. Selecionar código e nome dos filmes, descrição do gênero, data da compra, dos filmes comprados no ano de 2021, do gênero “adulto”
R: 	SELECT f.codigo, f.nome, g.descricao, p.dt_compra
FROM filmes f
JOIN generos g ON f.cod_genero = g.codigo
JOIN precos p ON f.cod_preco = p.codigo
WHERE g.descricao = 'adulto' AND EXTRACT(YEAR FROM p.dt_compra) = 2021;

15. Selecionar o número e a data da locação, das locações feitas pelo cliente “ana terra”, no ano de 2020.
R: 	SELECT NUM_LOCACAO, DT_LOCACAO
FROM LOCACOES
WHERE TO_CHAR(DT_LOCACAO, 'YYYY') = '2020'
AND COD_CLIENTE = (SELECT COD_CLIENTE FROM CLIENTES WHERE NOME LIKE 'ana terra%');

16. Selecionar o número e a data da locação, o código e nome dos filmes, das locações feitas pelo cliente “jorge tabajara”, no primeiro semestre de 2020, em ordem de data de locação.
R: 	SELECT l.NUM_LOCACAO, l.DT_LOCACAO, f.COD_FILME, f.NOME_FILME 
FROM LOCACOES l 
JOIN ITENS_LOCACAO il ON l.NUM_LOCACAO = il.NUM_LOCACAO 
JOIN FILMES f ON il.COD_FILME = f.COD_FILME 
JOIN CLIENTES c ON l.COD_CLIENTE = c.COD_CLIENTE 
WHERE c.NOME_CLIENTE = 'jorge tabajara' 
AND l.DT_LOCACAO >= to_date('01/01/2020', 'dd/mm/yyyy') 
AND l.DT_LOCACAO <= to_date('30/06/2020', 'dd/mm/yyyy')
ORDER BY l.DT_LOCACAO;

17. Selecionar o nome dos clientes e a data de locação, das locações realizadas no mês de setembro de 2020.
R:	 SELECT CLIENTES.NOME, LOCACOES.DT_LOCACAO
FROM LOCACOES
INNER JOIN CLIENTES ON LOCACOES.COD_CLIENTE = CLIENTES.COD_CLIENTE
WHERE TO_CHAR(LOCACOES.DT_LOCACAO, 'MM') = '09'
AND TO_CHAR(LOCACOES.DT_LOCACAO, 'YYYY') = '2020';

18. Selecionar codigo e nome dos filmes, data de locação, dos filmes locados pelo cliente “Antonio ferreira”, no mês de julho de 2020, do gênero “drama”
R: 	 SELECT F.CODIGO, F.NOME, L.DT_LOCACAO
FROM FILMES F 
INNER JOIN LOCACOES L ON F.CODIGO = L.COD_FILME 
INNER JOIN CLIENTES C ON L.COD_CLIENTE = C.CODIGO
INNER JOIN GENEROS G ON F.COD_GENERO = G.CODIGO
WHERE C.NOME = 'Antonio ferreira' 
 	 AND TO_CHAR(L.DT_LOCACAO, 'MM') = '07' 
  	AND G.DESCRICAO = 'drama';

19. Selecionar o código do gênero, o código e o nome de todos os filmes deste gênero, ordenados pelo código do gênero.
R: 	SELECT g.codigo_genero, f.codigo_filme, f.nome_filme
FROM filmes f
JOIN genero g ON g.codigo_genero = f.codigo_genero
ORDER BY g.codigo_genero;

20. Selecionar os nomes dos filmes, os códigos e nomes de todos os atores que trabalharam nestes filmes, para os filmes de gênero “comédia”.
R: 	SELECT f.codigo, f.nome, a.codigo, a.nome 
FROM filmes f 
JOIN atores_filmes af ON f.codigo = af.cod_filme 
JOIN atores a ON af.cod_ator = a.codigo 
JOIN generos g ON f.cod_genero = g.codigo 
WHERE g.descricao = 'comédia' 
ORDER BY f.codigo;

21. Selecionar o nome de todas as cidades onde a locadora tem clientes (não repetir o nome da cidade).
R: 	SELECT DISTINCT cidade
FROM clientes;

22. Selecionar o nome da cidade e a quantidade de clientes em cada uma das cidades, para todas as cidades.
R: 	SELECT CIDADES.NOME_CIDADE, COUNT(CLIENTES.ID_CLIENTE) AS QUANTIDADE_CLIENTES
FROM CIDADES
JOIN CLIENTES ON CIDADES.ID_CIDADE = CLIENTES.ID_CIDADE
GROUP BY CIDADES.NOME_CIDADE;

23. Selecionar o codigo e nome dos clientes que não realizaram nenhuma locação.
R:	SELECT codigo, nome
FROM Cliente
WHERE codigo NOT IN (SELECT DISTINCT codigo_cliente FROM Locacao)

24. Selecionar o código e nome dos clientes que já locaram o filme “a espera de um milagre”.
R: 	SELECT DISTINCT c.codigo, c.nome
FROM cliente c
INNER JOIN locacao l ON c.codigo = l.codigo_cliente
INNER JOIN item_locacao i ON l.numero = i.numero_locacao
INNER JOIN filme f ON i.codigo_filme = f.codigo
WHERE f.nome = 'a espera de um milagre';

25. Selecionar o codigo e nome dos filmes que nunca foram locados.
R: 	SELECT codigo, nome
FROM filme
WHERE codigo NOT IN (
  		SELECT DISTINCT codigo_filme
  		FROM locacao
);

26. Selecionar o codigo e nome dos filmes que foram comprados em 2020 e que nunca foram locados.
R: 	SELECT codigo, nome
FROM filme
WHERE codigo NOT IN (
 		 SELECT codigo_filme
  		FROM locacao
)
AND data_compra BETWEEN TO_DATE('2020-01-01', 'YYYY-MM-DD') AND TO_DATE('2020-12-31', 'YYYY-MM-DD');

27. Obter o número médio de filmes locados em cada locação, no ano de 2021.
R: 	SELECT AVG(IQT.Quantidade) AS "Média de filmes locados"
FROM Locacao L
JOIN Itens_Locacao IQT ON L.Numero = IQT.Numero
WHERE EXTRACT(YEAR FROM L.Data_Locacao) = 2021;

28. Obter quantos filmes diferentes foram locados no ano de 2020.
R:	 SELECT COUNT(DISTINCT filme.codigo) AS "Quantidade de filmes diferentes locados em 2020"
FROM locacao
INNER JOIN item_locacao ON locacao.numero = item_locacao.numero_locacao
INNER JOIN filme ON item_locacao.codigo_filme = filme.codigo
WHERE EXTRACT(YEAR FROM locacao.data) = 2020;

29. Selecionar os códigos dos clientes e a quantidade total de locações por ele realizadas.
R:	SELECT l.cod_cliente, c.nome, COUNT(*) AS qtd_locacoes
FROM Locacao l
JOIN Cliente c ON l.cod_cliente = c.codigo
GROUP BY l.cod_cliente, c.nome;

30. Selecionar os códigos dos clientes e a quantidade total de filmes já locados por cada um, em ordem decrescente.
R: 	SELECT l.cod_cliente, c.nome, COUNT(*) AS quantidade_filmes_locados
FROM Locacao l
JOIN Cliente c ON l.cod_cliente = c.codigo
GROUP BY l.cod_cliente, c.nome
ORDER BY quantidade_filmes_locados DESC;

31. Aumentar o atributo valor em 12,5%, para os filmes cuja categoria seja “selo ouro”.
R: 	UPDATE filmes
SET valor = valor * 1.125
WHERE categoria = 'selo ouro';

32. Selecionar código e nome dos filmes, descrição do gênero, valor e como ficariam se fosse aplicado um aumento de 20%, com o cabeçalho (rótulo da coluna) “Com Aumento de 20%”
R:	 SELECT codigo_filme, nome_filme, descricao_genero, valor,
      		 (valor * 1.2) AS "Com Aumento de 20%"
FROM filme f
JOIN genero g ON f.codigo_genero = g.codigo_genero;
