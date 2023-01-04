/*Q1*/

create domain pointscheck as numeric(4,2) check (VALUE >= 0 and VALUE < 10);

alter table grade_points alter column points type pointscheck using points::pointscheck;

/*Q2*/

create type grad_num as enum ('F ', 'C-', 'C ', 'C+', 'B-', 'B ', 'B+', 'A-', 'A ', 'A+');

alter table takes alter column grade type grad_num using grade::grad_num;

alter table grade_points alter column grade type grad_num using grade::grad_num;

/*Q3*/

create type endereco as (
	tipo_logradouro varchar(50),
	nome_logradouro varchar(50),
	numero int,
	complemento varchar(80),
	bairro varchar(50),
	cidade varchar(50),
	UF varchar(2),
	CEP varchar(8)
);


create table pessoas (
	CPF varchar(11),
	nome varchar (50),
	data_nasc date,
	enderecos endereco array[3],
	primary key (CPF)
);

insert into pessoas 
values ('12312312312', 'José', '1999-01-08','{"(\"rua\",\"rua\",11,\"casa\",\"Sé\",\"São Paulo\",\"SP\",\"12312312\")"}');

insert into pessoas 
values ('45645645645', 'Carol', '2000-08-25',
'{"(\"avenida\",\"avenida\",45,\"casa\",\"Centro\",\"Minas\",\"MG\",\"45645645\")" , 
"(\"avenida\",\"avenida\",48,\"casa\",\"Centro\",\"Minas\",\"MG\",\"45645645\")"}');

insert into pessoas 
values ('78978978978', 'Felipe', '1995-03-13',
'{"(\"praça\",\"praça\",59,\"\",\"Barra\",\"Rio\",\"RJ\",\"78978978\")" , 
"(\"praça\",\"praça\",48,\"\",\"Barra\",\"Rio\",\"RJ\",\"78978978\")" , 
"(\"praça\",\"praça\",48,\"\",\"Barra\",\"Rio\",\"RJ\",\"78978978\")"}');

select nome, (enderecos[1]).nome_logradouro,(enderecos[2]).nome_logradouro,(enderecos[3]).nome_logradouro from pessoas;

select CPF, nome, data_nasc, enderecos[1], enderecos[2], enderecos[3] from pessoas;

/*Q4*/

create table carros(
	placa varchar(7),
	marca varchar(30),
	modelo varchar(30),
	ano varchar(4));

create table carro_eletrico(
	cap_bateria int
) inherits (carros);

insert into carros values('FRD4564', 'Ford', 'Ford F','1948');
insert into carros values('CRL7897', 'Toyota', 'Corolla','1966');
insert into carro_eletrico values('TSL1231','Tesla','Modelo s', '2016', 75);

select * from carro_eletrico;
select * from carros;
select * from only carros;


