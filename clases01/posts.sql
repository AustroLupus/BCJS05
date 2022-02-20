drop table if exists post cascade;
create table post(
	id serial primary key,
	nombre_usuario varchar(255) not null,
	fecha_creacion date default now(),
	contenido varchar(255),
	descripcion varchar(255)
);

insert into post (nombre_usuario, contenido, descripcion) values ('Pamela', 'Hola','Hola mundo, este es el post n1');
insert into post (nombre_usuario, contenido, descripcion) values ('Pamela', 'Me despido','Despedida');
insert into post (nombre_usuario, contenido, descripcion) values ('Carlos', 'Hambre, quiero desayunar','Alimentenme');

alter table post add column titulo varchar (255);

update post set titulo='Destacado' where id=1;
update post set titulo='Destacado' where id=2;
update post set titulo='NoDestacado' where id=3;

insert into post (nombre_usuario, contenido, descripcion, titulo) values ('Pedro', 'lorem ipsum','descripcion generica 1','titulo 1');
insert into post (nombre_usuario, contenido, descripcion, titulo) values ('Pedro', 'lorem ipsum','descripcion generica 2','titulo 2');

delete from post where id=3;

insert into post (nombre_usuario, contenido, descripcion, titulo) values ('Carlos', 'lorem ipsum','descripcion generica 3','NoDestacado');

drop table if exists comentarios;
create table comentarios (
	id serial primary key,
	fecha_creacion timestamp default now(),
--	hora_creacion timestamp,
	contenido varchar(255) not null,
	post_id integer not null,
	foreign key (post_id) references post(id)
);
insert into comentarios (contenido, post_id) values ('No te vallas aun !', 2);
insert into comentarios (contenido, post_id) values ('Aun es temprano', 2);
insert into comentarios (contenido, post_id) values ('Esta cerca el break...', 6);
insert into comentarios (contenido, post_id) values ('Yo igual', 6);
insert into comentarios (contenido, post_id) values ('Que hay de almuerzo', 6);
insert into comentarios (contenido, post_id) values ('Te comparto mi colacion', 6);

insert into post (nombre_usuario, contenido, descripcion, titulo) values ('Margarita','Este es el post Margarita', 'PostMargarita', 'P8');

insert into comentarios (contenido, post_id) values ('Comentario 1', 7);
insert into comentarios (contenido, post_id) values ('Comentario 2', 7);
insert into comentarios (contenido, post_id) values ('Comentario 3', 7);
insert into comentarios (contenido, post_id) values ('Comentario 4', 7);
insert into comentarios (contenido, post_id) values ('Comentario 5', 7);

select * from post;
select * from comentarios;


