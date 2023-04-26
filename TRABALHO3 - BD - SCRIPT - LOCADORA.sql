/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     11/04/2023 19:00:00                          */
/*==============================================================*/
drop table CLIENTES cascade constraints;
drop table LOCACOES cascade constraints;
drop table ITENS_LOCACAO cascade constraints;
drop table GENEROS cascade constraints;
drop table PRECOS cascade constraints;
drop table FILMES cascade constraints;
drop table FILMES_ATOR cascade constraints;
drop table ATORES cascade constraints;
drop table CATEGORIAS cascade constraints;

/*==============================================================*/
/* Table: FILMES                                                */
/*==============================================================*/
CREATE TABLE FILMES (
    FILME         NUMBER(6),
    NOME          VARCHAR2(100) NOT NULL,
    GENERO        NUMBER(3)     NOT NULL,
    PRECO         NUMBER(4)     NOT NULL,
    DT_COMPRA     DATE          NOT NULL,
    HRS_DEVOLUCAO NUMBER(2)     NOT NULL,
    CONSTRAINT PK_FILMES PRIMARY KEY (FILME)
);

/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
CREATE TABLE CLIENTES (
    CLIENTE     NUMBER(6)      NOT NULL,
    NOME        VARCHAR2(100)  NOT NULL,
    ENDERECO    VARCHAR2(100)  NOT NULL,
    FONE        VARCHAR2(20)   NOT NULL,
    CIDADE      VARCHAR2(50)   NOT NULL,
    CONSTRAINT PK_CLIENTES     PRIMARY KEY (CLIENTE)
);

/*==============================================================*/
/* Table: LOCACOES                                              */
/*==============================================================*/
CREATE TABLE LOCACOES (
    LOCACAO      NUMBER(6),
    DT_LOCACAO   DATE       NOT NULL,
    CLIENTE      NUMBER(6)  NOT NULL,
    DT_DEVOLUCAO DATE       NOT NULL,
    CONSTRAINT PK_LOCACOES  PRIMARY KEY (LOCACAO)
);

/*==============================================================*/
/* Table: ITENS_LOCACAO                                         */
/*==============================================================*/
CREATE TABLE ITENS_LOCACAO (
    LOCACAO  NUMBER(6)   NOT NULL,
    FILME    NUMBER(6)   NOT NULL,
    DESCONTO NUMBER(8,2),
    CONSTRAINT PK_ITENS_LOCACAO PRIMARY KEY (LOCACAO, FILME)
);

/*==============================================================*/
/* Table: GENEROS                                               */
/*==============================================================*/
CREATE TABLE GENEROS (
    GENERO     NUMBER(3),
    DESCRICAO  VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_GENEROS PRIMARY KEY (GENERO)
);
/*==============================================================*/
/* Table: FILMES_ATOR                                           */
/*==============================================================*/
CREATE TABLE FILMES_ATOR (
    FILME NUMBER(6),
    ATOR  NUMBER(6),
    CONSTRAINT PK_FILMES_ATOR PRIMARY KEY (FILME, ATOR)
);

/*==============================================================*/
/* Table: ATORES                                                */
/*==============================================================*/
CREATE TABLE ATORES (
    ATOR NUMBER(6),
    NOME VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_ATORES PRIMARY KEY (ATOR)
);
/*==============================================================*/
/* Table: CATEGORIAS                                            */
/*==============================================================*/
CREATE TABLE CATEGORIAS (
    CATEGORIA NUMBER(3),
    DESCRICAO VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_CATEGORIAS PRIMARY KEY (CATEGORIA)
);
/*==============================================================*/
/* Table: PRECOS                                                */
/*==============================================================*/
CREATE TABLE PRECOS (
    PRECO     NUMBER(4)   NOT NULL,
    CATEGORIA NUMBER(3),
    VALOR     NUMBER(8,2) NOT NULL,
    CONSTRAINT PK_PRECOS PRIMARY KEY(PRECO)
);

