-- 1. Crear una base de datos llamada películas.
drop table if exists peliculas cascade;
create table peliculas (
	id serial not null primary key,
	pelicula varchar (255) not null,
	anio_estreno integer not null,
	director varchar (255) not null
);
 
drop table if exists reparto;
create table reparto (
	pelicula_id integer not null,
	actor varchar(255) not null,
	foreign key (pelicula_id) references peliculas
);

-- 2. Cargar ambos archivos a su tabla correspondiente. (comentado por incompatibilidad en pgAdmin)

-- \copy peliculas from 'peliculas.csv' csv header;
-- \copy reparto from 'reparto.csv' csv header;

-- 3. Obtener el ID de la película “Titanic”.
select * from peliculas where pelicula='Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic".
select reparto.actor as "Actores Titanic" from reparto where pelicula_id=2;

--5. Consultar en cuántas películas del top 100 participa Harrison Ford.
select count(actor) from reparto where actor='Harrison Ford';

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
select peliculas.pelicula, peliculas.anio_estreno from peliculas where anio_estreno between 1990 and 1999 order by anio_estreno asc;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
select pelicula, length(pelicula) as "longitud_titulo" from peliculas;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
select pelicula, char_length(pelicula) as longitud_titulo from peliculas order by longitud_titulo desc limit 1;
