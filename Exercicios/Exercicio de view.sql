/*Carolina de Faria Coutinho PT3009718*/
/*Ex 1*/
create view notas_aluno as (select id,name,to_char(sum(credits*points) / sum(credits), '999D9') as CR
from (((takes natural join section) natural join course) natural join grade_points)
natural join student s group by id,name order by name);
/*Baseando-se na consulta da Quest�o 4 da atividade anterior, 
para calcular o CR do aluno eu dividi a soma dos (cr�ditos * pontos) pela soma dos cr�ditos dos cursos
realizados pelos alunos*/

