/*EX 1*/
select instructor.ID, name, count(sec_id) from instructor 
natural left outer join teaches group by instructor.ID;
/*EX 2*/
select ID, name,(select count(*) from teaches T where T.id= I.id) 
as nsecoes from instructor I order by name, ID;
/*EX 3*/
select course_id, sec_id, ID, coalesce(name, '-') from teaches t natural left outer join instructor 
where semester = 'Spring' and year = 2010 order by name, course_id, sec_id;






