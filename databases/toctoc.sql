create table arrentararios (
	rut varchar (255) not null primary key,
	nombre varchar (255) not null,
	apellido varchar (255) not null	
);

create table dueno (
	rut varchar (255) not null primary key,
	nombre varchar (255) not null,
	apellido varchar (255) not null
);

create table casas(
	id_casa integer primary key not null,
	rut_dueno varchar (255) not null references dueno(rut),
	
	
);

create table arrienda (
	rut_arrendatario varchar (255) not null references arrendatario(rut),
	id_casa integer references casa(id),
	deuda integer not null default 0,
	foreign key
);