/*==============================================================*/
/* ADICIONANDO OS DADOS                                         */
/*==============================================================*/
REM INSERTING into CLIENTES
INSERT INTO CLIENTES (CLIENTE, NOME, ENDERECO, FONE, CIDADE) VALUES (7, 'Ant�nio Silva', 'Rua das Flores, 123', '(11) 9999-1234', 'S�o Paulo');
INSERT INTO CLIENTES (CLIENTE, NOME, ENDERECO, FONE, CIDADE) VALUES (3, 'Maria Santos', 'Av. das Palmeiras, 456', '(21) 9876-5678', 'Rio de Janeiro');
INSERT INTO CLIENTES (CLIENTE, NOME, ENDERECO, FONE, CIDADE) VALUES (6, 'Jo�o Oliveira', 'Travessa das Pedras, 789', '(51) 5555-7890', 'Porto Alegre');
INSERT INTO CLIENTES (CLIENTE, NOME, ENDERECO, FONE, CIDADE) VALUES (4, 'Ana Souza', 'R. dos Ip�s, 234', '(62) 1234-5678', 'Goi�nia');
INSERT INTO CLIENTES (CLIENTE, NOME, ENDERECO, FONE, CIDADE) VALUES (5, 'Pedro Fernandes', 'Av. dos Girass�is, 567', '(85) 9876-5432', 'Fort');
insert into CLIENTES (cliente, nome, endereco, fone, cidade) values (2, 'Nanon', '9th Floor', '404-507-3622', 'Pingshui');
insert into CLIENTES (cliente, nome, endereco, fone, cidade) values (9, 'Iain', 'Suite 38', '532-230-4195', 'Rejoyoso');
insert into CLIENTES (cliente, nome, endereco, fone, cidade) values (1, 'Linnet', 'Suite 78', '595-803-6808', 'Kuala Tuha');
insert into CLIENTES (cliente, nome, endereco, fone, cidade) values (8, 'Claudia', '18th Floor', '904-164-0987', 'Jacksonville');
insert into CLIENTES (cliente, nome, endereco, fone, cidade) values (10, 'Doroteya', 'Room 1316', '500-808-3604', 'Haixing');

REM INSERTING into ATORES
INSERT INTO ATORES (ATOR, NOME) VALUES (1, 'Pedro Silva');
INSERT INTO ATORES (ATOR, NOME) VALUES (2, 'Mara Souza');
INSERT INTO ATORES (ATOR, NOME) VALUES (3, 'Ant�nio Rodrigues');
INSERT INTO ATORES (ATOR, NOME) VALUES (4, 'Maria Fernandes');
INSERT INTO ATORES (ATOR, NOME) VALUES (5, 'Jo�o Oliveira');
insert into ATORES (ator, nome) values (6, 'Fiann Dryburgh');
insert into ATORES (ator, nome) values (7, 'Hyman Coffin');
insert into ATORES (ator, nome) values (8, 'Andria Macon');
insert into ATORES (ator, nome) values (9, 'Vinson Foster');
insert into ATORES (ator, nome) values (10, 'Stanfield Boughtwood');

REM INSERTING into CATEGORIAS
INSERT INTO CATEGORIAS (CATEGORIA, DESCRICAO) VALUES (1, 'selo ouro');
INSERT INTO CATEGORIAS (CATEGORIA, DESCRICAO) VALUES (2, 'selo prata');
INSERT INTO CATEGORIAS (CATEGORIA, DESCRICAO) VALUES (3, 'selo ouro');
INSERT INTO CATEGORIAS (CATEGORIA, DESCRICAO) VALUES (4, 'selo prata');
INSERT INTO CATEGORIAS (CATEGORIA, DESCRICAO) VALUES (5, 'selo ouro');
insert into CATEGORIAS (categoria, descricao) values (6, 'selo prata');
insert into CATEGORIAS (categoria, descricao) values (7, '(selo ouro)');
insert into CATEGORIAS (categoria, descricao) values (8, 'selo prata');
insert into CATEGORIAS (categoria, descricao) values (9, 'selo ouro');
insert into CATEGORIAS (categoria, descricao) values (10, 'selo prata');

