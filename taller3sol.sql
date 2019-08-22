delete from curso2 where nombre like '%4';
create table cursoall
  (curso_cod varchar (7),
  nombre varchar (50),
  nombre_unid varchar (20),
  creditos numeric (2,0),
  primary key (curso_cod),
  foreign key (nombre_unid) references unid_acad);

insert into cursoall select * from curso;
insert into cursoall select * from curso2 except select * from curso;
