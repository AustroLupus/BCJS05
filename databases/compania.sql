drop table if exists departamentos;
create table departamentos (
	id serial,
	nombre varchar (255) not null,
	primary key(id)
);

drop table if exists locales;
create table locales (
	id serial,
	nombre varchar (255) not null,
	departamento_id integer not null,
	primary key(id),
	foreign key (departamento_id) references departamentos(id)
);

drop table if exists proyectos;
create table proyectos (
	id serial,
	nombre varchar (255) not null,
	departamento_id integer not null,
	local_id integer not null,
	primary key(id),
	foreign key (departamento_id) references departamentos(id),
	foreign key (local_id) references locales(id)
);

drop table if exists empleados;
create table empleados (
	rut varchar(255),
	nombre varchar (255) not null,
	salario integer not null,
	sexo integer not null,
	anio integer not null,
	departamento_id integer not null,
	supervisor_rut varchar (255),
	primary key(rut),
	foreign key (departamento_id) references departamentos(id)
);

drop table if exists cargas_familiares;
create table cargas_familiares (
	myid serial not null,
	nombre varchar (255) not null,
	sexo varchar (255) not null,
	fecha_nacimiento date not null,
	relacion varchar (255) not null,
	empleados_rut varchar (255) not null,
	primary key (myid),
	foreign key (empleados_rut) references empleados(rut)
);

drop table if exists administrador;
create table administrador (
	empleados_rut varchar (255) not null,
	departamento_id integer not null,
	primary key (empleados_rut),
	foreign key (empleados_rut) references empleados(rut),
	foreign key (departamento_id) references departamentos(id)
);

drop table if exists proyectos_empleados;
create table proyectos_empleados (
	proyecto_id serial not null,
	empleado_rut varchar (255) not null,
	horas_semanales integer not null,
	primary key (proyecto_id,empleado_rut),
	foreign key (proyecto_id) references proyectos (id),
	foreign key (empleado_rut) references empleados (rut)
);