REM INSERTING into FILMES
INSERT INTO FILMES (FILME, NOME, GENERO, PRECO, DT_COMPRA, HRS_DEVOLUCAO) VALUES (1, 'Aventuras na Selva', 1, 1, '15/01/2022', 48);
INSERT INTO FILMES (FILME, NOME, GENERO, PRECO, DT_COMPRA, HRS_DEVOLUCAO) VALUES (2, 'Noite de Terror', 2, 10, '05/06/2022', 24);
INSERT INTO FILMES (FILME, NOME, GENERO, PRECO, DT_COMPRA, HRS_DEVOLUCAO) VALUES (3, 'O Tesouro Perdido', 3, 9, '20/03/2022', 72);
INSERT INTO FILMES (FILME, NOME, GENERO, PRECO, DT_COMPRA, HRS_DEVOLUCAO) VALUES (4, 'Amor em Paris', 4, 2, '10/08/2022', 48);
INSERT INTO FILMES (FILME, NOME, GENERO, PRECO, DT_COMPRA, HRS_DEVOLUCAO) VALUES (5, 'Desbravadores do Espa�o', 5, 4, '30/09/2022', 72);
insert into FILMES (FILME, NOME, GENERO, PRECO, DT_COMPRA, HRS_DEVOLUCAO) values (6, 'Late Autumn (Man-choo)', 6, 3, '7/3/2023', 21);
insert into FILMES (FILME, NOME, GENERO, PRECO, DT_COMPRA, HRS_DEVOLUCAO) values (7, 'City Zero', 7, 6, '21/4/2022', 8);
insert into FILMES (FILME, NOME, GENERO, PRECO, DT_COMPRA, HRS_DEVOLUCAO) values (8, 'Crows Zero (Kur�zu zero)', 8, 7, '1/1/2023', 8);
insert into FILMES (FILME, NOME, GENERO, PRECO, DT_COMPRA, HRS_DEVOLUCAO) values (9, 'Venus Wars (Venus Senki)', 9, 4, '22/10/2022', 11);
insert into FILMES (FILME, NOME, GENERO, PRECO, DT_COMPRA, HRS_DEVOLUCAO) values (10, 'American Gothic', 10, 1, '1/1/2023', 14);

REM INSERTING into FILMES_ATOR
INSERT INTO FILMES_ATOR (FILME, ATOR) VALUES (1, 1);
INSERT INTO FILMES_ATOR (FILME, ATOR) VALUES (2, 2);
INSERT INTO FILMES_ATOR (FILME, ATOR) VALUES (3, 3);
INSERT INTO FILMES_ATOR (FILME, ATOR) VALUES (4, 4);
INSERT INTO FILMES_ATOR (FILME, ATOR) VALUES (5, 5);
insert into FILMES_ATOR (FILME, ATOR) values (6, 2);
insert into FILMES_ATOR (FILME, ATOR) values (7, 1);
insert into FILMES_ATOR (FILME, ATOR) values (8, 5);
insert into FILMES_ATOR (FILME, ATOR) values (9, 2);
insert into FILMES_ATOR (FILME, ATOR) values (10, 7);

REM INSERTING into PRECOS
INSERT INTO PRECOS (PRECO, CATEGORIA, VALOR) VALUES (1, 1, 12.99);
INSERT INTO PRECOS (PRECO, CATEGORIA, VALOR) VALUES (2, 2, 15.50);
INSERT INTO PRECOS (PRECO, CATEGORIA, VALOR) VALUES (3, 1, 10.25);
INSERT INTO PRECOS (PRECO, CATEGORIA, VALOR) VALUES (4, 3, 18.75);
INSERT INTO PRECOS (PRECO, CATEGORIA, VALOR) VALUES (5, 2, 22.99);
insert into PRECOS (PRECO, CATEGORIA, VALOR) values (6, 6, 20.54);
insert into PRECOS (PRECO, CATEGORIA, VALOR) values (7, 2, 32.9);
insert into PRECOS (PRECO, CATEGORIA, VALOR) values (8, 4, 46.54);
insert into PRECOS (PRECO, CATEGORIA, VALOR) values (9, 9, 9.89);
insert into PRECOS (PRECO, CATEGORIA, VALOR) values (10, 5, 32.39);

