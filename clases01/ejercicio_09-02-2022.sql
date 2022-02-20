-- CRUD == Create Read Update Delete
-- insert into nombre_tabla (col1,col2,...) values (valor1, valor2,...);
insert into departamentos (nombre) values ('Contabilidad');
insert into departamentos (nombre) values ('Docencia');
insert into departamentos (nombre) values ('Informatica');
insert into departamentos (nombre) values ('Recursos Humanos');

select * from departamentos;

insert into locales (nombre, departamento_id) values ('Villarrica',3);
insert into locales (nombre, departamento_id) values ('Coyaique',3);
insert into locales (nombre, departamento_id) values ('Natales',3);

select * from locales;

insert into proyectos (nombre, departamento_id,local_id) values ('MK-Ultra',3,1);

select * from proyectos;


--update nombre_tabla set col1=valor1, col2=valor2,... where CONDICION
update departamentos set nombre='Equipo Humano' where id=4;

-- delete from nombre_tabla where CONDICION
delete from departamentos where id=1;