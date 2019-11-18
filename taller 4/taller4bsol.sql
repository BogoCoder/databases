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


create or replace function quartil() 
returns table(prodid numeric(4,0), cuartil int, max_cuartil numeric, max_tot numeric)
as
$$
BEGIN
	return query
	(select distinct A.prodid, A.cuartil, max(volventas) over (partition by A.prodid,A.cuartil) 
	 as max_cuartil, A.max_tot from (select ventasdiarias.prodid, ventasdiarias.volventas, max(volventas) over (partition by ventasdiarias.prodid) as max_tot, 
	ntile(4) over (partition by ventasdiarias.prodid order by (volventas) asc) as cuartil from ventasdiarias) as A order by prodid);
	
END;
$$
language 'plpgsql' STABLE;

--5