REM INSERTING into GENEROS
INSERT INTO GENEROS (GENERO, DESCRICAO) VALUES (1, 'A��o');
INSERT INTO GENEROS (GENERO, DESCRICAO) VALUES (2, 'Com�dia');
INSERT INTO GENEROS (GENERO, DESCRICAO) VALUES (3, 'Drama');
INSERT INTO GENEROS (GENERO, DESCRICAO) VALUES (4, 'Fic��o Cient�fica');
INSERT INTO GENEROS (GENERO, DESCRICAO) VALUES (5, 'Romance');
insert into GENEROS (GENERO, DESCRICAO) values (6, 'Drama');
insert into GENEROS (GENERO, DESCRICAO) values (7, 'Sci-Fi');
insert into GENEROS (GENERO, DESCRICAO) values (8, 'Drama');
insert into GENEROS (GENERO, DESCRICAO) values (9, 'Drama');
insert into GENEROS (GENERO, DESCRICAO) values (10,'Crime|Drama');

REM INSERTING into ITENS_LOCACAO
INSERT INTO ITENS_LOCACAO (LOCACAO, FILME, DESCONTO) VALUES (1, 1, 3.50);
INSERT INTO ITENS_LOCACAO (LOCACAO, FILME, DESCONTO) VALUES (2, 5, NULL);
INSERT INTO ITENS_LOCACAO (LOCACAO, FILME, DESCONTO) VALUES (3, 1, 1.25);
INSERT INTO ITENS_LOCACAO (LOCACAO, FILME, DESCONTO) VALUES (4, 4, NULL);
INSERT INTO ITENS_LOCACAO (LOCACAO, FILME, DESCONTO) VALUES (5, 3, 2.00);
insert into ITENS_LOCACAO (LOCACAO, FILME, DESCONTO) values (6, 2, 2.63);
insert into ITENS_LOCACAO (LOCACAO, FILME, DESCONTO) values (7, 1, 3.27);
insert into ITENS_LOCACAO (LOCACAO, FILME, DESCONTO) values (8, 3, 2.52);
insert into ITENS_LOCACAO (LOCACAO, FILME, DESCONTO) values (9, 4, 4.03);
insert into ITENS_LOCACAO (LOCACAO, FILME, DESCONTO) values (10, 1, 3.44);

REM INSERTING into LOCACOES
INSERT INTO LOCACOES (LOCACAO, DT_LOCACAO, CLIENTE, DT_DEVOLUCAO) VALUES (1, '28/03/2023', 5, '30/03/2023');
INSERT INTO LOCACOES (LOCACAO, DT_LOCACAO, CLIENTE, DT_DEVOLUCAO) VALUES (2, '29/03/2023', 7, '02/04/2023');
INSERT INTO LOCACOES (LOCACAO, DT_LOCACAO, CLIENTE, DT_DEVOLUCAO) VALUES (3, '30/03/2023', 5, '01/04/2023');
INSERT INTO LOCACOES (LOCACAO, DT_LOCACAO, CLIENTE, DT_DEVOLUCAO) VALUES (4, '31/03/2023', 4, '03/04/2023');
INSERT INTO LOCACOES (LOCACAO, DT_LOCACAO, CLIENTE, DT_DEVOLUCAO) VALUES (5, '01/04/2023', 9, '04/04/2023');
insert into LOCACOES (LOCACAO, DT_LOCACAO, CLIENTE, DT_DEVOLUCAO) values (6, '20/3/2020', 7, '1/9/2022');
insert into LOCACOES (LOCACAO, DT_LOCACAO, CLIENTE, DT_DEVOLUCAO) values (7, '3/7/2020', 7, '18/9/2022');
insert into LOCACOES (LOCACAO, DT_LOCACAO, CLIENTE, DT_DEVOLUCAO) values (8, '29/1/2021', 6, '13/5/2023');
insert into LOCACOES (LOCACAO, DT_LOCACAO, CLIENTE, DT_DEVOLUCAO) values (9, '30/4/2020', 4, '21/9/2022');
insert into LOCACOES (LOCACAO, DT_LOCACAO, CLIENTE, DT_DEVOLUCAO) values (10, '14/3/2021', 3, '3/12/2023');

