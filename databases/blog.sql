-- 1. Crear una base de datos llamada blog.
-- create database blog;

-- 2. Crear las tablas indicadas de acuerdo al modelo de datos.
drop table if exists usuarios cascade;
create table usuarios (
	--nombre_columna tipo_dato 
	id serial not null primary key,
	email varchar (255) not null
);

drop table if exists post cascade;
create table post (
	id serial not null primary key,
	usuario_id integer not null,
	titulo varchar (255) not null,
	fecha date not null,
	foreign key (usuario_id) references usuarios(id)
);

drop table if exists comentarios;
create table comentarios (
	id serial not null primary key,
	usuario_id integer not null,
	post_id integer not null,
	texto varchar (255) not null,
	fecha date not null,
	foreign key (usuario_id) references usuarios(id),
	foreign key (post_id) references post(id)
);


-- 3. Insertar los siguientes registros.
-- \copy usuarios from 'usuarios.csv' csv header;
-- \copy post from 'post.csv' csv header;
-- \copy comentarios from 'comentarios.csv' csv header;

--4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5.
select usuarios.email, post.id, post.titulo from usuarios
join post on usuarios.id = post.usuario_id
where usuarios.id =5;

-- 5. Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el usuario con email usuario06@hotmail.com.
select usuarios.email, comentarios.id, comentarios.texto from comentarios
join usuarios on usuarios.id=comentarios.usuario_id
where usuarios.email != 'usuario06@hotmail.com';

-- 6. Listar los usuarios que no han publicado ningún post.
select usuarios.id, usuarios.email as usuarios from usuarios
full outer join post on usuarios.id = post.usuario_id
where post.usuario_id is null;

-- 7. Listar todos los post con sus comentarios (incluyendo aquellos que no poseen comentarios).
select post.titulo, comentarios.texto from post
left join comentarios on comentarios.post_id = post.id;

-- 8. Listar todos los usuarios que hayan publicado un post en Junio.
select distinct usuarios.email as usuarios from usuarios
join post on usuarios.id = post.usuario_id
where post.fecha >= '2020-06-01' and post.fecha <= '2020-06-30';



