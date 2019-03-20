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

INSERT INTO TBL_DEPTO VALUES (1,'DCAA','Departamento de Ci�ncias Agr�rias e Ambientais');
INSERT INTO TBL_DEPTO VALUES (2,'DCAC','Departamento de Administra��o e Ci�ncias Cont�beis');
INSERT INTO TBL_DEPTO VALUES (3,'DCB','Departamento de Ci�ncias Biol�gicas');
INSERT INTO TBL_DEPTO VALUES (4,'DCEC','Departamento de Ci�ncias Econ�micas');
INSERT INTO TBL_DEPTO VALUES (5,'DCET','Departamento de Ci�ncias Exatas e Tecnol�gicas');
INSERT INTO TBL_DEPTO VALUES (6,'DCIE','Departamento de Ci�ncias da Educa��o');
INSERT INTO TBL_DEPTO VALUES (7,'DCS',	'Departamento de Ci�ncias da Sa�de');
INSERT INTO TBL_DEPTO VALUES (8,'DCIJUR','Departamento de Ci�ncias Jur�dicas');
INSERT INTO TBL_DEPTO VALUES (9,'DFCH','Departamento de Filosofia e Ci�ncias Humanas');
INSERT INTO TBL_DEPTO VALUES (10,'DLA','Departamento de Letras e Artes');


INSERT INTO TBL_DOCENTE VALUES (1,'�lvaro Vin�cius de Souza Coelho',5);
INSERT INTO TBL_DOCENTE VALUES (2,'Ant�nio Henrique Figueira Louro',5);
INSERT INTO TBL_DOCENTE VALUES (3,'Apr�gio Augusto Lopes Bezerra',5);
INSERT INTO TBL_DOCENTE VALUES (4,'C�sar Alberto Bravo Pariente',5);
INSERT INTO TBL_DOCENTE VALUES (5,'Dany Sanchez Dominguez',5);
INSERT INTO TBL_DOCENTE VALUES (6,'Edgar Alexander',5);
INSERT INTO TBL_DOCENTE VALUES (7,'Esbel Tom�s Valero Orellana',5);
INSERT INTO TBL_DOCENTE VALUES (8,'Felix Mas Milian',5);
INSERT INTO TBL_DOCENTE VALUES (9,'Francisco Bruno Souza Oliveira',5);
INSERT INTO TBL_DOCENTE VALUES (10,'Hamilton Jos� Brumatto',5);
INSERT INTO TBL_DOCENTE VALUES (11,'H�lder Concei��o Almeida',5);
INSERT INTO TBL_DOCENTE VALUES (12,'Jauberth Weyll Abijaude',5);
INSERT INTO TBL_DOCENTE VALUES (13,'Jorge Lima de Oliveira Filho',5);
INSERT INTO TBL_DOCENTE VALUES (14,'Jos� Alfredo Santos de Souza',5);
INSERT INTO TBL_DOCENTE VALUES (15,'Leard de Oliveira Fernandes',5);
INSERT INTO TBL_DOCENTE VALUES (16,'Lilia Marta Brand�o Soussa Modesto',5);
INSERT INTO TBL_DOCENTE VALUES (17,'Luciano �ngelo de Souza Bernardes',5);
INSERT INTO TBL_DOCENTE VALUES (18,'Marcelo Hage Fialho',5);
INSERT INTO TBL_DOCENTE VALUES (19,'Marcelo Ossamu Honda',5);
INSERT INTO TBL_DOCENTE VALUES (20,'Marta Magda Dornelles',5);
INSERT INTO TBL_DOCENTE VALUES (21,'Martha Ximena Torres Delgado',5);
INSERT INTO TBL_DOCENTE VALUES (22,'Mathias Santos de Brito',5);
INSERT INTO TBL_DOCENTE VALUES (23,'Paulo Andr� Sperandio Giacomin',5);
INSERT INTO TBL_DOCENTE VALUES (24,'Paulo Eduardo Ambr�sio',5);
INSERT INTO TBL_DOCENTE VALUES (25,'Paulo S�vio da Silva Costa',5);
INSERT INTO TBL_DOCENTE VALUES (26,'P�ricles de Lima Sobreira',5);
INSERT INTO TBL_DOCENTE VALUES (27,'S�rgio Fred Ribeiro Andrade',5);
INSERT INTO TBL_DOCENTE VALUES (28,'Susana Marrero Iglesias',5);
INSERT INTO TBL_DOCENTE VALUES (29,'V�nia Cordeiro da Silva',5);

INSERT INTO TBL_DOCENTE VALUES (30,'Adriana dos Santos Reis Lemos',2);	
INSERT INTO TBL_DOCENTE VALUES (31,'Alfredo Dib Abdul Nour',2);
INSERT INTO TBL_DOCENTE VALUES (32,'Almeciano Jos� Maia J�nior',2);