/*==============================================================*/
/* ALTERANDO AS TABELAS ADICIONANDO AS RESTRI��ES              */
/*==============================================================*/
ALTER TABLE PRECOS
ADD CONSTRAINT FK_CATEGORIA_PRECOS  FOREIGN KEY (CATEGORIA)
REFERENCES CATEGORIAS (CATEGORIA);

ALTER TABLE ITENS_LOCACAO
ADD CONSTRAINT FK_LOCACAO_ITENS_LOCACAO FOREIGN KEY (LOCACAO)
REFERENCES LOCACOES (LOCACAO);

ALTER TABLE ITENS_LOCACAO
ADD CONSTRAINT FK_FILME_ITENS_LOCACAO   FOREIGN KEY (FILME)   
REFERENCES FILMES   (FILME);

ALTER TABLE FILMES
ADD CONSTRAINT FK_PRECOS_FILMES FOREIGN KEY (FILME)
REFERENCES PRECOS (PRECO);

ALTER TABLE FILMES
ADD CONSTRAINT FK_GENERO_FILMES FOREIGN KEY (GENERO)
REFERENCES GENEROS (GENERO);

ALTER TABLE LOCACOES
ADD CONSTRAINT FK_CLIENTE_LOCACOES FOREIGN KEY (CLIENTE)
REFERENCES CLIENTES (CLIENTE);

ALTER TABLE FILMES_ATOR
ADD CONSTRAINT FK_FILME_FILMES_ATOR FOREIGN KEY (FILME)
REFERENCES FILMES(FILME);

ALTER TABLE FILMES_ATOR
ADD CONSTRAINT FK_ATOR_FILMES_ATOR FOREIGN KEY (ATOR)
REFERENCES ATORES(ATOR);

/*==============================================================*/
/* ALTERANDO AS TABELAS RETIRANDO RESTRICOES                    */
/*==============================================================*/
alter table PRECOS
drop constraint FK_CATEGORIA_PRECOS;

alter table ITENS_LOCACAO
drop constraint FK_LOCACAO_ITENS_LOCACAO;

alter table ITENS_LOCACAO
drop constraint FK_FILME_ITENS_LOCACAO;

alter table FILMES
drop constraint FK_PRECOS_FILMES;

alter table FILMES
drop constraint FK_GENERO_FILMES;

alter table LOCACOES
drop constraint FK_CLIENTE_LOCACOES;

alter table FILMES_ATOR
drop constraint FK_FILME_FILMES_ATOR;

alter table FILMES_ATOR
drop constraint FK_ATOR_FILMES_ATOR;

/*==============================================================*/
/* CONSULTAS                                                    */
/*==============================================================*/
/*  */
/* 2. Criar uma restri��o para o atributo VALOR da tabela PRECOS (m�nimo = 2,50). */
ALTER TABLE PRECOS
ADD CONSTRAINT MIN_VALOR CHECK (PRECO >= 2.50);

/* 3. Criar uma restri��o para o atributo DT_COMPRA da tabela FILMES (m�nimo = 10 de janeiro de 2020).*/
ALTER TABLE FILMES
ADD CONSTRAINT MIN_DT_COMPRA
CHECK (DT_COMPRA >= TO_DATE ('2020-01-10', 'YYYY/MM/DD'));

/* 4. Criar uma restri��o para o atributo DT_LOCACAO da tabela LOCACOES (m�nimo = 1� de mar�o de 2020). */
ALTER TABLE LOCACOES
ADD CONSTRAINT MIN_DT_LOCACAO
CHECK (DT_LOCACAO >= TO_DATE ('2020-03-01', 'YYYY/MM/DD'));

/* 5. Remover todas as restri��es criadas acima */
ALTER TABLE PRECOS 
DROP CONSTRAINT MIN_VALOR;

ALTER TABLE FILMES 
DROP CONSTRAINT MIN_DT_COMPRA;

ALTER TABLE LOCACOES 
DROP CONSTRAINT MIN_DT_LOCACAO;

