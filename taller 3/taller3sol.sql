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
update unid_acad set presupuesto = (select min(presupuesto) from unid_acad) from examen;



--5
create view resum as select avg(presupuesto), min(presupuesto), max(presupuesto), stddev(presupuesto) from unid_acad;

--6
create view resumenGruposUnidad as select unid_acad.nombre_unid, nombre, grupo_cod, ano, semestre from unid_acad left outer join (curso natural join grupo) as A on unid_acad.nombre_unid = A.nombre_unid;

--6a
insert into grupo values('003', '1', '1', 2018);
insert into grupo values('003', '2', '1', 2018);

--6b
select * from resumenGruposUnidad;

--7
create materialized view instructorUbic as select nombres, apellidos, nombre_unid from instructor; 

--7a
insert into instructor values('6', 'Edgar', 'Andrade', 'MACC', 200);

--7bd
select * from instructorUbic;

--7c
refresh materialized view instructorUbic;

--8a
BEGIN;
update unid_acad set presupuesto = presupuesto + (select avg(presupuesto) from unid_acad) where presupuesto = (select min(presupuesto) from unid_acad);
END;

--8b
BEGIN;
update unid_acad set presupuesto = presupuesto + (select min(presupuesto) from unid_acad) where presupuesto = (select max(presupuesto) from unid_acad);
COMMIT;

--9a
alter table curso
add constraint nombre_unique unique (nombre);

--9b
create table examen (examen_cod varchar(7), curso_nombre varchar(20), fecha date NOT NULL, hora_inicio time default '00:00:00', hora_fin time default '00:00:00', primary key(examen_cod), foreign key(curso_nombre) references curso(nombre) on delete cascade on update cascade);

--9c
insert into examen values('000', 'programacion', '2-9-2019', '13:00:00', '15:00:00');
insert into examen values('001', 'arquitectura', '7-9-2019', '09:00:00', '11:00:00');
insert into examen values('002', 'laboratorio', '2-10-2019', '09:00:00', '11:00:00');

--9d
create view duracionExamenes as select curso_nombre, date_part('hour', hora_inicio) as hora_inicio, date_part('hour', hora_fin)-date_part('hour', hora_inicio) as duracion from examen;

--10
create domain credito int constraint no_negative check (value >= 0);
ALTER TABLE curso
ALTER COLUMN creditos type credito;

--11
create user ramon with password 'ramon';
grant select on unid_acad to ramon;
create user planeacion password 'planeacion';
grant insert (nombre_unid, edificio, presupuesto) on unid_acad to ramon,planeacion;
revoke insert (nombre_unid, edificio, presupuesto) on unid_acad from planeacion;
revoke select on unid_acad from ramon;