-- initdb tmp
-- postgres -D tmp
-----------------------
-- createdb tmp
-- psql tmp < inserts.sql
DROP TABLE TBL_DEPTO, TBL_DOCENTE;

CREATE TABLE TBL_DEPTO (
	DEPTO_ID INTEGER PRIMARY KEY,
	DEPTO_SIGLA VARCHAR(10) NOT NULL,
	DEPTO_NOME VARCHAR(60) NOT NULL
); 

CREATE TABLE TBL_DOCENTE(
	DOC_ID INTEGER PRIMARY KEY,
	DOC_NOME VARCHAR(60) NOT NULL,
	DEPTO_ID INTEGER NOT NULL REFERENCES TBL_DEPTO(DEPTO_ID)
);

INSERT INTO TBL_DEPTO VALUES (1,'DCAA','Departamento de Ciências Agrárias e Ambientais');
INSERT INTO TBL_DEPTO VALUES (2,'DCAC','Departamento de Administração e Ciências Contábeis');
INSERT INTO TBL_DEPTO VALUES (3,'DCB','Departamento de Ciências Biológicas');
INSERT INTO TBL_DEPTO VALUES (4,'DCEC','Departamento de Ciências Econômicas');
INSERT INTO TBL_DEPTO VALUES (5,'DCET','Departamento de Ciências Exatas e Tecnológicas');
INSERT INTO TBL_DEPTO VALUES (6,'DCIE','Departamento de Ciências da Educação');
INSERT INTO TBL_DEPTO VALUES (7,'DCS',	'Departamento de Ciências da Saúde');
INSERT INTO TBL_DEPTO VALUES (8,'DCIJUR','Departamento de Ciências Jurídicas');
INSERT INTO TBL_DEPTO VALUES (9,'DFCH','Departamento de Filosofia e Ciências Humanas');
INSERT INTO TBL_DEPTO VALUES (10,'DLA','Departamento de Letras e Artes');


INSERT INTO TBL_DOCENTE VALUES (1,'Álvaro Vinícius de Souza Coelho',5);
INSERT INTO TBL_DOCENTE VALUES (2,'Antônio Henrique Figueira Louro',5);
INSERT INTO TBL_DOCENTE VALUES (3,'Aprígio Augusto Lopes Bezerra',5);
INSERT INTO TBL_DOCENTE VALUES (4,'César Alberto Bravo Pariente',5);
INSERT INTO TBL_DOCENTE VALUES (5,'Dany Sanchez Dominguez',5);
INSERT INTO TBL_DOCENTE VALUES (6,'Edgar Alexander',5);
INSERT INTO TBL_DOCENTE VALUES (7,'Esbel Tomás Valero Orellana',5);
INSERT INTO TBL_DOCENTE VALUES (8,'Felix Mas Milian',5);
INSERT INTO TBL_DOCENTE VALUES (9,'Francisco Bruno Souza Oliveira',5);
INSERT INTO TBL_DOCENTE VALUES (10,'Hamilton José Brumatto',5);
INSERT INTO TBL_DOCENTE VALUES (11,'Hélder Conceição Almeida',5);
INSERT INTO TBL_DOCENTE VALUES (12,'Jauberth Weyll Abijaude',5);
INSERT INTO TBL_DOCENTE VALUES (13,'Jorge Lima de Oliveira Filho',5);
INSERT INTO TBL_DOCENTE VALUES (14,'José Alfredo Santos de Souza',5);
INSERT INTO TBL_DOCENTE VALUES (15,'Leard de Oliveira Fernandes',5);
INSERT INTO TBL_DOCENTE VALUES (16,'Lilia Marta Brandão Soussa Modesto',5);
INSERT INTO TBL_DOCENTE VALUES (17,'Luciano Ângelo de Souza Bernardes',5);
INSERT INTO TBL_DOCENTE VALUES (18,'Marcelo Hage Fialho',5);
INSERT INTO TBL_DOCENTE VALUES (19,'Marcelo Ossamu Honda',5);
INSERT INTO TBL_DOCENTE VALUES (20,'Marta Magda Dornelles',5);
INSERT INTO TBL_DOCENTE VALUES (21,'Martha Ximena Torres Delgado',5);
INSERT INTO TBL_DOCENTE VALUES (22,'Mathias Santos de Brito',5);
INSERT INTO TBL_DOCENTE VALUES (23,'Paulo André Sperandio Giacomin',5);
INSERT INTO TBL_DOCENTE VALUES (24,'Paulo Eduardo Ambrósio',5);
INSERT INTO TBL_DOCENTE VALUES (25,'Paulo Sávio da Silva Costa',5);
INSERT INTO TBL_DOCENTE VALUES (26,'Péricles de Lima Sobreira',5);
INSERT INTO TBL_DOCENTE VALUES (27,'Sérgio Fred Ribeiro Andrade',5);
INSERT INTO TBL_DOCENTE VALUES (28,'Susana Marrero Iglesias',5);
INSERT INTO TBL_DOCENTE VALUES (29,'Vânia Cordeiro da Silva',5);

INSERT INTO TBL_DOCENTE VALUES (30,'Adriana dos Santos Reis Lemos',2);	
INSERT INTO TBL_DOCENTE VALUES (31,'Alfredo Dib Abdul Nour',2);
INSERT INTO TBL_DOCENTE VALUES (32,'Almeciano José Maia Júnior',2);