/* 6. Selecionar c�digo e nome dos filmes cuja descri��o do g�nero seja �A��o� */
SELECT F.FILME, F.NOME
FROM FILMES F
JOIN GENEROS G ON F.GENERO = G.GENERO
WHERE G.DESCRICAO = 'A��o';

/* 7. Selecionar codigo e nome dos filmes em que trabalham os atores �pedro silva� e �mara souza� e que sejam do
g�nero �document�rio� */
SELECT F.FILME, F.NOME
FROM FILMES F
JOIN FILMES_ATOR FA ON F.FILME = FA.FILME
JOIN ATORES A ON FA.ATOR = A.ATOR
JOIN GENEROS G ON F.GENERO = G.GENERO
WHERE A.NOME IN ('Pedro Silva', 'Mara Souza') AND G.DESCRICAO = 'document�rio';

/* 8. Selecionar todos os dados dos clientes cujo nome inicie com �ant� e cuja cidade seja igual a �maresias� */
SELECT *
FROM CLIENTES
WHERE NOME LIKE 'Ant%' AND CIDADE = 'maresias';

/* 9. Selecionar c�digo e nome dos filmes cuja devolu��o seja �24 hs� e que sejam do g�nero �policial */
SELECT F.FILME, F.NOME
FROM FILMES F
JOIN GENEROS G ON F.GENERO = G.GENERO
WHERE lower(G.DESCRICAO) = 'policial' AND F.HRS_DEVOLUCAO >= 24;

/* 10. Selecionar codigo e nome dos filmes, codigo e categoria de pre�os, cujos pre�os sejam > 3,50 */
SELECT F.FILME, F.NOME, P.PRECO, P.CATEGORIA
FROM FILMES F
JOIN PRECOS P ON F.PRECO = P.PRECO
WHERE P.VALOR > 3.50;

/* 11. Selecionar codigo e nome dos filmes, codigo e nome dos atores, dos filmes cujo pre�o < 2,00 */
SELECT F.FILME, F.NOME AS NOME_FILME, A.ATOR AS ID_ATOR, A.NOME AS NOME_ATOR
FROM FILMES F
JOIN FILMES_ATOR FA ON F.FILME = FA.FILME
JOIN ATORES A ON FA.ATOR = A.ATOR
JOIN PRECOS P ON F.PRECO = P.PRECO
WHERE P.VALOR < 2.00;

/*12. Selecionar codigo e nome dos clientes que locaram filmes do g�nero ��pico� */
SELECT C.CLIENTE, C.NOME
FROM CLIENTES C
JOIN LOCACOES L ON C.CLIENTE = L.CLIENTE
JOIN ITENS_LOCACAO IL ON L.LOCACAO = IL.LOCACAO
JOIN FILMES F ON IL.FILME = F.FILME
JOIN GENEROS G ON F.GENERO = G.GENERO
WHERE lower(G.DESCRICAO) = '�pico';

/* 13. Selecionar c�digo e nome dos atores que trabalharam em filmes cujo c�digo de g�nero = 4 */
SELECT A.ATOR, A.NOME
FROM ATORES A
JOIN FILMES_ATOR FA ON A.ATOR = FA.ATOR
JOIN FILMES F ON FA.FILME = F.FILME
WHERE F.GENERO = 4;

/* 14. Selecionar c�digo e nome dos filmes, descri��o do g�nero, data da compra, dos filmes comprados no ano de
2021, do g�nero �adulto� */
SELECT F.FILME, F.NOME, G.DESCRICAO, F.DT_COMPRA
FROM FILMES F
JOIN GENEROS G ON F.GENERO = G.GENERO
WHERE lower(G.DESCRICAO) = 'adulto' AND EXTRACT(YEAR FROM F.DT_COMPRA) = 2021;

/* 15. Selecionar o n�mero e a data da loca��o, das loca��es feitas pelo cliente �ana terra�, no ano de 2020. */
SELECT L.LOCACAO, L.DT_LOCACAO
FROM LOCACOES L
JOIN ITENS_LOCACAO IL ON L.LOCACAO = IL.LOCACAO
JOIN CLIENTES C ON L.CLIENTE = C.CLIENTE
WHERE lower(C.NOME) = 'ana terra' AND EXTRACT(YEAR FROM L.DT_LOCACAO) = 2020;

