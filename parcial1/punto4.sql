--4
select city.name as city_name, country.name as country_name, country.population as country_pop, city.population as city_pop,
cast (cast(city.population as float)/cast(country.population as float) as float(3)) as fraction_pop from city join country on city.countrycode = country.code
order by fraction_pop desc;

