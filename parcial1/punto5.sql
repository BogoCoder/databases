--5
select country.name as country_name, 
countrylanguage.language as country_off_lang 
from country left outer join countrylanguage
on country.code = countrylanguage.countrycode 
and countrylanguage.isofficial = TRUE;
