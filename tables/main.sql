drop table TBL_REFERENCES, TBL_TESTE; 
drop sequence SEQ_TST_ID;

create sequence SEQ_TST_ID 
start with 1 increment by 1 no minvalue no maxvalue cache 1;

create table TBL_TESTE (
	TST_COD numeric (4,0),
	TXT_DES varchar(50) not null,
	TXT_SEX char(1) not null check(TXT_SEX in ('F', 'M')),
	TST_SAL numeric(12,2) not null,
	TST_CPF numeric(15,0) not null unique,
	TST_DTA DATE null
);

alter table TBL_TESTE
add constraint TST_COD_PK primary key(TST_COD),
alter column TST_COD set default nextval('SEQ_TST_ID'::REGCLASS),
add constraint TST_COD_CHECK check(TST_COD between 1 and 9999);

create table TBL_REFERENCES (
	REF_COD numeric (4,0) primary key,
	REF_DES varchar(50),
	REF_TST_COD numeric(4,0)
);

alter table TBL_REFERENCES
add constraint REF_FK_TST foreign key (REF_TST_COD) references tbl_teste(TST_COD);


insert into TBL_TESTE (TXT_DES, TXT_SEX, TST_SAL, TST_CPF, TST_DTA)
values ('A', 'M', 1100, 10010010010, to_date('23/04/2017', 'DD/MM/YYYY'));

insert into TBL_TESTE (TXT_DES, TXT_SEX, TST_SAL, TST_CPF, TST_DTA)
values ('B', 'F', 1200, 20020020020, to_date('23/04/2017', 'DD/MM/YYYY'));

insert into TBL_TESTE (TXT_DES, TXT_SEX, TST_SAL, TST_CPF, TST_DTA)
values ('C', 'F', 2200, 30030030030, CURRENT_DATE);

alter table TBL_TESTE
add column TST_NOM varchar(50) null,
add column TST_REG char(2);

