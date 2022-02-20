drop table if exists autores cascade;
create table autores (
	codigo serial not null primary key,
	nombre varchar (255) not null,
	apellido varchar (255) not null,
	anio_nacimiento integer not null,
	anio_muerte integer
);

drop table if exists calles cascade;
create table calles(
	id serial primary key not null,
	nombre_calle varchar(255) not null
);

drop table if exists comunas cascade;
create table comunas(
	id serial primary key not null,
	nombre_comuna varchar(255) not null
);

drop table if exists socios cascade;
create table socios (
	rut varchar (255) not null primary key,
	nombre varchar (255) not null,
	apellido varchar (255) not null,
	id_calle integer not null references calles(id),
	id_comuna integer not null references comunas(id),
	telefono integer not null
);

drop table if exists libros cascade;
create table libros(
	isbn bigint not null primary key,
	titulo varchar (255) not null,
	num_paginas integer not null
);

drop table if exists tipo_autores;
create table tipo_autores (
	cod_libro bigint not null,
	cod_autor integer not null,
	escritor_principal boolean not null default true,
	primary key (cod_libro, cod_autor),
	foreign key (cod_libro) references libros(isbn),
	foreign key (cod_autor) references autores(codigo)
);

drop table if exists prestamos cascade;
create table prestamos (
	id serial primary key not null,
	codigo_libro bigint not null references libros(isbn),
	socio_rut varchar (255) not null references socios(rut),
	fecha_inicio date not null,
	fecha_esperada date not null,
	fecha_entrega date not null
);

insert into calles (nombre_calle)
values
	('AVENIDA 1'),
	('AVENIDA 2'),
	('AVENIDA 3'),
	('PASAJE 2'),
	('PASAJE 3')
;

insert into comunas (nombre_comuna) values ('SANTIAGO');

insert into socios (rut,nombre,apellido,id_calle,id_comuna,telefono)
values
	('1111111-1','JUAN','SOTO',1,1,911111111),
	('2222222-2','ANA','PEREZ',4,1,922222222),
	('3333333-3','SANDRA','AGUILAR',2,1, 933333333),
	('4444444-4','ESTEBAN','JEREZ',3,1,944444444),
	('5555555-5','SILVANA','MUNOZ',5,1,955555555)
;

insert into libros (isbn,titulo,num_paginas)
values
	(1111111111111,'CUENTOS DE TERROR',344),
	(2222222222222,'POESIAS CONTEMPORANEAS',167),
	(3333333333333,'HISTORIA DE ASIA',511),
	(4444444444444,'MANUAL DE MECANICA',298)
;

insert into autores (nombre,apellido,anio_nacimiento,anio_muerte)
values
	('ANDRES','ULLOA',1982,null),
	('SERGIO','MARDONES',1950,2012),
	('JOSE','SALGADO',1968,2020),
	('ANA','SALGADO',1972,null),
	('MARTIN','PORTA',1976,null)
;

insert into tipo_autores (cod_libro,cod_autor,escritor_principal)
values
	(1111111111111,3,true),
	(1111111111111,4,false),
	(2222222222222,1,true),
	(3333333333333,2,true),
	(4444444444444,5,true)
;

insert into prestamos (codigo_libro,socio_rut,fecha_inicio,fecha_esperada,fecha_entrega)
values
	(1111111111111,'1111111-1','2020-01-20','2020-01-27','2020-01-27'),
	(2222222222222,'5555555-5','2020-01-20','2020-01-27','2020-01-30'),
	(3333333333333,'3333333-3','2020-01-22','2020-02-05','2020-01-30'),
	(4444444444444,'4444444-4','2020-01-23','2020-02-06','2020-01-30'),
	(1111111111111,'2222222-2','2020-01-27','2020-02-03','2020-02-04'),
	(4444444444444,'1111111-1','2020-01-31','2020-02-14','2020-02-12'),
	(2222222222222,'3333333-3','2020-01-31','2020-02-07','2020-02-12')
;

-- a) Mostrar todos los libros que posean menos de 300 páginas.

select titulo,num_paginas from libros where num_paginas <300;
	
-- b) Mostrar todos los autores que hayan nacido después del 01-01-1970.

select nombre,apellido,anio_nacimiento from autores where anio_nacimiento>1970;

-- c) ¿Cuál es el libro más solicitado?

select prestamos.codigo_libro as ISBN, count(prestamos.codigo_libro) as pedidos, libros.titulo
from  libros join prestamos on libros.isbn = prestamos.codigo_libro
group by prestamos.codigo_libro, libros.titulo
having count(prestamos.codigo_libro) >1
order by libros.titulo;

-- d) Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto
--    debería pagar cada usuario que entregue el préstamo después de 7 días.

select socios.nombre,socios.apellido,socio_rut as rut,(fecha_entrega-fecha_esperada)*100 as multa from prestamos
join socios on prestamos.socio_rut=socios.rut 
where (fecha_entrega-fecha_esperada)>0;

