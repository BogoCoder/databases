--2
select nombre_item, marca, sum(cantidad) as unid_vend, count(nombre_item) as count_reg from ventas group by nombre_item, marca;

--3
select nombre_item, marca, sum(cantidad) as unid_vend, count(nombre_item) as count_reg from ventas group by cube(nombre_item, marca);

--4
select nombre_item, marca, segmento, sum(cantidad) as unid_vend, count(nombre_item) as count_reg from ventas group by cube(nombre_item, marca, segmento);

select nombre_item, marca, segmento, sum(cantidad) as unid_vend, count(nombre_item) as count_reg from ventas group by grouping sets((nombre_item, marca, segmento));

--5
select nombre_item, marca, segmento, talla, sum(cantidad) as unid_vend, count(nombre_item) as count_reg from ventas group by cube(nombre_item, marca, segmento, talla);

select nombre_item, marca, segmento, talla, sum(cantidad) as unid_vend, count(nombre_item) as count_reg from ventas group by grouping sets((nombre_item, marca), (segmento, talla));

select nombre_item, marca, segmento, talla, sum(cantidad) as unid_vend, count(nombre_item) as count_reg from ventas group by grouping sets((nombre_item),(marca, segmento, talla));

select nombre_item, marca, segmento, talla, sum(cantidad) as unid_vend, count(nombre_item) as count_reg from ventas group by rollup(nombre_item, marca, segmento, talla);

--6

\copy ventas to '/home/lovelace/Documents/Sam/databases-master/Taller 5/ventas.csv' delimiter ',' csv header
