-- create database tienda_electro;
-- \c tienda_electro
drop table if exists clientes cascade;
create table clientes (
	id serial not null primary key,
	nombre varchar (255) not null,
	rut varchar (255) not null, -- como varchar por el guion y digito verificador K
	direccion varchar (255) not null
);

drop table if exists facturas cascade;
create table facturas (
	no_factura serial not null primary key, -- cambiar a numero
	id_cliente integer not null,
	fecha date not null default now(), 
	foreign key (id_cliente) references clientes(id)
);

drop table if exists categorias cascade;
create table categorias (
	id serial not null primary key,
	nombre varchar (255) not null,
	descripcion varchar (255) not null
);

drop table if exists productos cascade;
create table productos (
	id_producto integer primary key not null, --cambiar nombre a id
	id_categoria integer not null,
	stock integer not null,
	nombre varchar (255) not null,
	valor_unitario numeric not null,
	foreign key (id_categoria) references categorias(id)
);

drop table if exists productos_facturas cascade;
create table productos_facturas (
	factura_id integer not null,
	prod_id integer not null,
	cantidad integer not null,
--	valor_total integer not null,  sacar
--	subtotal numeric not null, --suma de todos los valores totales
--	iva numeric not null, --subtotal por 0.19
--	precio_total numeric not null, --subtotal mas iva
	foreign key (factura_id) references facturas(no_factura),
	foreign key (prod_id) references productos(id_producto),
	primary key (factura_id, prod_id)
);


insert into clientes(nombre,rut,direccion)
values 
	('cliente 1','11.111.111-1','calle A numero 1'),
	('cliente 2','22.222.222-2','calle B numero 2'),
	('cliente 3','33.333.333-3','calle C numero 3')
;

insert into categorias (nombre,descripcion)
values
	('categoria 1','Descripcion de la categoria 1'),
	('categoria 2','Descripcion de la categoria 2')
;

insert into productos (id_producto,id_categoria,stock,nombre,valor_unitario)
values
	(1,1,111,'producto 1',1),
	(2,2,222,'producto 2',2),
	(3,1,333,'producto 3',3),
	(4,2,444,'producto 4',4),
	(5,1,555,'producto 5',5)
;	

insert into facturas (id_cliente,fecha)
values
	(1,'2022-02-14'),
	(2,'2022-02-15'),
	(3,'2022-02-16')
returning *;

insert into productos_facturas (factura_id, prod_id, cantidad,valor_total)
values
	(1,1,10,
	(select (valor_unitario*10) from productos where id_producto=1) 
	),
	(1,2,20,
	(select (valor_unitario*20) from productos where id_producto=2) 
	),
	(1,3,30,
	(select (valor_unitario*30) from productos where id_producto=3) 
	)
returning *;


-- calcular el subtotal de la factura 1
select sum(valor_total) as subtotal from productos_facturas where factura_id=1; 

-- calcular el iva de la factura 1
select sum(valor_total)*0.19 as iva from productos_facturas where factura_id=1;