SELECT L.LOCACAO, L.DT_LOCACAO
FROM LOCACOES L
JOIN CLIENTES C ON L.CLIENTE = C.CLIENTE
WHERE lower(C.NOME) = 'ana terra' AND EXTRACT(YEAR FROM L.DT_LOCACAO) = 2020;

/* 16. Selecionar o n�mero e a data da loca��o, o c�digo e nome dos filmes, das loca��es feitas pelo cliente �jorge
tabajara�, no primeiro semestre de 2020, em ordem de data de loca��o */
SELECT L.LOCACAO, L.DT_LOCACAO, F.FILME, F.NOME AS NOME_FILME
FROM LOCACOES L
JOIN CLIENTES C ON L.CLIENTE = C.CLIENTE
JOIN ITENS_LOCACAO IL ON L.LOCACAO = IL.LOCACAO
JOIN FILMES F ON IL.FILME = F.FILME
WHERE lower(C.NOME) = 'jorge tabajara'
AND EXTRACT(YEAR FROM L.DT_LOCACAO) = 2020
AND EXTRACT(MONTH FROM L.DT_LOCACAO) <= 6
ORDER BY L.DT_LOCACAO;

/* 17. Selecionar o nome dos clientes e a data de loca��o, das loca��es realizadas no m�s de setembro de 2020 */
SELECT C.NOME AS NOME_CLIENTE, L.DT_LOCACAO
FROM LOCACOES L
JOIN CLIENTES C ON L.CLIENTE = C.CLIENTE
WHERE EXTRACT(MONTH FROM L.DT_LOCACAO) = 9
AND EXTRACT(YEAR FROM L.DT_LOCACAO) = 2020;

/* 18. Selecionar 
//codigo e 
//nome dos filmes, 
//data de loca��o, dos filmes locados pelo cliente �Antonio ferreira�, no m�s
de julho de 2020, do g�nero �drama� 
*/
SELECT F.FILME, F.NOME AS NOME_FILME, L.DT_LOCACAO
FROM FILMES F
JOIN ITENS_LOCACAO IL ON F.FILME = IL.FILME
JOIN LOCACOES L ON L.LOCACAO = IL.LOCACAO
JOIN CLIENTES C ON L.CLIENTE = C.CLIENTE
JOIN GENEROS G ON F.GENERO = G.GENERO
WHERE lower(C.NOME) = 'antonio ferreira'
AND EXTRACT(MONTH FROM L.DT_LOCACAO) = 7
AND EXTRACT(YEAR FROM L.DT_LOCACAO) = 2020
AND lower(G.DESCRICAO) = 'drama';

/* 19. Selecionar o c�digo do g�nero, o c�digo e o nome de todos os filmes deste g�nero, ordenados pelo c�digo do
g�nero. */
SELECT G.GENERO AS CODIGO_GENERO, F.GENERO AS CODIGO_FILME, F.NOME AS NOME_FILME
FROM GENEROS G
JOIN FILMES F ON G.GENERO = F.GENERO
ORDER BY G.GENERO;

/* 20. Selecionar os nomes dos filmes, os c�digos e nomes de todos os atores que trabalharam nestes filmes, para os
filmes de g�nero �com�dia� */
SELECT F.NOME AS NOME_FILME, A.ATOR AS CODIGO_ATOR, A.NOME AS NOME_ATOR
FROM FILMES F
JOIN FILMES_ATOR FT ON F.FILME = FT.FILME
JOIN ATORES A ON FT.ATOR = A.ATOR
JOIN GENEROS G ON F.GENERO = G.GENERO
WHERE lower(G.DESCRICAO) = 'com�dia';

/*21. Selecionar o nome de todas as cidades onde a locadora tem clientes (n�o repetir o nome da cidade).  */
SELECT DISTINCT CIDADE
FROM CLIENTES;

