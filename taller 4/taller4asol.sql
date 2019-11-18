--2
create trigger agregarGrupos 
after insert on grupo
for each row
execute procedure agregarGrupos();

create or replace function agregarGrupos()
returns trigger as $$
begin
	update curso 
		set num_grupos = num_grupos + 1 
		where curso_cod = new.curso_cod;
	return new;
end;
$$
language 'plpgsql';

create or replace function eliminarGrupos()
returns trigger as $$
begin
	update curso
		set num_grupos = num_grupos - 1 
		where curso_cod = old.curso_cod;
	return old;
end;
$$
language 'plpgsql';

create trigger eliminarGrupos
after delete on grupo
for each row
execute procedure eliminarGrupos();

--3

create or replace function agregarCargaCreditos()
returns trigger as $$
begin 
	update instructor
		set carga_creditos = carga_creditos + 
		(select creditos from (dicta natural join curso)
		where curso_cod = new.curso_cod and grupo_cod = new.grupo_cod)
		where inst_id = new.inst_id;
	return new;
end;
$$
language 'plpgsql';

create trigger agregarCargaCreditos
after insert on dicta
for each row
execute procedure agregarCargaCreditos();

create or replace function eliminarCargaCreditos()
returns trigger as $$
begin 
	update instructor
		set carga_creditos = carga_creditos - 
		(select creditos from dicta natural join curso
		where curso_cod = old.curso_cod and grupo_cod = old.grupo_cod)
		where inst_id = old.inst_id;
	return old;
end;
$$
language 'plpgsql';

create trigger eliminarCargaCreditos
after delete on dicta
for each row
execute procedure agregarCargaCreditos();

--4

create or replace function maxCargaCreditos()
returns trigger as $$
begin 
	if (select carga_creditos from instructor where inst_id = new.inst_id) > 18 then
		raise exception 'El instructor no puede tener una carga de mas de 18 creditos.';
	end if;
	return new;
end;
$$
language 'plpgsql';

create trigger maxCargaCreditos
after insert on dicta
for each row 
execute procedure maxCargaCreditos();

--5

insert into grupo values('000', '000', 2, '2019');
insert into grupo values('001', '000', 2, '2019');
insert into grupo values('002', '000', 2, '2019');
insert into grupo values('002', '001', 2, '2019');
insert into grupo values('002', '002', 2, '2019');
insert into grupo values('001', '002', 2, '2019');



insert into dicta values(1, '001', '000', 2, '2019');
insert into dicta values(1, '002', '000', 2, '2019');
insert into dicta values(1, '000', '000', 2, '2019');
insert into dicta values(1, '002', '001', 2, '2019');

insert into dicta values(1, '002', '002', 2, '2019');