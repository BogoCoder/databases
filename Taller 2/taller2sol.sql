(select * from curso UNION all select * from curso2) order by curso_cod;
(select * from curso UNION select * from curso2) order by curso_cod;
(select * from curso INTERSECT select * from curso2) order by curso_cod;
(select * from curso EXCEPT select * from curso2) order by curso_cod;
(select * from curso2 EXCEPT select * from curso) order by curso_cod;
(select * from curso UNION select * from curso2) EXCEPT (select * from curso INTERSECT select * from curso2) order by curso_cod;

select * from (grupo natural join curso) natural join dicta;

select curso_cod, inst_id from (grupo natural join curso) natural join dicta;
select nombre, inst_id from (grupo natural join curso) natural join dicta;
select nombre, nombres, apellidos from ((grupo natural join curso) natural join dicta) natural join instructor;
select avg(creditos) from curso where nombre_unid = 'MACC';
select nombre_unid, avg(creditos) as creditos_unid from curso group by nombre_unid;
select nombre_unid, avg(creditos) as creditos_unid from curso group by nombre_unid order by nombre_unid;
select nombre_unid, avg(creditos) as creditos_unid from curso group by nombre_unid having avg(creditos)<=4.0 order by nombre_unid;
select nombre_unid, avg(salario) as salario_avg, max(salario) as salario_max, min(salario) as salario_min from instructor group by nombre_unid;