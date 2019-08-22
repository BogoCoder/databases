delete from curso2 where nombre like '%4';
create table cursoall
  (curso_cod varchar (7),
  nombre varchar (50),
  nombre_unid varchar (20),
  creditos numeric (2,0),
  primary key (curso_cod),
  foreign key (nombre_unid) references unid_acad);

--3a
insert into cursoall select * from curso;

--3b
insert into cursoall select * from curso2 except select * from curso;

--4a
update unid_acad set presupuesto = presupuesto*1.03;

--4b
update unid_acad set presupuesto = (select min(presupuesto) from unid_acad);

--5
create view resum 

