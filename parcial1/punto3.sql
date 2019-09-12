--3
select distinct governmentform, count(governmentform) over(partition by (governmentform)) as countries 
from country order by countries desc limit 5;

