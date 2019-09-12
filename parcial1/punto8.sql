--8

create or replace function maxLang()
returns trigger as $$
begin
	if (select sum(percentage) from countrylanguage 
		where countrycode = new.countrycode) > 100
	then
		raise exception 'The country already has 100 percent of spoken languages.';
	end if;
	return new;
end;
$$
language 'plpgsql';

create trigger maxLang
after insert on countrylanguage
for each row
execute procedure maxLang();

