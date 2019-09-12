--6

create view ElisabethIdiomas as
select lang, countries from (select distinct
countrylanguage.language as lang,
count(country.name) 
over (partition by countrylanguage.language)
as countries
from country join countrylanguage
on country.code = countrylanguage.countrycode
and country.headofstate='Elisabeth II' 
order by countries desc) as A where countries >= 2;
