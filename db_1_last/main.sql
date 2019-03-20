DROP TABLE t_user, t_person, t_document, t_network CASCADE;
DROP SEQUENCE s_user_id, s_document_id CASCADE;

CREATE TABLE t_network (
	class VARCHAR
);
CREATE TABLE t_user (
	id NUMERIC,
	login VARCHAR UNIQUE,
	password VARCHAR
);

ALTER TABLE t_user 
ADD CONSTRAINT user_id primary key(id);


CREATE TABLE t_person (
	cnpj VARCHAR(18),
	name VARCHAR,
	fantasy_name VARCHAR
) INHERITS (t_user);

CREATE TABLE t_document (
	id NUMERIC,
	person_id NUMERIC,
	title VARCHAR,
	hash_name VARCHAR
);

ALTER TABLE t_document
ADD CONSTRAINT document_id primary key(id),
ADD CONSTRAINT person_id_fk FOREIGN KEY(person_id) REFERENCES t_person(id);

CREATE SEQUENCE s_user_id;
SELECT SETVAL('s_user_id', 1);

CREATE SEQUENCE s_document_id;
SELECT SETVAL('s_document_id', 1);

ALTER TABLE t_user
ALTER COLUMN id SET DEFAULT nextval('s_user_id');

ALTER TABLE t_document
ALTER COLUMN id SET DEFAULT nextval('s_document_id');

CREATE OR REPLACE VIEW v_person AS 
SELECT TO_CHAR(id, '9999'), login, cnpj, name, fantasy_name FROM t_person;

CREATE OR REPLACE VIEW v_document AS 
SELECT TO_CHAR(id, '9999') as id, TO_CHAR(person_id, '9999') as person_id, title, hash_name FROM t_document;