/* 22. Selecionar o nome da cidade e a quantidade de clientes em cada uma das cidades, para todas as cidades. */
SELECT CIDADE, COUNT(*) AS QUANTIDADE_DE_CLIENTES
FROM CLIENTES
GROUP BY CIDADE;

/* 23. Selecionar o codigo e nome dos clientes que n�o realizaram nenhuma loca��o. */
SELECT CLIENTE, NOME
FROM CLIENTES
WHERE CLIENTE NOT IN (SELECT CLIENTE FROM LOCACOES);

/* 24. Selecionar o c�digo e nome dos clientes que j� locaram o filme �a espera de um milagre�. */
SELECT C.CLIENTE, C.NOME
FROM CLIENTES C
JOIN LOCACOES L ON C.CLIENTE = L.CLIENTE
JOIN ITENS_LOCACAO IL ON L.LOCACAO = IL.LOCACAO 
JOIN FILMES F ON IL.FILME = F.FILME
WHERE lower(F.NOME) = 'a espera de um milagre';

/* 25. Selecionar o codigo e nome dos filmes que nunca foram locados. */
SELECT FILME AS COD_FILME, NOME AS NOME_FILME
FROM FILMES
WHERE FILME 
NOT IN (
    SELECT IL.FILME 
    FROM ITENS_LOCACAO IL
    JOIN LOCACOES L ON L.LOCACAO = IL.LOCACAO);
    

/* 26. Selecionar o codigo e nome dos filmes que foram comprados em 2020 e que nunca foram locados */
SELECT FILME, NOME
FROM FILMES 
WHERE EXTRACT (YEAR FROM DT_COMPRA) = 2020
  AND FILME NOT IN (
  SELECT FILME 
  FROM ITENS_LOCACAO IL
  JOIN LOCACOES L ON IL.LOCACAO = L.LOCACAO);

/* 27. Obter o n�mero m�dio de filmes locados em cada loca��o, no ano de 2021 */
SELECT AVG(IL.FILME) AS MEDIA_FILMES
FROM ITENS_LOCACAO IL
JOIN LOCACOES L ON IL.LOCACAO = L.LOCACAO   
WHERE EXTRACT(YEAR FROM L.DT_LOCACAO) = 2021;
  
/* 28. Obter quantos filmes diferentes foram locados no ano de 2020. */
SELECT COUNT(DISTINCT IL.FILME) AS QTD_FILMES_DIFERENTES
FROM LOCACOES L
JOIN ITENS_LOCACAO IL ON IL.LOCACAO = L.LOCACAO 
WHERE EXTRACT(YEAR FROM L.DT_LOCACAO) = 2020;

/* 29. Selecionar os c�digos dos clientes e a quantidade total de loca��es por ele realizadas. */
SELECT CLIENTE, COUNT(*) AS QTD_DE_LOCACOES
FROM LOCACOES
GROUP BY CLIENTE;

/* 30. Selecionar os c�digos dos clientes e a quantidade total de filmes j� locados por cada um, em ordem
decrescente. */
SELECT CLIENTE, COUNT(*) AS QTD_TOTAL_FILMES_LOCADOS
FROM LOCACOES
GROUP BY CLIENTE
ORDER BY QTD_TOTAL_FILMES_LOCADOS DESC;

/* 31. Aumentar o atributo valor em 12,5%, para os filmes cuja categoria seja �selo ouro�. */
UPDATE PRECOS
SET VALOR = VALOR * 1.125
WHERE CATEGORIA IN (SELECT CATEGORIA FROM CATEGORIAS WHERE DESCRICAO = 'selo ouro');

/* 32. Selecionar c�digo e nome dos filmes, descri��o do g�nero, valor e como ficariam se fosse aplicado um aumento
de 20%, com o cabe�alho (r�tulo da coluna) �Com Aumento de 20% */
SELECT F.FILME AS COD_FILME, F.NOME, G.DESCRICAO AS GENERO, P.VALOR, (P.VALOR * 1.2) AS VALOR_COM_AUMENTO
FROM FILMES F
JOIN PRECOS P ON F.PRECO = P.PRECO
JOIN GENEROS G ON F.GENERO = G.GENERO;

/* FIM DAS CONSULTAS SQL */
COMMIT;