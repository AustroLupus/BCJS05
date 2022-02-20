drop table if exists autos cascade;
create table autos (
	id serial not null primary key,
	marca varchar (255) not null,
	modelo varchar (255) not null,
	anio integer not null,
	color varchar (255) not null,
	precio integer not null	
);
drop table if exists ventas;
create table ventas (
	fecha date not null,
	id_auto varchar (255),
	cliente varchar (255) not null,
	referencia integer not null,
	cantidad integer,
	metodo_pago varchar (255) not null
);