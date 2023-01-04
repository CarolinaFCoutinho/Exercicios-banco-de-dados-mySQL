/*Quest�o 1 */

create function info_professor (professor varchar(20))
	returns text
	language sql as 
	$$
	select concat('Professor: ', name,', Curso: ', course.title,
	', Pr�dio: ', instructor.dept_name,', Sala: ', room_number,
	', Semestre: ', section.semester, ', Ano: ', year) from ((instructor natural join teaches)
	natural join section) natural left outer join course where course.title is not null
	and instructor.name = professor;
	$$;

select * from info_professor('Kean');

/*Quest�o 2 
 * Nesta quest�o eu n�o consegui criar um histograma em um procedimento, 
 * ent�o pesquisei e a fun��o mais proxima de um histograma que achei foi o NTILE,
 * que separa os salarios em "buckets", por�m n�o consegui fazer um count e order by neles.*/
SELECT 
	salary, count(ID),
	NTILE(6) OVER(
		ORDER BY salary
	) buckets
FROM
	instructor group by salary;

/*Quest�o 3 Tamb�m n�o consegui terminar esta quest�o, o codigo abaixo
 * est� dando syntax error*/

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

