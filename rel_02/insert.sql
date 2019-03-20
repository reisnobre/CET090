BEGIN;
DELETE FROM paises;
INSERT INTO paises (COD, ID, NOM) VALUES ('AND',20,'Andorra');
INSERT INTO paises (COD, ID, NOM) VALUES ('ARE',784,'Emiratos Árabes Unidos');
INSERT INTO paises (COD, ID, NOM) VALUES ('AFG',4,'Afeganistão');
INSERT INTO paises (COD, ID, NOM) VALUES ('ATG',28,'Antigua e Barbuda');
INSERT INTO paises (COD, ID, NOM) VALUES ('AIA',660,'Anguilla');
INSERT INTO paises (COD, ID, NOM) VALUES ('ALB',8,'Albânia');
INSERT INTO paises (COD, ID, NOM) VALUES ('ARM',51,'Arménia');
INSERT INTO paises (COD, ID, NOM) VALUES ('ANT',530,'Antilhas Holandesas');
INSERT INTO paises (COD, ID, NOM) VALUES ('AGO',24,'Angola');
INSERT INTO paises (COD, ID, NOM) VALUES ('ATA',10,'Antárctida');
INSERT INTO paises (COD, ID, NOM) VALUES ('ARG',32,'Argentina');
INSERT INTO paises (COD, ID, NOM) VALUES ('ASM',16,'Samoa Americana');
INSERT INTO paises (COD, ID, NOM) VALUES ('AUT',40,'Áustria');
INSERT INTO paises (COD, ID, NOM) VALUES ('AUS',36,'Austrália');
INSERT INTO paises (COD, ID, NOM) VALUES ('ABW',533,'Aruba');
COMMIT;

BEGIN;
DELETE FROM UF cascade;
INSERT INTO UF (ID, UF, NOM) (SELECT * FROM state ORDER BY random() limit 10);
COMMIT;

BEGIN;
DELETE FROM CIDADE cascade;
INSERT INTO CIDADE (COD, UF_UF, NOM) (SELECT city_codigo, uf, city_descricao FROM uf LEFT JOIN city on (uf.id = city.state_codigo));
COMMIT;

BEGIN;
DELETE FROM CEP cascade;
INSERT INTO CEP (
	SELECT address_logradouro, neighborhood_descricao, address_cep::NUMERIC, city_codigo FROM neighborhood 
	LEFT JOIN cidade ON (neighborhood.city_codigo = cidade.cod) 
	LEFT JOIN address ON (neighborhood.neighborhood_codigo = address.neighborhood_codigo) limit 100
);
COMMIT;

-- INSERT INTO AREAS VALUES (1, 'Area 51', '73', )
