use student;
#a
SELECT last_name, first_name 
FROM student 
WHERE upper(left(first_name, 1)) LIKE upper(left(last_name, 1));

#b
SELECT upper(left(first_name,1)), COUNT(*) as count
FROM student
group by upper(left(first_name,1))
order by(upper(left(first_name,1)));

#c
SELECT CASE WHEN SUM(sub.c) IS NULL THEN 0 ELSE SUM(sub.c) END as count 
FROM (SELECT first_name, count(first_name) as c
    FROM student GROUP BY first_name ) sub WHERE sub.c > 1;
    
#d
select first_name,last_name 
from student 
where birth_date < (select avg(birth_date) from student);