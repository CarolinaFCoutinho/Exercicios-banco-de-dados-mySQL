/*Carolina de Faria Coutinho PT3009718*/
/*Ex11*/
create user User_A;
create user User_B;
create user User_C;
create user User_D;
create user User_E;

/*Ex12a Privilégios do User_A, escolhi todas as relações exceto CLASSROOM*/
grant select, update on department, course, instructor, section,
teaches, student, takes, advisor, time_slot, prereq, grade_points to User_A with grant option;

/*Ex12b Este comando seleciona todas as tabelas publicas do DB University usando os valores da
tabela information_schema.TABLES exceto CLASSROOM*/
select table_name from information_schema.tables 
where table_schema = 'public' and table_type = 'BASE TABLE'
except 
select table_name from information_schema.tables 
where (table_name = 'classroom');

/*Ex12c Privilégios do User_A*/
SELECT grantee, table_name, column_name,privilege_type,is_grantable
FROM information_schema.column_privileges
WHERE grantee = 'user_a';

/*Ex12d Privilégios do User_B (exceto salary e grade)*/
grant select (ID, name, dept_name)
on INSTRUCTOR to User_B;
grant select (ID, course_id, sec_id, semester, year)
on Takes to User_B;

/*Ex12e Privilégios do User_C*/
grant select, update (course_id,sec_id,semester,year)
on section to User_C;

/*Ex12f Privilégios do User_D*/
grant select on instructor, student to User_D;
grant update on grade_points to User_D;

/*Ex12g Criando uma View para o User_E*/
create view civil_eng_students as
(select *
from student
where dept_name = 'Civil Eng.');
grant select on civil_eng_students to User_E;

/*Ex12h Revogue os privilégios do User_E*/
revoke all
on civil_eng_students from User_E;

/*Ex12i Mostre os privilégios concedidos a todos usuários*/
SELECT grantee, table_name,column_name,privilege_type,is_grantable
FROM information_schema.column_privileges where 
grantee like 'user_%' order by grantee;

/*Ex12j Não entendi muito bem esta questão, usei um join entre as tabelas 
 information_schema.column_privileges e pg_shadow*/
SELECT pg_shadow.usename, table_name, column_name,privilege_type,is_grantable
FROM information_schema.column_privileges join pg_shadow on 
pg_shadow.usename = information_schema.column_privileges.grantee where pg_shadow.usename 
like 'user_%' order by pg_shadow.usename;
