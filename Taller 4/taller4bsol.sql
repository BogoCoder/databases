--2
with recursive etapas_post(prodid, etapaid, posterior) as (
	select prodid, etapaid, posterior
	from etapaproceso
	UNION
	select etapaproceso.prodid, etapaproceso.etapaid, etapas_post.posterior
	from etapaproceso, etapas_post
	where etapaproceso.prodid = etapas_post.prodid 
	and etapaproceso.etapaid < etapas_post.etapaid
	)
select * from etapas_post order by prodid, etapaid,posterior;

--3
create or replace function maxVentas() 
returns table(prodid numeric(4,0), fecha date, volventas numeric(4,0))
as
$$
BEGIN
	return query
	(select * from ventasdiarias order by volventas DESC limit 5);

END;
$$
language 'plpgsql' STABLE;

--4

select prodid, max(volventas) over (partition by prodid) as maxtot, 
ntile(4) over (partition by prodid order by (volventas) asc) as cuartil, 
percentile_disc(array[0.25,0.5,0.75,1]) within group(order by prodid,volventas) from ventasdiarias;

create or replace function quartil() 
returns table(prodid numeric(4,0), fecha date, volventas numeric(4,0))
as
$$
BEGIN
	return query
	(select * from ventasdiarias order by volventas DESC limit 5);

END;
$$
language 'plpgsql' STABLE;