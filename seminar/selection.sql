-- SELECTION, select rows
SELECT *
FROM bairro 
WHERE bairro_codigo < 10;

-- PROJECTIONS, select columns 
SELECT bairro_codigo, cidade_codigo, bairro_descricao 
FROM bairro 
WHERE bairro_codigo < 10;

-- RENAME, rename columns 
SELECT b.bairro_codigo, b.cidade_codigo, b.bairro_descricao 
FROM bairro as b
WHERE b.bairro_codigo < 10;

-- NATURAL JOIN,
SELECT *
FROM bairro
NATURAL JOIN cidade;

-- EQUI JOIN,
SELECT *
FROM bairro
JOIN cidade
ON (bairro.cidade_codigo = cidade.cidade_codigo);

-- RIGHT JOIN,
SELECT *
FROM bairro
RIGHT JOIN cidade
ON (bairro.cidade_codigo = cidade.cidade_codigo);

-- LEFT JOIN,
SELECT *
FROM bairro
LEFT JOIN cidade
ON (bairro.cidade_codigo = cidade.cidade);

-- INNER JOIN,
SELECT *
FROM bairro
INNER JOIN cidade
ON (bairro.cidade_codigo = cidade.cidade);

-- FULL JOIN,
SELECT *
FROM bairro
FULL JOIN cidade
ON (bairro.cidade_codigo = cidade.cidade);

-- AGGREGATION,
SELECT count(*)
FROM bairro;

-- CARTESIAN PRODUCT
SELECT *
FROM bairro, cidade;

-- UNION, bairros_a + bairros_b
SELECT *
FROM bairros_a
UNION ALL
FROM bairros_b;

-- EXCEPT, bairros_a - bairros_b
SELECT *
FROM bairros_a
EXCEPT
FROM bairros_b;

-- INTERSECT, bairros_a & bairros_b
SELECT *
FROM bairros_a
INTERSECT
FROM bairros_b;

-- UPDATE
UPDATE bairro 
SET bairro_descricao = 'BAHIA VELHA' WHERE bairro_descricao = 'BAHIA NOVA';
-- DELETE
DELETE FROM bairro 
WHERE bairro_descricao = 'BAHIA VELHA';
-- INSERT
INSERT INTO bairro (bairro_codigo, cidade_codigo, bairro_descricao)
VALUES (8, 16 'BAHIA NOVA');
