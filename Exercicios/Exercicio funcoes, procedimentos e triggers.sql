/*Questão 1 */

create function info_professor (professor varchar(20))
	returns text
	language sql as 
	$$
	select concat('Professor: ', name,', Curso: ', course.title,
	', Prédio: ', instructor.dept_name,', Sala: ', room_number,
	', Semestre: ', section.semester, ', Ano: ', year) from ((instructor natural join teaches)
	natural join section) natural left outer join course where course.title is not null
	and instructor.name = professor;
	$$;

select * from info_professor('Kean');

/*Questão 2 
 * Nesta questão eu não consegui criar um histograma em um procedimento, 
 * então pesquisei e a função mais proxima de um histograma que achei foi o NTILE,
 * que separa os salarios em "buckets", porém não consegui fazer um count e order by neles.*/
SELECT 
	salary, count(ID),
	NTILE(6) OVER(
		ORDER BY salary
	) buckets
FROM
	instructor group by salary;

/*Questão 3 Também não consegui terminar esta questão, o codigo abaixo
 * está dando syntax error*/

create function ftrigger_A()
returns trigger
	language 'plpgsql' as $$
		begin
			 new.teaches = null;
		end
	$$;

create trigger trigger_A
	after insert of semester on teaches
	for each row 
		when (new.semester = old.semester)
	execute function ftrigger_A();

