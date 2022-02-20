create database TutorialSQL

USE [TutorialSQL]
/*Necesita almacenar los datos de sus amigos en una tabla. 
Los datos que guardará serán: apellido, nombre, domicilio y teléfono.

-- 1. Elimine la tabla "agenda" si existe:*/

if OBJECT_ID('agenda') is not null
drop table agenda

-- 2. Intente crear una tabla llamada "/agenda":

create table /agenda
(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)

)

/*3. Cree una tabla llamada "agenda", debe tener los siguientes campos: 
apellido, varchar(30); nombre, 
varchar(20); domicilio, varchar (30) y telefono, varchar(11):*/

create table agenda
(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)
)

--4 Intente crecarla nuevamente. Aparece mensaje de error.

create table agenda
(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)
)

--5. Visualice las tablas existente (exec sp_tables @table_owner='dbo')

exec sp_tables @table_owner='dbo'

-- 6. Visualice la estructura de la tabla "agenda" (sp_columns) 

exec sp_columns agenda

--7. Elimine la tabla
drop table agenda

--8. Intente eliminar la tbala, sin controlar si existe. Debe aparecer un mensaje de error

drop table agenda

---------------------------------------------------------------------------------------------

--3. Insertar y recuperar registros de una tabla (insert into - select)

/*
Trabaje con la tabla agenda que almacena informacion de sus amigos.
*/

--1. Elimine la tabla agenda, si existe:
if OBJECT_ID('agenda') is not null
drop table agenda

/*2. Cree una tabla llamada agenda. Debe tener los siguiente campos:
apellido, varchar(30); nombre, 
varchar(20); domicilio, varchar (30) y telefono, varchar(11):
*/

create table agenda
(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)
)

--3. Visualice las tablas existente para verficar la creacion de agenda

exec SP_tables @table_owner='dbo'

--4. Visualice la estructura de la tabla agenda.

exec sp_columns agenda

--5. Ingrese los siguiente registros:

insert into agenda (apellido, nombre, domicilio, telefono)
	values ('Moreno', 'Alberto', 'Colon 123', '4234567')
insert into agenda (apellido, nombre, domicilio, telefono)
	values ('Torres', 'Juan', 'Avellaneda 135', '4458787')

--6. Seleccionare todos los regitris de la tabla
select * from agenda

--7. Elimine la tabla agenda
drop table agenda

--8. Intente eliminar la tabla nuevamente, aparece un mensaje de error
drop table agenda

----------------------------------------------------------------------------------------------------------

--4. Tipos de datos básicos
/*
Un videoclub que alquila películas en video almacena la información de sus películas en una tabla 
llamada "peliculas"; para cada película necesita los siguientes datos:
 -nombre, cadena de caracteres de 20 de longitud,
 -actor, cadena de caracteres de 20 de longitud,
 -duración, valor numérico entero.
 -cantidad de copias: valor entero.
*/

--1. Elimine la tabla, si existe
if OBJECT_ID('peliculas') is not null
drop table peliculas

--2. Cree la tabla eligiendo el tipo de dato adecuado para cada campo

create table peliculas
(
	nombre varchar(20),
	actor varchar(20),
	duracion integer,
	cantidad integer
);

--3. Vea la estructura de la tabla
exec sp_columns peliculas

--4. Ingrese los siguintes registros
insert into peliculas (nombre, actor, duracion, cantidad)
	values ('Mision imposible', 'Tom Cruise', '128', '3');
insert into peliculas (nombre, actor, duracion, cantidad)
	values ('Mision imposible 2', 'Tom Cruise', '130', '2');
insert into peliculas (nombre, actor, duracion, cantidad)
	values ('Mujer bonita', 'Julia Robert', '118', '3');
insert into peliculas (nombre, actor, duracion, cantidad)
	values ('Elsa y Fred', 'China Zorrilla', '110', '2');

--5. Muestre todos los registros
select * from peliculas

-------------------------------------------------------------------------------------------
--5. Recuperar algunos campos (select)

/*
Un videoclub que alquila películas en video almacena la información de sus películas en alquiler en 
una tabla llamada "peliculas".
*/

--1. Elimine la tabla, si existe
if OBJECT_ID('peliculas') is not null
drop table peliculas

--2 Cree la tabla
create table peliculas
(
	titulo varchar(20),
	actor varchar(20),
	duracion integer,
	cantidad integer
);

--3 Vea la estructura de la tabla (sp_columns)

exec SP_columns peliculas

--4 Ingrese los siguinte registros

insert into peliculas (titulo, actor, duracion, cantidad)
	values ('Mision imposible', 'Tom Cruise', '180', '3');
insert into peliculas (titulo, actor, duracion, cantidad)
	values ('Mision imposible 2', 'Tom Cruise', '190', '2');
insert into peliculas (titulo, actor, duracion, cantidad)
	values ('Mujer bonita', 'Julia Roberts', '118', '3');
insert into peliculas (titulo, actor, duracion, cantidad)
	values ('Elsa y Fred', 'China Zorrilla', '110', '2')

--5. Realice un select mostrando solamente el titulo y actor de todas las peliculas

select titulo, actor from peliculas

--6 Muestre el titulo y duarcion de todas las peliculas

select titulo, duracion from peliculas

--7 Muestre el titulo y la cantidad de copias

select titulo, cantidad from peliculas

-------------------------------------------------------------------------------------------------------

--6. Recuperar algunos registros (where)

--Trabaje con la tabla "agenda" en la que registra los datos de sus amigos.

--1. Elimine agenda, si existe
if OBJECT_ID('agenda') is not null
drop table agenda

/*2. apellido (cadena de 30), nombre (cadena de 20), 
domicilio (cadena de 30) y telefono (cadena de 11).*/

create table agenda
(
	apellido varchar(30),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar(11)
);

--3. Visualice la estructura de la tabla agenda
exec SP_columns agenda

/*4. Ingrese los siguinete registros
 Acosta, Ana, Colon 123, 4234567;
 Bustamante, Betina, Avellaneda 135, 4458787;
 Lopez, Hector, Salta 545, 4887788; 
 Lopez, Luis, Urquiza 333, 4545454;
 Lopez, Marisa, Urquiza 333, 4545454.*/

 insert into agenda (apellido, nombre, domicilio, telefono)
	values('Acosta', 'Ana',' Colon 123', '4234567');
 insert into agenda (apellido, nombre, domicilio, telefono)
	values( 'Bustamante', 'Betina', 'Avellaneda 135', '4458787');
 insert into agenda (apellido, nombre, domicilio, telefono)
	values('Lopez', 'Hector', 'Salta 545', '4887788');
 insert into agenda (apellido, nombre, domicilio, telefono)
	values('Lopez', 'Luis', 'Urquiza 333', '4545454');
 insert into agenda (apellido, nombre, domicilio, telefono)
	values( 'Lopez', 'Marisa', 'Urquiza 333', '4545454');

--5. Selecione todos los registros de la tabla
select * from agenda

--6. Seleccione el registro cuyo nombre sea Marisa (1 Registro)
select nombre from agenda
	where nombre = 'Marisa'

--7. Seleccione los nombres y domicilios de quienes tengan apellido igual a "Lopez" (3 registros)

select nombre, domicilio, apellido from agenda
	where apellido = 'Lopez'

--8. Muestre el nombre de quienes tengan el teléfono "4545454" (2 registros)

select nombre, telefono from agenda
	where telefono = '4545454'

------------------------------------------------------------------------------------------------------
--7. Operadores relacionales
/*
Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con 
ese nombre.
*/

--1. Elimine articulos, si existe
if OBJECT_ID('articulos') is not null
drop table articulos

--2 Cree la tabla con lasiguinte estrcutura
 create table articulos
 (
 codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
 );

 --3. Vea la estructura de la tabla (sp_columns)
 exec sp_columns articulos

 --4. Ingrese algunos registros

 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
	values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
	values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
	values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
	values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
	values (5,'teclado','español Biswal',90,50);

--5. Seleccione los datos de las impresoras (2 registros)
select nombre from articulos
	where nombre = 'impresora'

--6. Seleccione los artículos cuyo precio sea mayor o igual a 400 (3 registros)
select precio from articulos
	where precio >= 400

--7. Seleccione el código y nombre de los artículos cuya cantidad sea menor a 30 (2 registros)
select codigo, nombre, cantidad from articulos
	where cantidad < 30

--8. Selecciones el nombre y descripción de los artículos que NO cuesten $100 (4 registros)
select nombre, descripcion, precio from articulos
	where precio <> 100

------------------------------------------------------------------------------------------------------------------------------------------
--8. Borrar registros (delete)
/*Trabaje con la tabla "agenda" que registra la información referente a sus amigos.*/

--1. Elimine la tabla, si existe
if OBJECT_ID('agenda') is not null
drop table agenda

/*2. Cree la tabla con los siguientes campos: apellido (cadena de 30), nombre (cadena de 20), 
domicilio (cadena de 30) y telefono (cadena de 11)*/

 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

 --3. Ingrese los siguientes registros
 /* Alvarez,Alberto,Colon 123,4234567,
 Juarez,Juan,Avellaneda 135,4458787,
 Lopez,Maria,Urquiza 333,4545454,
 Lopez,Jose,Urquiza 333,4545454,
 Salas,Susana,Gral. Paz 1234,4123456*/

  insert into agenda (apellido,nombre,domicilio,telefono)
	values('Alvarez','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre,domicilio,telefono)
	values('Juarez','Juan','Avellaneda 135','4458787');
 insert into agenda (apellido,nombre,domicilio,telefono)
	values('Lopez','Maria','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
	values('Lopez','Jose','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
	values('Salas','Susana','Gral. Paz 1234','4123456');

--4. Elimine el registro cuyo nombre sea "Juan" (1 registro afectado)

delete from agenda
where nombre = 'Juan'

--5. Elimine los registros cuyo número telefónico sea igual a "4545454" (2 registros afectados):

delete from agenda
	where telefono = '4545454'

--6. Muestre la tabla

select * from agenda

--7. Elimine todos los registros (2 registros afectados)

delete from agenda

--8. Muestre la tabla.

select * from agenda

------------------------------------------------------------------------------------------------------------------------------------------------
--
--9. Actualizar registros (update)

--Trabaje con la tabla "agenda" que almacena los datos de sus amigos
--1. Elimine la tabla si existe:

 if object_id('agenda') is not null
	drop table agenda;


--2. Cree la tabla
create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

--3.Ingrese los siguientes registros (1 registro actualizado)
 insert into agenda (apellido,nombre,domicilio,telefono)
 values ('Acosta','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Juarez','Juan','Avellaneda 135','4458787');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Lopez','Maria','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Lopez','Jose','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Suarez','Susana','Gral. Paz 1234','4123456');

  --4. Modifique el registro cuyo nombre sea "Juan" por "Juan Jose" (1 registro afectado)
  update agenda set nombre='Juan Jose'
  where nombre='Juan'

select * from agenda

/*5. Actualice los registros cuyo número telefónico sea igual a "4545454" por "4445566" 
(2 registros afectados)*/

update agenda set telefono = '4445566'
	where telefono = '4545454'

select * from agenda

/*6. Actualice los registros que tengan en el campo "nombre" el valor "Juan" por "Juan Jose" (ningún 
registro afectado porque ninguno cumple con la condición del "where")*/
update agenda set nombre = 'Juan Jose'
	where nombre = 'Juan'

select * from agenda

--7. Luego de cada actualización ejecute un select que muestre todos los registros de la tabla

/*Cada actualizacion ya tiene su select*/

----------------------------------------------------------------------------------------------------------------------------------------------

/*11 Valores null (is null)
PRIMER PROBLEMA
Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".
1. Elimine la tabla, si existe*/

if OBJECT_ID('medicamentos') is not null
	drop table medicamentos

--2. Cree la tabla con la siguiente estructura:
 create table medicamentos(
	codigo integer not null,
	nombre varchar(20) not null,
	laboratorio varchar(20),
	precio float,
	cantidad integer not null
 );

 --3. Visualice la estructura de la tabla "medicamentos"
 exec SP_columns medicamentos

 --4. Ingrese algunos registros con valores "null" para los campos que lo admitan

insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
	values(1,'Sertal gotas',null,null,100); 
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
	values(2,'Sertal compuesto',null,8.90,150);
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
	values(3,'Buscapina','Roche',null,200);

--5. Vea todos los registros

select * from medicamentos

--6. Ingrese un registro con valor "0" para el precio y cadena vacía para el laboratorio

 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad)
  values(4,'Bayaspirina','',0,150);
  select * from medicamentos

--7. Ingrese un registro con valor "0" para el código y cantidad y cadena vacía para el nombre

insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
	values(0,'','Bayer',15.60,0);
	select * from medicamentos

--8. Muestre todos los registros

select * from medicamentos

--9. Intente ingresar un registro con valor nulo para un campo que no lo admite (aparece un mensaje de error)

insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
	values(null,'Amoxidal jarabe','Bayer',25,120);

/*10. Recupere los registros que contengan valor "null" en el campo "laboratorio", luego los que 
tengan una cadena vacía en el mismo campo. Note que el resultado es diferente*/

select laboratorio from medicamentos
	where laboratorio is null;
select laboratorio from medicamentos
	where laboratorio = ''

/*11. Recupere los registros que contengan valor "null" en el campo "precio", luego los que tengan el 
valor 0 en el mismo campo. Note que el resultado es distinto.*/

select precio from medicamentos
	where precio is null
select precio from medicamentos
	where precio = 0

/*12. Recupere los registros cuyo laboratorio no contenga una cadena vacía, luego los que sean 
distintos de "null".
Note que la salida de la primera sentencia no muestra los registros con cadenas vacías y tampoco los 
que tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el 
campo laboratorio (incluso cadena vacía).*/

select * from medicamentos
	where laboratorio <>0
select * from medicamentos
	where laboratorio is not null

/*13. Recupere los registros cuyo precio sea distinto de 0, luego los que sean distintos de "null":
Note que la salida de la primera sentencia no muestra los registros con valor 0 y tampoco los que 
tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el 
campo precio (incluso el valor 0).*/

select * from medicamentos
	where precio <>0
select * from medicamentos
	where precio is not null

/*SEGUNDO PROBLEMA
Trabaje con la tabla que almacena los datos sobre películas, llamada "peliculas".

1. Elimine la tabla si exist*/

if OBJECT_ID('peliculas') is not null
	drop table peliculas

--2 Crrela con la siguinte estructura
create table peliculas
(
	codigo int not null,
	titulo varchar(40) not null,
	actor varchar(20),
	duracion int
);

--3. Visualice la estructura de la tabla

exec SP_columns peliculas

--4. Ingrese los siguientes registros
 insert into peliculas (codigo,titulo,actor,duracion)
	values(1,'Mision imposible','Tom Cruise',120);
 insert into peliculas (codigo,titulo,actor,duracion)
	values(2,'Harry Potter y la piedra filosofal',null,180);
 insert into peliculas (codigo,titulo,actor,duracion)
	values(3,'Harry Potter y la camara secreta','Daniel R.',null);
 insert into peliculas (codigo,titulo,actor,duracion)
	values(0,'Mision imposible 2','',150);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(4,'','L. Di Caprio',220);
 insert into peliculas (codigo,titulo,actor,duracion)
	values(5,'Mujer bonita','R. Gere-J. Roberts',0);

--5. Recupere todos los registros para ver cómo SQL Server los almacenó
select * from peliculas

--6. Intente ingresar un registro con valor nulo para campos que no lo admiten (aparece un mensaje de error)
insert into peliculas(codigo,titulo,actor,duracion)
	values(null,'Mujer bonita','R. Gere-J. Roberts',190);

/*7. Muestre los registros con valor nulo en el campo "actor" y luego los que guardan una cadena vacía 
(note que la salida es distinta) (1 registro)*/

select * from peliculas
	where actor is null

/*8. Modifique los registros que tengan valor de duración desconocido (nulo) por "120" (1 registro 
actualizado)*/

update peliculas set duracion = 120
	where duracion is null

/*9.Coloque 'Desconocido' en el campo "actor" en los registros que tengan una cadena vacía en dicho 
campo (1 registro afectado)*/

update peliculas set actor = 'Desconicido'
	where actor = ''
/*10. Muestre todos los registros. Note que el cambio anterior no afectó a los registros con valor 
nulo en el campo "actor".*/
select * from peliculas

--11. Elimine los registros cuyo título sea una cadena vacía (1 registro)

delete from peliculas
	where titulo = '';

select * from peliculas

--------------------------------------------------------------------------------------------------------------------

/*12.  Clave primaria
Primer problema:
Trabaje con la tabla "libros" de una librería.
1. Elimine la tabla si existe*/

if OBJECT_ID('libros') is not null
	drop table libros

--2. Créela con los siguientes campos, estableciendo como clave primaria el campo "codigo"

 create table libros(
	codigo int not null,
	titulo varchar(40) not null,
	autor varchar(20),
	editorial varchar(15),
	primary key(codigo)
 )

 --3. Ingrese los siguientes registros:

 insert into libros (codigo,titulo,autor,editorial)
	values (1,'El aleph','Borges','Emece');
insert into libros (codigo,titulo,autor,editorial)
	values (2,'Martin Fierro','Jose Hernandez','Planeta');
insert into libros (codigo,titulo,autor,editorial)
	values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo');

	select * from libros

--4. Ingrese un registro con código repetido (aparece un mensaje de error)
insert into libros (codigo,titulo,autor,editorial)
	values (2,'Don Quijote de la Mancha',' Miguel de Cervantes Saavedra','Planeta')

--5. Intente ingresar el valor "null" en el campo "codigo"

insert into libros (codigo,titulo,autor,editorial)
	values (null,'Don Quijote de la Mancha',' Miguel de Cervantes Saavedra','Planeta');

--6. Intente actualizar el código del libro "Martin Fierro" a "1" (mensaje de error)

update libros set codigo =  1
	where titulo = 'Martin Fierro'

	select * from libros

/*Segundo problema:
Un instituto de enseñanza almacena los datos de sus estudiantes en una tabla llamada "alumnos".
1. Elimine la tabla "alumnos" si existe*/

if OBJECT_ID('alumnos') is not null
	drop table alumnos

/*2- Cree la tabla con la siguiente estructura intentando establecer 2 campos como clave primaria, el 
campo "documento" y "legajo" (no lo permite)*/

create table alumnos1
(
	legajo varchar(4) not null,
	documento varchar(8),
	nombre varchar(30),
	domicilio varchar(30),
	primary key(documento),
	primary key(legajo)
);

--3. Cree la tabla estableciendo como clave primaria el campo "documento":

create table alumnos
(
	legajo varchar(4) not null,
	documento varchar(8),
	nombre varchar(30),
	domicilio varchar(30),
	primary key(documento),
);

--4- Verifique que el campo "documento" no admite valores nulos
exec SP_columns alumnos

--5- Ingrese los siguientes registros

insert into alumnos (legajo,documento,nombre,domicilio)
	values('A233','22345345','Perez Mariana','Colon 234');
insert into alumnos (legajo,documento,nombre,domicilio)
	values('A567','23545345','Morales Marcos','Avellaneda 348');

--6- Intente ingresar un alumno con número de documento existente (no lo permite)

 insert into alumnos (legajo,documento,nombre,domicilio)
  values('A650','22345345','Hernadez Maria','Rieles 243'); 

--7- Intente ingresar un alumno con documento nulo (no lo permite)

 insert into alumnos (legajo,documento,nombre,domicilio)
  values('A650',null,'Hernadez Maria','Rieles 243'); 

  -------------------------------------------------------------------------------------------------------------------------

  /*
13 - Campo con atributo Identity
Primer problema:
Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".
1- Elimine la tabla,si existe*/

 if object_id('medicamentos') is not null
	drop table medicamentos;

--2- Cree la tabla con un campo "codigo" que genere valores secuenciales automáticamente

create table medicamentos
(
	codigo int identity,
	nombre varchar(20) not null,
	laboratorio varchar(20),
	precio float,
	cantidad integer
)

--3- Visualice la estructura de la tabla "medicamentos":
 
 exec sp_columns medicamentos;

 --4- Ingrese los siguientes registros


 insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Buscapina','Roche',4.10,200);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
	 values('Amoxidal 500','Bayer',15.60,1)

--5- Verifique que SQL Server generó valores para el campo "código" de modo automático

 select * from medicamentos

 --6- Intente ingresar un registro con un valor para el campo "codigo"
 insert into medicamentos(codigo,nombre, laboratorio, precio, cantidad)
	values(7,'Grippal', 'Bayer', 250.50, 100)

--7- Intente actualizar un valor de código (aparece un mensaje de error)

update medicamentos set codigo = 4
	where nombre = 'Amoxidal'

--8- Elimine el registro con codigo "3" (1 registro eliminado)

delete from medicamentos
	where codigo = 3

--9- Ingrese un nuevo registro

insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Amoxilina 500','Bayer',15.60,100);

--10- Seleccione todos los registros para ver qué valor guardó SQL Server en el campo código:
 
 select * from medicamentos;

 /*
Segundo problema:
Un videoclub almacena información sobre sus películas en una tabla llamada "peliculas"
1- Elimine la tabla si existe*/
if object_id('peliculas') is not null
	drop table peliculas;

--2- Créela definiendo un campo "codigo" autoincrementable y como clave primaria:
 create table peliculas(
	codigo int identity,
	titulo varchar(40),
	actor varchar(20),
	duracion int,
	primary key(codigo)
 )

 --3- Ejecute el procedimiento almacenado para visualizar la estructura de la tabla

 exec sp_columns peliculas

 --4- Ingrese los siguientes registros

 insert into peliculas (titulo,actor,duracion)
	values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
	values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
	values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas (titulo,actor,duracion)
	values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
	values('La vida es bella','zzz',220);

--5- Seleccione todos los registros y verifique la carga automática de los códigos

 select * from peliculas

-- 6- Intente actualizar el codigo de una película (aparece un mensaje de error)

update peliculas set codigo = 6
	where codigo = 5

--7- Elimine la película "La vida es bella"

delete from peliculas
	where titulo = 'La vida es bella'

--8- Ingrese un nuevo registro.

insert into peliculas(titulo,actor,duracion)
	values('Matrix Resurrecciones', 'Christina Ricci', 148)

--9- Visualice los registros para ver el valor almacenado en codigo (valor 6)

 select * from peliculas

 --------------------------------------------------------------------------------------------------------------------------
 
/*14 - Otras características del atributo Identity
Primer problema:
Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".
1- Elimine la tabla,si existe*/

if object_id('medicamentos') is not null
	drop table medicamentos

/*2- Cree la tabla con un campo "codigo" que genere valores secuenciales automáticamente comenzando en 
10 e incrementándose en 1*/

 create table medicamentos(
	codigo integer identity(10,1),
	nombre varchar(20) not null,
	laboratorio varchar(20),
	precio float,
	cantidad integer
 )

 --3- Ingrese los siguientes registros

insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Amoxidal 500','Bayer',15.60,100)


--4- Verifique que SQL Server generó valores para el campo "código" de modo automático

 select *from medicamentos

 --5- Intente ingresar un registro con un valor para el campo "codigo"

 insert into medicamentos (codigo, laboratorio,precio,cantidad)
	values(6,'amoxicilina','Bayer',250.10,50)

--6- Setee la opción "identity_insert" en "on"

set identity_insert medicamentos on

--7- Ingrese un nuevo registro sin valor para el campo "codigo" (no lo permite)

insert into medicamentos (nombre, laboratorio,precio,cantidad)
	values('Amoxilina 500','Bayer',15.60,100)


--8- Ingrese un nuevo registro con valor para el campo "codigo" repetido
select * from medicamentos

insert into medicamentos (codigo, laboratorio,precio,cantidad)
	values(10,'Amoxilina 500','Bayer',15.60,100)

/*9- Use la función "ident_seed()" para averiguar el valor de inicio del campo "identity" de la tabla 
"medicamentos"*/

select IDENT_SEED('medicamentos')

/*10- Emplee la función "ident_incr()" para saber cuál es el valor de incremento del campo "identity" 
de "medicamentos"*/

select IDENT_INCR('medicamentos')



/*Segundo problema:
Un videoclub almacena información sobre sus películas en una tabla llamada "peliculas".
1- Elimine la tabla si existe*/

 if object_id('peliculas') is not null
  drop table peliculas

--2- Créela definiendo un campo "codigo" autoincrementable que comience en 50 y se incremente en 3:
 create table peliculas(
	codigo int identity (50,3),
	titulo varchar(40),
	actor varchar(20),
	duracion int
 )

-- 3- Ingrese los siguientes registros:
 insert into peliculas (titulo,actor,duracion)
	values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
	values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
	values('Harry Potter y la camara secreta','Daniel R.',190);

--4- Seleccione todos los registros y verifique la carga automática de los códigos:
 
 select *from peliculas

 --5- Setee la opción "identity_insert" en "on"

 SET IDENTITY_INSERT peliculas on

 --6- Ingrese un registro con valor de código menor a 50

 insert into peliculas (codigo,titulo,actor,duracion)
	values(38,'Mision imposible 2','Tom Cruise',120);

--7- Ingrese un registro con valor de código mayor al último generado

 insert into peliculas (codigo, titulo,actor,duracion)
  values(60,'Arte y Crime','Tom sam',120);

--8- Averigue el valor de inicio del campo "identity" de la tabla "peliculas"

 select ident_seed('peliculas')

 --9- Averigue el valor de incremento del campo "identity" de "peliculas"

  select ident_incr('peliculas')

--10- Intente ingresar un registro sin valor para el campo código

 insert into peliculas (titulo,actor,duracion)
  values('La mujer maravilla','Enna Husten',163);

--11- Desactive la opción se inserción para el campo de identidad.

set identity_insert peliculas off

/*12- Ingrese un nuevo registro y muestre todos los registros para ver cómo SQL Server siguió la 
secuencia tomando el último valor del campo como referencia.*/

insert into peliculas (titulo,actor,duracion)
	values('Super Man','Henry Cavill',120);
 select * from peliculas

 ------------------------------------------------------------------------------------------------------------------
 /*15 - Truncate table

 Primer problema:
Un instituto de enseñanza almacena los datos de sus estudiantes en una tabla llamada "alumnos".
1- Elimine la tabla "alumnos" si existe*/

if object_id('alumnos') is not null
  drop table alumnos

--2- Cree la tabla con la siguiente estructura:
 create table alumnos(
	legajo int identity,
	documento varchar(8),
	nombre varchar(30),
	domicilio varchar(30)
 )

 --3- Ingrese los siguientes registros y muéstrelos para ver la secuencia de códigos:
 insert into alumnos (documento,nombre,domicilio)
  values('22345345','Perez Mariana','Colon 234');
 insert into alumnos (documento,nombre,domicilio)
  values('23545345','Morales Marcos','Avellaneda 348');
 insert into alumnos (documento,nombre,domicilio)
  values('24356345','Gonzalez Analia','Caseros 444');
 insert into alumnos (documento,nombre,domicilio)
  values('25666777','Torres Ramiro','Dinamarca 209');

  --4- Elimine todos los registros con "delete".

   delete from alumnos

--5- Ingrese los siguientes registros y selecciónelos para ver cómo SQL Server generó los códigos

 insert into alumnos (documento,nombre,domicilio)
  values('22345345','Perez Mariana','Colon 234');
 insert into alumnos (documento,nombre,domicilio)
  values('23545345','Morales Marcos','Avellaneda 348');
 insert into alumnos (documento,nombre,domicilio)
  values('24356345','Gonzalez Analia','Caseros 444');
 insert into alumnos (documento,nombre,domicilio)
  values('25666777','Torres Ramiro','Dinamarca 209');
 select * from alumnos

 --6- Elimine todos los registros con "truncate table"

  truncate table alumnos

  /*7- Ingrese los siguientes registros y muestre todos los registros para ver que SQL Server reinició 
la secuencia del campo "identity"*/

 insert into alumnos (documento,nombre,domicilio)
  values('22345345','Perez Mariana','Colon 234');
 insert into alumnos (documento,nombre,domicilio)
  values('23545345','Morales Marcos','Avellaneda 348');
 insert into alumnos (documento,nombre,domicilio)
  values('24356345','Gonzalez Analia','Caseros 444');
 insert into alumnos (documento,nombre,domicilio)
  values('25666777','Torres Ramiro','Dinamarca 209');
 select * from alumnos;

/* Segundo problema:
Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con 
ese nombre.
1- Elimine "articulos", si existe*/

if object_id('articulos') is not null
  drop table articulos

--2- Cree la tabla, con la siguiente estructura

 create table articulos(
	codigo integer identity,
	nombre varchar(20),
	descripcion varchar(30),
	precio float
 )

 --3- Ingrese algunos registros

 insert into articulos (nombre, descripcion, precio)
  values ('impresora','Epson Stylus C45',400.80);
 insert into articulos (nombre, descripcion, precio)
  values ('impresora','Epson Stylus C85',500);

  --4- Elimine todos los registros con "truncate table".

  truncate table articulos

 -- 5- Ingrese algunos registros y muéstrelos para ver que la secuencia de códigos se reinicia

 insert into articulos (nombre, descripcion, precio)
	values ('monitor','Samsung 14',800);
 insert into articulos (nombre, descripcion, precio)
	values ('teclado','ingles Biswal',100);
 insert into articulos (nombre, descripcion, precio)
	values ('teclado','español Biswal',90);

 select * from articulos

 --6- Elimine todos los registros con "delete".

 delete from articulos

 --7- Ingrese algunos registros y muéstrelos para ver que la secuencia de códigos continua

 insert into articulos (nombre, descripcion, precio)
  values ('monitor','Samsung 14',800);
 insert into articulos (nombre, descripcion, precio)
  values ('teclado','ingles Biswal',100);
 insert into articulos (nombre, descripcion, precio)
  values ('teclado','español Biswal',90);
 select * from articulos;

 -----------------------------------------------------------------------------------------------------------------

 /*
17 - Tipo de dato (texto)
Primer problema:
Una concesionaria de autos vende autos usados y almacena los datos de los autos en una tabla llamada 
"autos".
1- Elimine la tabla "autos" si existe*/

if object_id('autos') is not null
  drop table autos

 /* 2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo, estableciendo el campo 
"patente" como clave primaria*/

 create table autos(
	patente char(6),
	marca varchar(20),
	modelo char(4),
	precio float,
	primary key (patente)
 );

 --3- Ingrese los siguientes registros

 insert into autos
  values('ACD123','Fiat 128','1970',15000);
 insert into autos
  values('ACG234','Renault 11','1990',40000);
 insert into autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into autos
  values('GCD123','Renault Clio','1990',70000);
 insert into autos
  values('BCC333','Renault Megane','1998',95000);
 insert into autos
  values('BVF543','Fiat 128','1975',20000);

--4- Seleccione todos los autos del año 1990:
 select * from autos
	where modelo='1990'

/*Segundo problema:
Una empresa almacena los datos de sus clientes en una tabla llamada "clientes".
1- Elimine la tabla "clientes" si existe*/

if object_id('clientes') is not null
  drop table clientes

--2- Créela eligiendo el tipo de dato más adecuado para cada campo

 create table clientes
 (
	documento char(8),
	apellido varchar(20),
	nombre varchar(20),
	domicilio varchar(30),
	telefono varchar (11)
 )

 --4- Ingrese algunos registros:
 insert into clientes
  values('2233344','Perez','Juan','Sarmiento 980','4342345');
 insert into clientes (documento,apellido,nombre,domicilio)
  values('2333344','Perez','Ana','Colon 234');
 insert into clientes
  values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
 insert into clientes
  values('2533344','Juarez','Ana','Urquiza 444','4789900')

--5- Seleccione todos los clientes de apellido "Perez" (2 registros):

 select * from clientes
  where apellido='Perez'

/*18 - Tipo de dato (numérico)
Primer problema:
Un banco tiene registrados las cuentas corrientes de sus clientes en una tabla llamada "cuentas".
La tabla contiene estos datos:
	Número de Cuenta        Documento       Nombre          Saldo
	______________________________________________________________
        1234                          25666777        Pedro Perez     500000.60
        2234                          27888999        Juan Lopez      -250000
        3344                          27888999        Juan Lopez      4000.50
        3346                          32111222        Susana Molina   1000

1- Elimine la tabla "cuentas" si existe*/

if object_id('cuentas') is not null
	drop table cuentas

/*2- Cree la tabla eligiendo el tipo de dato adecuado para almacenar los datos descriptos arriba:

 - Número de cuenta: entero, no nulo, no puede haber valores repetidos, clave primaria;
 - Documento del propietario de la cuenta: cadena de caracteres de 8 de longitud (siempre 8), no nulo;
 - Nombre del propietario de la cuenta: cadena de caracteres de 30 de longitud,
 - Saldo de la cuenta: valores altos con decimales.*/

  create table cuentas
(
	numero int not null,
	documento char(8),
	nombre varchar(30),
	saldo money,
	primary key (numero)
)

--3- Ingrese los siguientes registros

 insert into cuentas(numero,documento,nombre,saldo)
	values('1234','25666777','Pedro Perez',500000.60);
 insert into cuentas(numero,documento,nombre,saldo)
	values('2234','27888999','Juan Lopez',-250000);
 insert into cuentas(numero,documento,nombre,saldo)
	values('3344','27888999','Juan Lopez',4000.50);
 insert into cuentas(numero,documento,nombre,saldo)
	values('3346','32111222','Susana Molina',1000)

--4- Seleccione todos los registros cuyo saldo sea mayor a "4000" (2 registros)

select * from cuentas
	where saldo<4000

--5- Muestre el número de cuenta y saldo de todas las cuentas cuyo propietario sea "Juan Lopez" (2 registros)

select numero,saldo from cuentas
	where nombre='Juan Lopez'

--6- Muestre las cuentas con saldo negativo (1 registro)

select saldo from cuentas
	where saldo < 0

--7- Muestre todas las cuentas cuyo número es igual o mayor a "3000" (2 registros):
 select * from cuentas
	where numero>=3000

/*Segundo problema:
Una empresa almacena los datos de sus empleados en una tabla "empleados" que guarda los siguientes 
datos: nombre, documento, sexo, domicilio, sueldobasico.
1- Elimine la tabla, si existe*/

if object_id('empleados') is not null
	drop table empleados

--2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 create table empleados(
	nombre varchar(30),
	documento char(8),
	sexo char(1),
	domicilio varchar(30),
	sueldobasico decimal(7,2),
	cantidadhijos tinyint
 )

--3- Ingrese algunos registros

insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
	values ('Juan Perez','22333444','m','Sarmiento 123',500,2);
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
	values ('Ana Acosta','24555666','f','Colon 134',850,0);
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
	values ('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4);

/*4- Ingrese un valor de "sueldobasico" con más decimales que los definidos (redondea los decimales al 
valor más cercano 800.89)*/

insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
	values ('Susana Molina','29000555','f','Salta 876',800.888,3)

--5- Intente ingresar un sueldo que supere los 7 dígitos (no lo permite)
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
	values ('Luis Ramiro','53628405','m','sanchez 7483',1000000,2)

--6- Muestre todos los empleados cuyo sueldo no supere los 900 pesos (1 registro)

select * from empleados
	where sueldobasico >= 900

--7- Seleccione los nombres de los empleados que tengan hijos (3 registros)

select * from empleados
	where cantidadhijos > 0

  /*
19 - Tipo de dato (fecha y hora)
Primer problema:
Una facultad almacena los datos de sus alumnos en una tabla denominada "alumnos".
1- Elimine la tabla, si existe*/

 if object_id('alumnos') is not null
	drop table alumnos

--2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo
create table alumnos(
  apellido varchar(30),
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso datetime,
  fechanacimiento datetime
 )

 --3- Setee el formato para entrada de datos de tipo fecha para que acepte valores "día-mes-año"

 set dateformat 'dmy'

 --4- Ingrese un alumno empleando distintos separadores para las fechas

 insert into alumnos values('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972')

 --5- Ingrese otro alumno empleando solamente un dígito para día y mes y 2 para el año

 insert into alumnos values('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972')

 /*6- Ingrese un alumnos empleando 2 dígitos para el año de la fecha de ingreso y "null" en 
"fechanacimiento":*/

 insert into alumnos values('Perez','Laura','26666666','Bulnes 345','03-03-91',null)

 /*7- Intente ingresar un alumno con fecha de ingreso correspondiente a "15 de marzo de 1990" pero en 
orden incorrecto "03-15-90"*/

 insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null)

 --8- Muestre todos los alumnos que ingresaron antes del '1-1-91'. 1 registro

 select * from alumnos 
	where fechaingreso<'1-1-91'

--9- Muestre todos los alumnos que tienen "null" en "fechanacimiento":
 select * from alumnos
	where fechanacimiento is null

--10- Intente ingresar una fecha de ingreso omitiendo los separadores:

insert into alumnos values('Rosas','Romina','28888888','Avellaneda 487','03151990',null)

--11- Setee el formato de entrada de fechas para que acepte valores "mes-dia-año".

set dateformat 'mdy'

--12- Ingrese el registro del punto 7

insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null)

------------------------------------------------------------------------------------------------------------------

/*20 - Ingresar algunos campos (insert into)
Primer problema:
Un banco tiene registrados las cuentas corrientes de sus clientes en una tabla llamada "cuentas".
1- Elimine la tabla "cuentas" si existe	*/

if object_id('cuentas') is not null
  drop table cuentas

--2- Cree la tabla :
 create table cuentas(
	numero int identity,
	documento char(8) not null,
	nombre varchar(30),
	saldo money
 )

 /*3- Ingrese un registro con valores para todos sus campos, inclusive el campo identity, omitiendo la 
lista de campos (error, no se debe ingresar para el campo identity)*/

insert into cuentas
	values (1,'25666777','Juan Perez',2500.50);

/*4- Ingrese un registro con valores para todos sus campos omitiendo la lista de campos (excepto el 
campo "identity"):*/
 insert into cuentas
	values ('25666777','Juan Perez',2500.50)

--5- Ingrese un registro omitiendo algún campo que admitan valores nulo

 insert into cuentas (documento,saldo)
	values ('464829',-50032)

--6- Intente ingresar un registro con valor para el campo "numero" (error):

 insert into cuentas (numero,documento,nombre,saldo)
	values (5,'28999777','Luis Lopez',34000)

--7- Intente ingresar un registro listando 3 campos y colocando 4 valores (error)

insert into cuentas(documento, nombre, saldo)
	values(832, '8393021', 'Jose Luis', 45000)

--8- Intente ingresar un registro sin valor para el campo "documento" (error)

insert into cuentas(nombre, saldo)
	values('Luis Jose', 30000)

--9- Vea los registros ingresados:

 select * from cuentas

 -------------------------------------------------------------------------------------------------------------------------
  /*
21 - Valores por defecto (default)
Primer problema:
Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos 
de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.

1- Elimine la tabla "visitantes", si existe*/
if object_id('visitantes') is not null
  drop table visitantes

--2- Cree la tabla con la siguiente estructura

 create table visitantes(
	nombre varchar(30),
	edad tinyint,
	sexo char(1) default 'f',
	domicilio varchar(30),
	ciudad varchar(20) default 'Cordoba',
	telefono varchar(11),
	mail varchar(30) default 'no tiene',
	montocompra decimal (6,2)
 )

 --4- Vea la información de las columnas "COLUMN_DEF" y "IS_NULLABLE":
	exec sp_columns visitantes

/*5- Ingrese algunos registros sin especificar valores para algunos campos para ver cómo opera la 
cláusula "default"*/

 insert into visitantes (nombre, domicilio, montocompra)
	values ('Susana Molina','Colon 123',59.80);
 insert into visitantes (nombre, edad, ciudad, mail)
	values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');
 select * from visitantes

--6- Use la palabra "default" para ingresar valores en un insert
 insert into visitantes
  values ('Antonio Garcia',44,default, 'Los mameyes 5643', default, default, 'antoniagracia@gmail,com', default)

--7- Ingrese un registro con "default values".

insert into visitantes default values

select * from visitantes


/*Segundo problema:
Una pequeña biblioteca de barrio registra los préstamos de sus libros en una tabla llamada 
"prestamos". En ella almacena la siguiente información: título del libro, documento de identidad del 
socio a quien se le presta el libro, fecha de préstamo, fecha en que tiene que devolver el libro y 
si el libro ha sido o no devuelto.
1- Elimine la tabla "prestamos" si existe*/

 if object_id('prestamos') is not null
  drop table prestamos

--2- Cree la tabla:
 create table prestamos
 (
	titulo varchar(40) not null,
	documento char(8) not null,
	fechaprestamo datetime not null,
	fechadevolucion datetime,
	devuelto char(1) default 'n'
 )

--3- Ingrese algunos registros omitiendo el valor para los campos que lo admiten

 insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion)
	values ('Manual de 1 grado','23456789','2006-12-15','2006-12-18');
 insert into prestamos (titulo,documento,fechaprestamo)
	values ('Alicia en el pais de las maravillas','23456789','2006-12-16');
 insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion)
	values ('El aleph','22543987','2006-12-16','2006-08-19');
 insert into prestamos (titulo,documento,fechaprestamo,devuelto)
	values ('Manual de geografia 5 grado','25555666','2006-12-18','s')

--4- Seleccione todos los registros

 select * from prestamos

--5- Ingrese un registro colocando "default" en los campos que lo admiten y vea cómo se almacenó.

insert into prestamos
	values('Matematica Basica', 78431, '2022-2-17', default, default)

--6- Intente ingresar un registro con "default values" y analice el mensaje de error (no se puede)

 insert into prestamos default values
 /*En este caso si ejecuramos la linea 637, va a tirar error porque tenemos campos que contiene 
 valores que no son nulo, y por ende aparece el error que no se puede insertar valores nulo*/

 -------------------------------------------------------------------------------------------------------------------
  /*22 - Columnas calculadas (operadores aritméticos y de concatenación)
  Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con 
ese nombre.
1- Elimine la tabla si existe */

 if object_id ('articulos') is not null
  drop table articulos

  --2- Cree la tabla:
 create table articulos
 (
	codigo int identity,
	nombre varchar(20),
	descripcion varchar(30),
	precio smallmoney,
	cantidad tinyint default 0,
	primary key (codigo)
 )

 --3- Ingrese algunos registros:

 insert into articulos (nombre, descripcion, precio,cantidad)
	values ('impresora','Epson Stylus C45',400.80,20);
 insert into articulos (nombre, descripcion, precio)
	values ('impresora','Epson Stylus C85',500);
 insert into articulos (nombre, descripcion, precio)
	values ('monitor','Samsung 14',800);
 insert into articulos (nombre, descripcion, precio,cantidad)
	values ('teclado','ingles Biswal',100,50)

/*4- El comercio quiere aumentar los precios de todos sus artículos en un 15%. Actualice todos los 
precios empleando operadores aritméticos.*/

update articulos set precio = precio + (precio * (15 / 100))

--5- Vea el resultado

select * from articulos

/*6- Muestre todos los artículos, concatenando el nombre y la descripción de cada uno de ellos 
separados por coma.*/

select nombre + ',' + descripcion from articulos

--7- Reste a la cantidad de todos los teclados, el valor 5, empleando el operador aritmético menos ("-")

update articulos set cantidad = cantidad - 5
	where nombre = 'teclado'
	select * from articulos

---------------------------------------------------------------------------------------------------
 
/*23 - Alias 
Primer problema:
Trabaje con la tabla "libros" de una librería.
1- Elimine la tabla si existe */

 if object_id ('libros') is not null
  drop table libros

--2- Cree la tabla:
 create table libros
 (
	codigo int identity,
	titulo varchar(40) not null,
	autor varchar(20) default 'Desconocido',
	editorial varchar(20),
	precio decimal(6,2),
	cantidad tinyint default 0,
	primary key (codigo)
 )

 --3- Ingrese algunos registros:

 insert into libros (titulo,autor,editorial,precio)
	values('El aleph','Borges','Emece',25);
 insert into libros
	values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
	values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50)

/*4- Muestre todos los campos de los libros y un campo extra, con el encabezado "monto total" en la 
que calcule el monto total en dinero de cada libro (precio por cantidad)*/

select titulo, autor, editorial, precio, cantidad,
precio * cantidad as 'Monto total' from libros


/*5- Muestre el título, autor y precio de todos los libros de editorial "Emece" y agregue dos columnas 
extra en las cuales muestre el descuento de cada libro, con el encabezado "descuento" y el precio 
con un 10% de descuento con el encabezado "precio final". */

 select titulo, autor, precio, precio*0.1 as descuento,
  precio-(precio*0.1) as 'precio final'
  from libros
	where editorial='Emece';

--6- Muestre una columna con el título y el autor concatenados con el encabezado "Título y autor"

 select titulo + ' - ' +autor as "Título y autor"
  from libros;

  select * from libros

  ----------------------------------------------------------------------------------------------------------
/*27 - Funciones para el uso de fechas y horas
Primer problema:
Una empresa almacena los datos de sus empleados en una tabla denominada "empleados".
1- Elimine la tabla si existe*/

 if object_id ('empleados') is not null
  drop table empleados 


--2- Cree la tabla
 create table empleados
 (
  nombre varchar(30) not null,
  apellido varchar(20) not null,
  documento char(8),
  fechanacimiento datetime,
  fechaingreso datetime,
  sueldo decimal(6,2),
  primary key(documento)
 )


--3- Ingrese algunos registros:

 insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
 insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
 insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
 insert into empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25);
 insert into empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98)

/*4- Muestre nombre y apellido concatenados, con el apellido en letras mayúsculas, el documento 
precedido por "DNI Nº " y el sueldo precedido por "$ ".	*/

 select nombre+space(1)+upper(apellido) as nombre,
  stuff(documento,1,0,'DNI Nº ') as documento,
  stuff(sueldo,1,0,'$ ') as sueldo from empleados

--5.  Muestre el documento y el sueldo redondeado hacia arriba y precedido por "$ ".

 select documento, stuff(ceiling(sueldo),1,0,'$ ')	as 'Saldo Redondeado'
	 from empleados

/* 6.  Muestre los nombres y apellidos de los empleados que cumplen años en el mes "october" (3 
registros)	*/

select nombre, apellido from empleados
	where DATENAME(month, fechanacimiento) = 'october'


/*-7. Muestre los nombres y apellidos de los empleados que ingresaron en un determinado año (2 
registros).	*/

select nombre, apellido 
	from empleados
		where DATEPART(year, fechaingreso) = 1998



/*28 - Ordenar registros (order by)
Primer problema:
En una página web se guardan los siguientes datos de las visitas: número de visita, nombre, mail, 
pais, fecha.
1- Elimine la tabla "visitas", si existe*/
 if object_id('visitas') is not null
  drop table visitas;

--2- Créela con la siguiente estructura:
 create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fecha datetime,
  primary key(numero)
);

--3- Ingrese algunos registros:
 insert into visitas (nombre,mail,pais,fecha)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

 --4- Ordene los registros por fecha, en orden descendente.
 select * from visitas
  order by fecha desc;
 /*5- Muestre el nombre del usuario, pais y el nombre del mes, ordenado por pais (ascendente) y nombre 
del mes (descendente)*/
 select nombre,pais,datename(month,fecha)
  from visitas
order by pais,datename(month,fecha) desc;

/*6- Muestre el pais, el mes, el día y la hora y ordene las visitas por nombre del mes, del día y la 
hora.*/

 select nombre,mail,
  datename(month,fecha) mes,
  datename(day,fecha) dia,
  datename(hour,fecha) hora
  from visitas
  order by 3,4,5;

/*7- Muestre los mail, país, ordenado por país, de todos los que visitaron la página en octubre (4 
registros)*/
 select mail, pais
  from visitas
  where datename(month,fecha)='October'
  order by 2;

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  /*29 - Operadores lógicos ( and - or - not)

 Primer problema:
Trabaje con la tabla llamada "medicamentos" de una farmacia
1- Elimine la tabla, si existe */
 if object_id('medicamentos') is not null
  drop table medicamentos;

--2- Cree la tabla con la siguiente estructura:
 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
 );

--3- Ingrese algunos registros:
 insert into medicamentos
  values('Sertal','Roche',5.2,100);
 insert into medicamentos
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos
  values('Amoxidal 500','Bayer',15.60,100);
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,200);
 insert into medicamentos
  values('Bayaspirina','Bayer',2.10,150); 
 insert into medicamentos
  values('Amoxidal jarabe','Bayer',5.10,250); 

/*4- Recupere los códigos y nombres de los medicamentos cuyo laboratorio sea 'Roche' y cuyo precio sea 
menor a 5 (1 registro cumple con ambas condiciones)*/
select codigo,nombre
  from medicamentos
  where laboratorio='Roche' and
  (precio<5);


  


--5- Recupere los medicamentos cuyo laboratorio sea 'Roche' o cuyo precio sea menor a 5 (4 registros):
 select * from medicamentos
  where laboratorio='Roche' or
  precio<5;
/*Note que el resultado es diferente al del punto 4, hemos cambiado el operador de la sentencia 
anterior.*/

/*6- Muestre todos los medicamentos cuyo laboratorio NO sea "Bayer" y cuya cantidad sea=100 (1 
registro)*/

 select * from medicamentos
  where not laboratorio='Bayer' and
  cantidad=100;

--7- Muestre todos los medicamentos cuyo laboratorio sea "Bayer" y cuya cantidad NO sea=100 (2 registros):
 select * from medicamentos
  where laboratorio='Bayer' and
  not cantidad=100;

/*Analice estas 2 últimas sentencias. El operador "not" afecta a la condición a la cual antecede, no a 
las siguientes. Los resultados de los puntos 6 y 7 son diferentes.
*/

/*8- Elimine todos los registros cuyo laboratorio sea igual a "Bayer" y su precio sea mayor a 10 (1 
registro eliminado)*/
delete from medicamentos
  where laboratorio='Bayer' and
  precio>10;


/*9- Cambie la cantidad por 200, a todos los medicamentos de "Roche" cuyo precio sea mayor a 5 (1 
registro afectado)*/
update medicamentos set cantidad=200
  where laboratorio='Roche' and
  (precio>5);

/*10- Borre los medicamentos cuyo laboratorio sea "Bayer" o cuyo precio sea menor a 3 (3 registros 
borrados)*/
 delete from medicamentos
  where laboratorio='Bayer' or
  precio<3;

  /*Segundo problema:
Trabajamos con la tabla "peliculas" de un video club que alquila películas en video.
1- Elimine la tabla, si existe*/

if object_id('peliculas') is not null
  drop table peliculas;

--2- Créela con la siguiente estructura:
 create table peliculas(
  codigo int identity,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion tinyint,
  primary key (codigo)
 );

--3- Ingrese algunos registros:
 insert into peliculas
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas
  values('Mujer bonita','Richard Gere',120);
 insert into peliculas
  values('Tootsie','D. Hoffman',90);
 insert into peliculas
  values('Un oso rojo','Julio Chavez',100);
 insert into peliculas
  values('Elsa y Fred','China Zorrilla',110);

--4- Recupere los registros cuyo actor sea "Tom Cruise" or "Richard Gere" (3 registros)

 select * from peliculas
  where actor='Tom Cruise' or
  actor='Richard Gere';


/*5- Recupere los registros cuyo actor sea "Tom Cruise" y duración menor a 100 (ninguno cumple ambas 
condiciones)*/

 select * from peliculas
  where actor='Tom Cruise' and
  duracion<100;

/*6- Cambie la duración a 200, de las películas cuyo actor sea "Daniel R." y cuya duración sea 180 (1 
registro afectado)*/

 update peliculas set duracion=200
  where actor='Daniel R.' and
  duracion=180;

/*7- Borre todas las películas donde el actor NO sea "Tom Cruise" y cuya duración sea mayor o igual a 
100 (2 registros eliminados)*/


 delete from peliculas
  where not actor='Tom Cruise' and
  duracion<=100;

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  /*54 - Crear y asociar reglas (create rule - sp_bindrule)

 Primer problema:
Una playa de estacionamiento almacena cada día los datos de los vehículos que ingresan en la tabla 
llamada "vehiculos".
1- Elimine la tabla, si existe*/
if object_id('vehiculos') is not null
  drop table vehiculos;

--2- Elimine las siguientes reglas:
 if object_id ('RG_patente_patron') is not null
   drop rule RG_patente_patron;
 if object_id ('RG_horallegada') is not null
   drop rule RG_horallegada;
 if object_id ('RG_vehiculos_tipo') is not null
   drop rule RG_vehiculos_tipo;
 if object_id ('RG_vehiculos_tipo2') is not null
   drop rule RG_vehiculos_tipo2;
 if object_id ('RG_menor_fechaactual') is not null
   drop rule RG_menor_fechaactual;

--3- Cree la tabla:
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );

--4- Ingrese algunos registros:
 insert into vehiculos values ('AAA111','a','1990-02-01 08:10',null);
 insert into vehiculos values ('BCD222','m','1990-02-01 08:10','1990-02-01 10:10');
 insert into vehiculos values ('BCD222','m','1990-02-01 12:00',null);
 insert into vehiculos values ('CC1234','a','1990-02-01 12:00',null);

/*5- Cree una regla para restringir los valores que se pueden ingresar en un campo "patente" (3 letras 
seguidas de 3 dígitos):*/

 create rule RG_patente_patron 
	as @patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]';


/*6- Ejecute el procedimiento almacenado del sistema "sp_help" para ver que la regla creada 
anteriormente existe:*/
 exec sp_help;

/*7- Ejecute el procedimiento almacenado del sistema "sp_helpconstraint" para ver que la regla creada 
anteriormente no está asociada aún a ningún campo de la tabla "vehiculos".*/
 exec sp_helpconstraint vehiculos;
 exec sp_bindrule RG_patente_patron,'vehiculos.patente';

/*8-  Asocie la regla al campo "patente":
Note que hay una patente que no cumple la regla, SQL Server NO controla los datos existentes, pero 
si controla las inserciones y actualizaciones:*/
 select * from empleados;

/*9- Intente ingresar un registro con valor para el campo "patente" que no cumpla con la regla.
aparece un mensaje de error indicando que hay conflicto con la regla y la inserción no se realiza.*/
 insert into vehiculos values ('FGHIJK','a','1990-02-01 18:00',null);
/*10- Cree otra regla que controle los valores para el campo "tipo" para que solamente puedan 
ingresarse los caracteres "a" y "m".*/

/*11- Asocie la regla al campo "tipo".*/

 exec sp_bindrule RG_vehiculos_tipo, 'vehiculos.tipo';

/*12- Intente actualizar un registro cambiando el valor de "tipo" a un valor que no cumpla con la 
regla anterior.
No lo permite.*/
 update vehiculos set tipo='c' where patente='AAA111';
/*13- Cree otra regla llamada "RG_vehiculos_tipo2" que controle los valores para el campo "tipo" para 
que solamente puedan ingresarse los caracteres "a", "c" y "m".*/

 create rule RG_vehiculos_tipo2
 as @tipo in ('a','c','m');

/*14- Si la asociamos a un campo que ya tiene asociada otra regla, la nueva regla reeemplaza la 
asociación anterior. Asocie la regla creada en el punto anterior al campo "tipo".*/
 exec sp_bindrule RG_vehiculos_tipo2, 'vehiculos.tipo';
--15- Actualice el registro que no pudo actualizar en el punto 12:
 update vehiculos set tipo='c' where patente='AAA111';

--16- Cree una regla que permita fechas menores o iguales a la actual.

 create rule RG_menor_fechaactual
 as @fecha <= getdate();
--17- Asocie la regla anterior a los campos "horallegada" y "horasalida":
 exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horallegada';
 exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horasalida';

--18- Ingrese un registro en el cual la hora de entrada sea posterior a la hora de salida:
 insert into vehiculos values ('NOP555','a','1990-02-01 10:10','1990-02-01 08:30');

/*19- Intente establecer una restricción "check" que asegure que la fecha y hora de llegada a la playa 
no sea posterior a la fecha y hora de salida:*/
 alter table vehiculos
 add constraint CK_vehiculos_llegada_salida
 check(horallegada<=horasalida);
--No lo permite porque hay un registro que no cumple la restricción.

--20- Elimine dicho registro:
 delete from vehiculos where patente='NOP555';

--21- Establezca la restricción "check" que no pudo establecer en el punto 19:
 alter table vehiculos
 add constraint CK_vehiculos_llegada_salida
 check(horallegada<=horasalida);

--22- Cree una restricción "default" que almacene el valor "b" en el campo "tipo:

 alter table vehiculos
 add constraint DF_vehiculos_tipo
 default 'b'
 for tipo;
/*Note que esta restricción va contra la regla asociada al campo "tipo" que solamente permite los 
valores "a", "c" y "m". SQL Server no informa el conflicto hasta que no intenta ingresar el valor 
por defecto.*/

--23- Intente ingresar un registro con el valor por defecto para el campo "tipo":
 insert into vehiculos values ('STU456',default,'1990-02-01 10:10','1990-02-01 15:30');
--No lo permite porque va contra la regla asociada al campo "tipo".

/*24- Vea las reglas asociadas a "empleados" y las restricciones aplicadas a la misma tabla ejecutando 
"sp_helpconstraint".
Muestra 1 restricción "check", 1 restricción "default" y 4 reglas asociadas.*/
 exec sp_helpconstraint vehiculos;

 -----------------------------------------------------------------------------------------------------------------------------------------------------------
 /*
55 - Eliminar y dasasociar reglas (sp_unbindrule - drop rule)

 Primer problema:
 Una playa de estacionamiento almacena cada día los datos de los vehículos que ingresan en la tabla 
llamada "vehiculos".*/

--1- Elimine la tabla, si existe:
 if object_id('vehiculos') is not null
  drop table vehiculos;

--2- Elimine las siguientes reglas, si existen:
 if object_id ('RG_patente_patron') is not null
   drop rule RG_patente_patron;
 if object_id ('RG_vehiculos_tipo') is not null
   drop rule RG_vehiculos_tipo;
 if object_id ('RG_vehiculos_tipo2') is not null
   drop rule RG_vehiculos_tipo2;

--3- Cree la tabla:
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );

/*4- Cree una regla para restringir los valores que se pueden ingresar en un campo "patente" (3 letras 
seguidas de 3 dígitos):*/
 create rule RG_patente_patron
 as @patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]';

--5-Asocie la regla al campo "patente":
 exec sp_bindrule RG_patente_patron,'vehiculos.patente';

--6- Intente ingresar un registro con valor para el campo "patente" que no cumpla con la regla:
 insert into vehiculos values ('FGHIJK','a','1990-02-01 18:00',null);
--aparece un mensaje de error indicando que hay conflicto con la regla y la inserción no se realiza.

/*7- Cree otra regla que controle los valores para el campo "tipo" para que solamente puedan 
ingresarse los caracteres "a" y "m":*/
 create rule RG_vehiculos_tipo
 as @tipo in ('a','m')

--8- Asocie la regla al campo "tipo":
 exec sp_bindrule RG_vehiculos_tipo, 'vehiculos.tipo';

--9- Intente ingresar un registro con el valor 'c' para "tipo":
 insert into vehiculos values('AAA111','c','2001-10-10 10:10',NULL);
--No lo permite.

/*10- Cree otra regla llamada "RG_vehiculos_tipo2" que controle los valores para el campo "tipo" para 
que solamente puedan ingresarse los caracteres "a", "c" y "m":*/
 create rule RG_vehiculos_tipo2
 as @tipo in ('a','c','m');

/*11- Si la asociamos a un campo que ya tiene asociada otra regla, la nueva regla reeemplaza la 
asociación anterior. Asocie la regla creada en el punto anterior al campo "tipo".*/
   exec sp_bindrule RG_vehiculos_tipo2, 'vehiculos.tipo';
--12- Ingrese el registro que no pudo ingresar en el punto 9.
insert into vehiculos values('AAA111','c','2001-10-10 10:10',NULL);
--13- Intente eliminar la regla "RG_vehiculos_tipo2".
drop rule RG_vehiculos_tipo2;

--No es posible porque está asociada a un campo de "vehiculos".

--14- Elimine la regla "RG_vehiculos_tipo".
 drop rule RG_vehiculos_tipo;
--Es posible porque no está asociada a ningún campo.

--15- Intente eliminar la regla "RG_patente_patron".
 drop rule RG_patente_patron;
--No es posible porque está asociada.

--16- Quite la asociación de la regla con el campo "patente" de "vehiculos".
 exec sp_unbindrule 'vehiculos.patente';
--17- Vea si la regla "RG_patente_patron" está asociada a algún campo de "vehiculos".
 exec sp_helpconstraint vehiculos;
--No lo está.

--18- Verifique que la regla aún existe en la base de datos activa:
 exec sp_help;
--aparece la regla.

--19- Elimine la regla que no pudo eliminar en el punto 15.
 drop rule RG_patente_patron;
/*20- Verifique que la regla ya no existe en la base de datos activa.
No aparece la regla "RG_patente_patron".*/
 exec sp_help;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
 /*
32 - Otros operadores relacionales (in)
Trabaje con la tabla llamada "medicamentos" de una farmacia.
1- Elimine la tabla, si existe: */
 if object_id('medicamentos') is not null
  drop table medicamentos;

--2- Cree la tabla con la siguiente estructura:
 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  primary key(codigo)
 );

--3- Ingrese algunos registros:
 insert into medicamentos
  values('Sertal','Roche',5.2,1,'2015-02-01');
 insert into medicamentos 
  values('Buscapina','Roche',4.10,3,'2016-03-01');
 insert into medicamentos 
  values('Amoxidal 500','Bayer',15.60,100,'2017-05-01');
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,20,'2018-02-01');
 insert into medicamentos 
  values('Bayaspirina','Bayer',2.10,150,'2019-12-01'); 
 insert into medicamentos 
  values('Amoxidal jarabe','Bayer',5.10,250,'2020-10-01'); 

--4- Recupere los nombres y precios de los medicamentos cuyo laboratorio sea "Bayer" o "Bago" 
--empleando el operador "in" (4 registros)
 select nombre,precio from medicamentos
  where laboratorio in ('Bayer','Bago');
/*5- Seleccione los remedios cuya cantidad se encuentre entre 1 y 5 empleando el operador "between" y 
luego el operador "in" (2 registros):*/
 select * from medicamentos
  where cantidad between 1 and 5;
 select * from medicamentos
  where cantidad in (1,2,3,4,5);
/*Note que es más conveniente emplear, en este caso, el operador ""between".
Ver solución*/
------------------------------------------------------------------------------------------------------------------------------
	  
/*57 - Valores predeterminados (create default)
Una empresa registra los datos de sus clientes en una tabla llamada "clientes".
1- Elimine la tabla si existe:*/
 if object_id ('clientes') is not null
  drop table clientes;

/*2- Recuerde que si elimina una tabla, las asociaciones de reglas y valores predeterminados de sus 
campos desaparecen, pero las reglas y valores predeterminados siguen existiendo. Si intenta crear 
una regla o un valor predeterminado con igual nombre que uno existente, aparecerá un mensaje 
indicándolo, por ello, debe eliminarlos (si existen) para poder crearlos nuevamente:*/
 if object_id ('VP_legajo_patron') is not null
   drop default VP_legajo_patron;
 if object_id ('RG_legajo_patron') is not null
   drop rule RG_legajo_patron;
 if object_id ('RG_legajo') is not null
   drop rule RG_legajo;
 if object_id ('VP_datodesconocido') is not null
   drop default VP_datodesconocido;
 if object_id ('VP_fechaactual') is not null
   drop default VP_fechaactual;

--3- Cree la tabla:
 create table clientes(
  legajo char(4),
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(15),
  provincia varchar(20) default 'Cordoba',
  fechaingreso datetime
 );

/*4- Cree una regla para establecer un patrón para los valores que se ingresen en el campo "legajo" (2 
letras seguido de 2 cifras) llamada "RG_legajo_patron":*/
create rule RG_legajo_patron
 as @valor like '[A-Z][A-Z][0-9][0-9]';

--5- Asocie la regla al campo "legajo".
exec sp_bindrule RG_legajo_patron,'clientes.legajo';

--6- Cree un valor predeterminado para el campo "legajo" ('AA00') llamado "VP_legajo_patron".
 create default VP_legajo_patron
  as 'AA00';
--7- Asócielo al campo "legajo".
--Recuerde que un campo puede tener un valor predeterminado y reglas asociados.
 exec sp_bindefault VP_legajo_patron,'clientes.legajo';


--8- Cree un valor predeterminado con la cadena "??" llamado "VP_datodesconocido".
 create default VP_datodesconocido
  as '??';
--9- Asócielo al campo "domicilio".
exec sp_bindefault VP_datodesconocido,'clientes.domicilio';
--10- Asócielo al campo "ciudad".
--Recuerde que un valor predeterminado puede asociarse a varios campos.
exec sp_bindefault VP_datodesconocido,'clientes.ciudad';

--11- Ingrese un registro con valores por defecto para los campos "domicilio" y "ciudad" y vea qué 
--almacenaron.
 insert into clientes values('GF12','Ana Perez',default,default,'Cordoba','2001-10-10');
 select * from clientes;


/*12- Intente asociar el valor predeterminado "VP_datodesconocido" al campo "provincia".
No se puede porque dicho campo tiene una restricción "default".*/
exec sp_bindefault VP_datodesconocido,'clientes.provincia';
--13- Cree un valor predeterminado con la fecha actual llamado "VP_fechaactual".
exec sp_bindefault VP_datodesconocido,'clientes.provincia';
--14- Asócielo al campo "fechaingreso".
 exec sp_bindefault VP_fechaactual,'clientes.fechaingreso';
--15- Ingrese algunos registros para ver cómo se almacenan los valores para los cuales no se insertan 
--datos.
insert into clientes default values;
 select * from clientes;

/*16- Asocie el valor predeterminado "VP_datodesconocido" al campo "fechaingreso".
Note que se asoció un valor predeterminado de tipo caracter a un campo de tipo "datetime"; SQL 
Server lo permite, pero al intentar ingresar el valor aparece un mensaje de error.*/

exec sp_bindefault VP_datodesconocido,'clientes.fechaingreso';

/*17- Ingrese un registro con valores por defecto.
No lo permite porque son de distintos tipos.*/

 insert into clientes default values;

--18- Cree una regla que entre en conflicto con el valor predeterminado "VP_legajo_patron".

 create rule RG_legajo
  as @valor like 'B%';

/*19- Asocie la regla al campo "legajo".
Note que la regla especifica que el campo "legajo" debe comenzar con la letra "B", pero el valor 
predeterminado tiene el valor "AA00"; SQL Server realiza la asociación, pero al intentar ingresar el 
valor predeterminado, no puede hacerlo y muestra un mensaje de error.*/

 exec sp_bindrule RG_legajo,'clientes.legajo';

/*20- Intente ingresar un registro con el valor "default" para el campo "legajo".
No lo permite porque al intentar ingresar el valor por defecto establecido con el valor 
predeterminado entra en conflicto con la regla "RG_legajo".*/

insert into clientes values (default,'Luis Garcia','Colon 876','Cordoba','Cordoba','2001-10-10');
------------------------------------------------------------------------------------------------------------------------------

 /*58 -Contar registros (count)
Una librería almacena los datos de sus libros en una tabla llamada "libros".
1- Elimine la tabla si existe: */

 if object_id ('libros') is not null
  drop table libros;

/*2- Recuerde que si elimina una tabla, las asociaciones de reglas y valores predeterminados de sus 
campos desaparecen, pero las reglas y valores predeterminados siguen existiendo. Si intenta crear 
una regla o un valor predeterminado con igual nombre que uno existente, aparecerá un mensaje 
indicándolo, por ello, debe eliminarlos (si existen) para poder crearlos nuevamente:*/
 if object_id ('VP_cero') is not null
   drop default VP_cero;
 if object_id ('VP_desconocido') is not null
   drop default VP_desconocido;
 if object_id ('RG_positivo') is not null
   drop rule RG_positivo;

--3- Cree la tabla:
 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  cantidad smallint
 );

--4- Cree una regla para impedir que se ingresen valores negativos, llamada "RG_positivo".
 create rule RG_positivo
 as @valor >=0;

--5- Asocie la regla al campo "precio".
 exec sp_bindrule RG_positivo,'libros.precio';

--6- Asocie la regla al campo "cantidad".
 exec sp_bindrule RG_positivo,'libros.cantidad';

--7- Cree un valor predeterminado para que almacene el valor cero, llamado "VP_cero".
 create default VP_cero
  as 0;

--8- Asócielo al campo "precio".

 exec sp_bindefault VP_cero,'libros.precio';

--9- Asócielo al campo "cantidad".
exec sp_bindefault VP_cero,'libros.cantidad';


--10- Cree un valor predeterminado con la cadena "Desconocido" llamado "VP_desconocido".
 create default VP_desconocido
  as 'Desconocido';


--11- Asócielo al campo "autor".
 exec sp_bindefault VP_desconocido,'libros.autor';

--12- Asócielo al campo "editorial".
 exec sp_bindefault VP_desconocido,'libros.editorial';

--13- Vea las reglas y valores predeterminados con "sp_help":
 exec sp_help;

/*14- Vea las reglas y valores predeterminados asociados a "libros".
Aparecen 6 filas, 2 corresponden a la regla "RG_positivo" asociadas a los campos "precio" y 
"cantidad"; 2 al valor predeterminado "VP_cero" asociados a los campos "precio" y "cantidad" y 2 al 
valor predeterminado "VP_desconocido" asociados a los campos "editorial" y "autor".*/
 exec sp_helpconstraint libros
--15- Ingrese un registro con valores por defecto para todos los campos, excepto "titulo" y vea qué se 
--almacenó.
insert into libros (titulo) values('Aprenda PHP');
 select * from libros;

--15- Quite la asociación del valor predeterminado "VP_cero" al campo "precio".
 exec sp_unbindefault 'libros.precio';


--16- Ingrese otro registro con valor predeterminado para el campo "precio" y vea cómo se almacenó.
insert into libros (titulo) values('Matematica estas ahi');
 select * from libros;

/*17- Vea las reglas y valores predeterminados asociados a "libros".
5 filas; el valor predeterminado "VP_cero" ya no está asociado al campo "precio".*/
exec sp_helpconstraint libros;

--18- Verifique que el valor predeterminado "VP_cero" existe aún en la base de datos.
 exec sp_help VP_cero;

/*19- Intente eliminar el valor predeterminado "VP_cero".
No se puede porque está asociado al campo "cantidad".*/
 drop default VP_cero;
--20- Quite la asociación del valor predeterminado "VP_cero" al campo "cantidad".
 exec sp_unbindefault 'libros.cantidad';

--21- Verifique que ya no existe asociación de este valor predeterminado con la tabla "libros".
--4 filas.
 exec sp_helpconstraint libros;
--22- Verifique que el valor predeterminado "VP_cero" aun existe en la base de datos.
 exec sp_help VP_cero;
--23- Elimine el valor predeterminado "VP_cero".
drop default VP_cero;
--24- Verifique que ya no existe en la base de datos.
--Ver solución
 exec sp_help VP_cero;
 ------------------------------------------------------------------------------------------------------------------------------
/*
40-Funciones de agrupamiento (count - sum - min - max - avg)
Un comercio guarda la información de sus ventas en una tabla llamada "ventas" en la que se registra 
diariamente, el número de venta, el monto total de la compra, el tipo de pago (c=contado, t=tarjeta) 
y el nombre del vendedor.
1- Elimine la tabla si existe:*/
 if object_id('ventas') is not null
  drop table ventas;

--2- Cree la tabla:
 create table ventas(
  numero int identity,
  montocompra decimal(6,2),
  tipopago char(1),--c=contado, t=tarjeta
  vendedor varchar(30),
  primary key (numero)
 );

--3- Ingrese algunos registros:
 insert into ventas
  values(100.50,'c','Marisa Perez');
 insert into ventas
  values(200,'c','Marisa Perez');
 insert into ventas
  values(50,'t','Juan Lopez');
 insert into ventas
  values(220,'c','Juan Lopez');
 insert into ventas
  values(150,'t','Marisa Perez');
 insert into ventas
  values(550.80,'c','Marisa Perez');
 insert into ventas
  values(300,'t','Juan Lopez');
 insert into ventas
  values(25,'c','Marisa Perez');

/*4- Agrupe por "tipopago" y "vendedor" y cuente la cantidad empleando "rollup".
Las agrupaciones de resumen son las siguientes:
- vendedor (tipopago seteado a "null"), 2 filas y
- total (todos los campos seteados a "null"), 1 fila*/
select vendedor,tipopago,
  count(*) as cantidad
  from ventas
  group by vendedor,tipopago
  with rollup;
/*5- Agrupe por "tipopago" y "vendedor" y cuente la cantidad empleando "cube".
Las agrupaciones de resumen son las siguientes:
- vendedor (tipopago seteado a "null"), 2 filas,
- total (todos los campos seteados a "null"), 1 fila y
- tipopago (vendedor seteado a "null"), 2 filas.*/
 select vendedor,tipopago,
  count(*) as cantidad
  from ventas
  group by vendedor,tipopago
  with cube;
   ------------------------------------------------------------------------------------------------------------------------------


--Una empresa tiene registrados sus empleados en una tabla llamada "empleados".
--1- Elimine la tabla si existe:
 if object_id('empleados') is not null
  drop table empleados;

--2- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  sexo char(1),
  estadocivil char(1),--c=casado, s=soltero,v=viudo
  seccion varchar(20),
  primary key (documento)
 );

--3- Ingrese algunos registros:
 insert into empleados
  values ('22222222','Alberto Lopez','m','c','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','f','c','Administracion');
 insert into empleados
  values ('24444444','Carlos Fuentes','m','s','Administracion');
 insert into empleados
  values ('25555555','Daniel Garcia','m','s','Sistemas');
 insert into empleados
  values ('26666666','Ester Juarez',null,'c','Sistemas');
 insert into empleados
  values ('27777777','Fabian Torres',null,'s','Sistemas');
 insert into empleados
  values ('28888888','Gabriela Lopez','f',null,'Sistemas');
 insert into empleados
  values ('29999999','Hector Garcia','m',null,'Administracion');

/*4- Cuente la cantidad de empleados agrupados por sexo y estado civil, empleando "rollup".
Es dificil distinguir los valores de detalle y resumen.*/
 select sexo,estadocivil,
  count(*) as cantidad
  from empleados
  group by sexo,estadocivil
  with rollup;
/*5- Realice la misma consulta anterior pero emplee la función "grouping" para los dos campos por los 
que se agrupa para distinguir los valores de resumen y de detalle.
Note que las columnas de resumen contienen 1 y las de detalle 0.*/
select sexo,estadocivil,
  count(*) as cantidad,
  grouping(sexo) as 'resumen sexo',
  grouping(estadocivil) as 'resumen estado civil'
  from empleados
  group by sexo,estadocivil
  with rollup;

/*6- Realice la misma consulta anterior pero con "cube" en lugar de "rollup", distinguiendo los 
valores de resumen y de detalle.
Note que las columnas de resumen contienen 1 y las de detalle 0.*/
select sexo,estadocivil,
  count(*) as cantidad,
  grouping(sexo) as 'resumen sexo',
  grouping(estadocivil) as 'resumen estado civil'
  from empleados
  group by sexo,estadocivil
  with cube;
     ------------------------------------------------------------------------------------------------------------------------------

--Una empresa tiene registrados sus clientes en una tabla llamada "clientes".
--1- Elimine la tabla "clientes", si existe
if object_id('clientes') is not null
drop table clientes;

--2- Crear la tabla Cliente:
create table clientes (
codigo int identity,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(20),
provincia varchar (20),
telefono varchar(11),
primary key(codigo)
);

--3- Ingrese algunos registros:
insert into clientes
values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');
insert into clientes
values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
insert into clientes
values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
insert into clientes
values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);
insert into clientes
values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');
insert into clientes
values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');
insert into clientes
values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');
insert into clientes
values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);
insert into clientes
values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');
insert into clientes
values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

--4- Obtenga el total de los registros agrupados por ciudad y provincia (6 filas)
select ciudad, provincia,
count(*) as Total
from clientes
group by ciudad,provincia;

--5- Obtenga el total de los registros
--agrupados por ciudad y provincia sin considerar los que tienen
--menos de 2 clientes (3 filas)
select ciudad, provincia,
count(*) as cantidad
from clientes
group by ciudad,provincia
having count(*)>1;

/*6- Obtenga el total de los clientes que viven en calle
"San Martin" (where), agrupados por provincia
(group by), teniendo en cuenta todos los valores (all),
de aquellas ciudades que tengan menos de 2
clientes (having) y omitiendo la fila correspondiente
a la ciudad de "Cordoba" (having) (4 filas
devueltas) */

select ciudad, count(*)
from clientes
where domicilio like '%San Martin%'
group by all ciudad
having count(*)<2 and
ciudad <> 'Cordoba';


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--38 Registros duplicados (distinct)
--Una empresa tiene registrados sus clientes en una tabla llamada "clientes".
--1- Elimine la tabla "clientes", si existe:
 if object_id('clientes') is not null
  drop table clientes;

--2- Créela con la siguiente estructura:
 create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  primary key(codigo)
);

--3- Ingrese algunos registros:
 insert into clientes
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
 insert into clientes
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
 insert into clientes
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
 insert into clientes
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
 insert into clientes
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
 insert into clientes
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
 insert into clientes
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
 insert into clientes
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
 insert into clientes
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

--4- Obtenga las provincias sin repetir (3 registros)
 select distinct provincia from clientes;

--5- Cuente las distintas provincias
 select count(distinct provincia) as cantidad
  from clientes;

--6- Se necesitan los nombres de las ciudades sin repetir (6 registros)
 select distinct ciudad from clientes;

--7-  Obtenga la cantidad de ciudades distintas.
 select count(distinct ciudad) from clientes;

--8- Combine con "where" para obtener las distintas 
--ciudades de la provincia de Cordoba (3 registros)
  select distinct ciudad from clientes
  where provincia='Cordoba';

--9- Contamos las distintas ciudades de cada provincia empleando "group by" (3 registros)
 select provincia,count(distinct ciudad)
  from clientes
  group by provincia;


  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--39- Cláusula top
--Una empresa tiene registrados sus empleados en una tabla llamada "empleados".
--1- Elimine la tabla si existe
if object_id('empleados') is not null
  drop table empleados;

--2- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  estadocivil char(1),--c=casado, s=soltero,v=viudo
  seccion varchar(20)
 );

--3- Ingrese algunos registros:
 insert into empleados
  values ('22222222','Alberto Lopez','c','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','c','Administracion');
 insert into empleados
  values ('24444444','Carlos Fuentes','s','Administracion');
 insert into empleados
  values ('25555555','Daniel Garcia','s','Sistemas');
 insert into empleados
  values ('26666666','Ester Juarez','c','Sistemas');
 insert into empleados
  values ('27777777','Fabian Torres','s','Sistemas');
 insert into empleados
  values ('28888888','Gabriela Lopez',null,'Sistemas');
 insert into empleados
  values ('29999999','Hector Garcia',null,'Administracion');

--4- Muestre los 5 primeros registros (5 registros)
select top 5 * from empleados;


--5- Muestre nombre y seccion de los 4 primeros
--registros ordenados por sección (4 registros)
select top 4 nombre,seccion
  from empleados
  order by seccion;


--6- Realice la misma consulta anterior pero incluya 
--todos los registros que tengan el mismo valor en 
--"seccion" que el último (8 registros)
select top 4 with ties nombre,seccion
  from empleados
  order by seccion;


--7- Muestre nombre, estado civil y seccion de los 
--primeros 4 empleados ordenados por estado civil y 
--sección (4 registros)

 select top 4 nombre,estadocivil,seccion
  from empleados
  order by estadocivil,seccion;


--8- Realice la misma consulta anterior pero
--incluya todos los valores iguales al último registro 
--retornado (5 registros)
 select top 4 with ties nombre,estadocivil,seccion
  from empleados
  order by estadocivil,seccion;


--40  Eliminar restricciones (alter table - drop)
--Una playa de estacionamiento almacena cada día los datos de los vehículos que ingresan en la tabla 
--llamada "vehiculos".


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--1- Elimine la tabla, si existe:
 if object_id('vehiculos') is not null
  drop table vehiculos;

--2- Cree la tabla
create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );

 --3- Establezca una restricción "check" que admita solamente
 --los valores "a" y "m" para el campo "tipo":
 alter table vehiculos
 add constraint CK_vehiculos_tipo
 check (tipo in ('a','m'));

--4- Establezca una restricción "default" para el campo "tipo" que almacene el valor "a" en caso de no 
--ingresarse valor para dicho campo:
 alter table vehiculos
  add constraint DF_vehiculos_tipo
  default 'a'
  for tipo;

--5- Establezca una restricción "check" para el campo 
--"patente" para que acepte 3 letras seguidas de 3 dígitos:

 alter table vehiculos
 add constraint CK_vehiculos_patente_patron
 check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

--6- Agregue una restricción "primary key" que 
--incluya los campos "patente" y "horallegada":

 alter table vehiculos
 add constraint PK_vehiculos_patentellegada
 primary key(patente,horallegada);

--7- Ingrese un vehículo:
 insert into vehiculos values('SDR456','a','2005/10/10 10:10',null);

--8- Intente ingresar un registro repitiendo la clave primaria:
 insert into vehiculos values('SDR456','m','2005/10/10 10:10',null);

--9- Ingrese un registro repitiendo la patente pero no la hora de llegada:
 insert into vehiculos values('SDR456','m','2005/10/10 12:10',null);

--10- Ingrese un registro repitiendo la hora de llegada pero no la patente:
 insert into vehiculos values('SDR111','m','2005/10/10 10:10',null);

--11- Vea todas las restricciones para la tabla "vehiculos":
 exec sp_helpconstraint vehiculos;

--aparecen 4 filas, 2 correspondientes a restricciones 
--"check", 1 a "default" y 1 a "primary key".

--12- Elimine la restricción "default" del campo "tipo".
alter table vehiculos
  drop DF_vehiculos_tipo;

--13- Vea si se ha eliminado:
 exec sp_helpconstraint vehiculos;

--14- Elimine la restricción "primary key" y "check".
 alter table vehiculos
  drop PK_vehiculos_patentellegada, CK_vehiculos_tipo;

--15- Vea si se han eliminado:
 exec sp_helpconstraint vehiculos;

 ---------------------------------------------------------------------------------------------------------------------------------------------------------------


--42- Combinacion Interna (Inner join)
--Una empresa tiene registrados sus clientes en una
--tabla llamada "clientes", también tiene una tabla 
--"provincias" donde registra los nombres de las provincias.
--1- Elimine las tablas "clientes" y "provincias", si existen:
if (object_id('clientes')) is not null
   drop table clientes;
  if (object_id('provincias')) is not null
   drop table provincias;

--2- Créelas con las siguientes estructuras:
 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 );
 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

--3- Ingrese algunos registros para ambas tablas:
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values ('Torres Fabiola','Alem 777','Ibera',3);


 --4- 4- Obtenga los datos de ambas tablas, usando alias:
 select c.nombre,domicilio,ciudad,p.nombre
  from clientes as c
  join provincias as p
  on c.codigoprovincia=p.codigo;


--5- Obtenga la misma información anterior pero ordenada por nombre de provincia.
 select c.nombre,domicilio,ciudad,p.nombre
  from clientes as c
  join provincias as p
  on c.codigoprovincia=p.codigo
  order by p.nombre;


--6- Recupere los clientes de la provincia "Santa Fe" (2 registros devueltos)
 select c.nombre,domicilio,ciudad
  from clientes as c
  join provincias as p
  on c.codigoprovincia=p.codigo
  where p.nombre='Santa Fe';

   -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--43- Combinación externa izquierda (left join)
--1- Elimine las tablas "clientes" y "provincias", si existen y cree las tablas:
  if (object_id('clientes')) is not null
   drop table clientes;
  if (object_id('provincias')) is not null
   drop table provincias;

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

--2- Ingrese algunos registros para ambas tablas:
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

--3- Muestre todos los datos de los clientes, incluido el nombre de la provincia:
 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo;

--4- Realice la misma consulta anterior pero alterando el orden de las tablas:
 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  left join clientes as c
  on codigoprovincia = p.codigo;

--5- Muestre solamente los clientes de las provincias que existen en "provincias" (5 registros):
 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.codigo is not null;

--6- Muestre todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por 
--nombre del cliente (2 registros):
 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.codigo is null
  order by c.nombre;

--7- Obtenga todos los datos de los clientes de "Cordoba" (3 registros):
 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.nombre='Cordoba';


 	 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--44- Combinación externa derecha (right join)
--1- Elimine las tablas "clientes" y "provincias", si existen y cree las tablas:

--
  if (object_id('clientes')) is not null
   drop table clientes;
  if (object_id('provincias')) is not null
   drop table provincias;

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

--2- Ingrese algunos registros para ambas tablas:
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

--3- Muestre todos los datos de los clientes, incluido
--el nombre de la provincia empleando un "right join".
 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo;

--4- Obtenga la misma salida que la consulta anterior pero empleando un "left join".
 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo;

--5- Empleando un "right join", muestre solamente los clientes 
--de las provincias que existen en "provincias" (5 registros)
 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo
  where p.codigo is not null;

--6- Muestre todos los clientes cuyo código de provincia 
--NO existe en "provincias" ordenados por ciudad (2 registros)
 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo
  where p.codigo is null
  order by ciudad;

  -----------------------------------------------------------------------------------------------------------------------------------------------------------

--45-  Combinación externa completa (full join)
/*Un club dicta clases de distintos deportes. Almacena
la información en una tabla llamada "deportes" 
en la cual incluye el nombre del deporte y el 
nombre del profesor y en otra tabla llamada 
"inscriptos" que incluye el documento del socio 
que se inscribe, el deporte y si la matricula está 
paga o no.*/

--1- Elimine las tablas si existen y cree las tablas:
 if (object_id('deportes')) is not null
  drop table deportes;
 if (object_id('inscriptos')) is not null
  drop table inscriptos;
 create table deportes(
  codigo tinyint identity,
  nombre varchar(30),
  profesor varchar(30),
  primary key (codigo)
 );
 create table inscriptos(
  documento char(8),
  codigodeporte tinyint not null,
  matricula char(1) --'s'=paga 'n'=impaga
 );

--2- Ingrese algunos registros para ambas tablas:
 insert into deportes values('baseball','Edwar Frias');
 insert into deportes values('Atletismo','Usaint Bolt');
 insert into deportes values('basquet','Marcelo Gonzalez');
 insert into deportes values('futbol','Ezequiel Jimenez');
 
 insert into inscriptos values('22222222',3,'s');
 insert into inscriptos values('23333333',3,'s');
 insert into inscriptos values('24444444',3,'n');
 insert into inscriptos values('22222222',2,'s');
 insert into inscriptos values('23333333',2,'s');
 insert into inscriptos values('22222222',4,'n'); 
 insert into inscriptos values('22222222',5,'n'); 

--3- Muestre todos la información de la tabla "inscriptos",
--y consulte la tabla "deportes" para 
--obtener el nombre de cada deporte (6 registros)
 select documento,d.nombre,matricula
  from inscriptos as i
  join deportes as d
  on codigodeporte=codigo;

--4- Empleando un "left join" con "deportes" obtenga 
--todos los datos de los inscriptos (7 registros)
 select documento,d.nombre,matricula
  from inscriptos as i
  left join deportes as d
  on codigodeporte=codigo;

--5- Obtenga la misma salida anterior empleando un "rigth join".
 select documento,d.nombre,matricula
  from deportes as d
  right join inscriptos as i
  on codigodeporte=codigo;

--6- Muestre los deportes para los cuales no hay inscriptos,
--empleando un "left join" (1 registro)
 select nombre
  from deportes as d
  left join inscriptos as i
  on codigodeporte=codigo
  where codigodeporte is null;

--7- Muestre los documentos de los inscriptos a deportes 
--que no existen en la tabla "deportes" (1 registro)'
 select documento
  from inscriptos as i
  left join deportes as d
  on codigodeporte=codigo
  where codigo is null;

--8- Emplee un "full join" para obtener todos los datos
--de ambas tablas, incluyendo las inscripciones 
--a deportes inexistentes en "deportes" y los
--deportes que no tienen inscriptos (8 registros)
 select documento,nombre,profesor,matricula
  from inscriptos as i
  full join deportes as d
  on codigodeporte=codigo; 

----------------------------------------------------------------------------------------------------------------------------------------------------

--46- Combinaciones cruzadas (cross join)
/*Una agencia matrimonial almacena la información 
de sus clientes de sexo femenino en una tabla 
llamada "mujeres" y en otra la de sus
clientes de sexo masculino llamada "varones"*/
--Primera Parte:
--1- Elimine las tablas si existen y créelas:
 if object_id('mujeres') is not null
  drop table mujeres;
 if object_id('varones') is not null
  drop table varones;
 create table mujeres(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );
 create table varones(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );

--2- Ingrese los siguientes registros:
 insert into mujeres values('Maria Lopez','Colon 123',45);
 insert into mujeres values('Liliana Garcia','Sucre 456',35);
 insert into mujeres values('Susana Lopez','Avellaneda 98',41);

 insert into varones values('Juan Torres','Sarmiento 755',44);
 insert into varones values('Marcelo Oliva','San Martin 874',56);
 insert into varones values('Federico Pereyra','Colon 234',38);
 insert into varones values('Juan Garcia','Peru 333',50);

--3- La agencia necesita la combinación de todas 
--las personas de sexo femenino con las de sexo 
--masculino. Use un "cross join" (12 registros)
select m.nombre,m.edad,v.nombre,v.edad
  from mujeres as m
  cross join varones as v;

--4- Realice la misma combinación pero considerando
--solamente las personas mayores de 40 años (6 registros)
 select m.nombre,m.edad,v.nombre,v.edad
  from mujeres as m
  cross join varones as v
  where m.edad>40 and
  v.edad>40;

--5- Forme las parejas pero teniendo en cuenta 
--que no tengan una diferencia superior a 10 años (8 registros)
 select m.nombre,m.edad,v.nombre,v.edad
  from mujeres as m
  cross join varones as v
  where m.edad-v.edad between -10 and 10;

--Segunda Parte:
/*Una empresa de seguridad almacena los datos de sus
guardias de seguridad en una tabla llamada 
"guardias". también almacena los distintos
sitios que solicitaron sus servicios en una tabla llamada "tareas".*/
--1- Elimine las tablas "guardias" y "tareas" si existen:
 if object_id('guardias') is not null
  drop table guardias;
 if object_id('tareas') is not null
  drop table tareas;

--2- Cree las tablas:
 create table guardias(
  documento char(8),
  nombre varchar(30),
  sexo char(1), /* 'f' o 'm' */
  domicilio varchar(30),
  primary key (documento)
 );

 create table tareas(
  codigo tinyint identity,
  domicilio varchar(30),
  descripcion varchar(30),
  horario char(2), /* 'AM' o 'PM'*/
  primary key (codigo)
 );

--3- Ingrese los siguientes registros:
 insert into guardias values('22333444','Juan Perez','m','Colon 123');
 insert into guardias values('24333444','Alberto Torres','m','San Martin 567');
 insert into guardias values('25333444','Luis Ferreyra','m','Chacabuco 235');
 insert into guardias values('23333444','Lorena Viale','f','Sarmiento 988');
 insert into guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

 insert into tareas values('Colon 1111','vigilancia exterior','AM');
 insert into tareas values('Urquiza 234','vigilancia exterior','PM');
 insert into tareas values('Peru 345','vigilancia interior','AM');
 insert into tareas values('Avellaneda 890','vigilancia interior','PM');

/*-4- La empresa quiere que todos sus empleados realicen
todas las tareas. Realice una "cross join" (20 
registros)*/
 select nombre,t.domicilio,descripcion
  from guardias
  cross join tareas as t;


/*5- En este caso, la empresa quiere que todos los guardias 
de sexo femenino realicen las tareas de "vigilancia interior" 
y los de sexo masculino de "vigilancia exterior". Realice una "cross join" con 
un "where" que controle tal requisito (10 registros)*/
 select nombre,t.domicilio,descripcion
  from guardias as g
  cross join tareas as t
  where (g.sexo='f' and t.descripcion='vigilancia interior') or
  (g.sexo='m' and t.descripcion='vigilancia exterior');
		
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--47- Combinación de más de dos tablas
/*Un club dicta clases de distintos deportes. En una
tabla llamada "socios" guarda los datos de los 
socios, en una tabla llamada "deportes" la información
referente a los diferentes deportes que se 
dictan y en una tabla denominada "inscriptos", 
las inscripciones de los socios a los distintos deportes.
Un socio puede inscribirse en varios deportes el 
mismo año. Un socio no puede inscribirse en el 
mismo deporte el mismo año. Distintos socios
se inscriben en un mismo deporte en el mismo año.*/
--1- Elimine las tablas si existen:

 if object_id('socios') is not null
  drop table socios;
 if object_id('deportes') is not null
  drop table deportes;
 if object_id('inscriptos') is not null
  drop table inscriptos;

--2- Cree las tablas con las siguientes estructuras:
 create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );
 create table deportes(
  codigo tinyint identity,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
 );
 create table inscriptos(
  documento char(8) not null, 
  codigodeporte tinyint not null,
  anio char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,anio)
 );

--3- Ingrese algunos registros en "socios":
  insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');
--4- Ingrese algunos registros en "deportes":
 insert into deportes values('basquet','Juan Juarez');
 insert into deportes values('futbol','Pedro Perez');
 insert into deportes values('natacion','Marina Morales');
 insert into deportes values('tenis','Marina Morales');

--5- Inscriba a varios socios en el mismo deporte en el mismo año:
 insert into inscriptos values ('22222222',3,'2006','s');
 insert into inscriptos values ('23333333',3,'2006','s');
 insert into inscriptos values ('24444444',3,'2006','n');

--6- Inscriba a un mismo socio en el mismo deporte en distintos años:
 insert into inscriptos values ('22222222',3,'2005','s');
 insert into inscriptos values ('22222222',3,'2007','n');

--7- Inscriba a un mismo socio en distintos deportes el mismo año:
insert into inscriptos values ('24444444',1,'2006','s');
 insert into inscriptos values ('24444444',2,'2006','s');
--8- Ingrese una inscripción con un código de deporte 
--inexistente y un documento de socio que no exista en "socios":
  insert into inscriptos values ('26666666',0,'2006','s');


--9- Muestre el nombre del socio, el nombre del deporte
--en que se inscribió y el año empleando diferentes tipos de join.
 select s.nombre,d.nombre,anio
  from deportes as d
  right join inscriptos as i
  on codigodeporte=d.codigo
  left join socios as s
  on i.documento=s.documento;

/*10- Muestre todos los datos de las inscripciones 
(excepto los códigos) incluyendo aquellas 
inscripciones cuyo código de deporte no existe 
en "deportes" y cuyo documento de socio no se 
encuentra en "socios".*/
 select s.nombre,d.nombre,anio,matricula
  from deportes as d
  full join inscriptos as i
  on codigodeporte=d.codigo
  full join socios as s
  on s.documento=i.documento;

--11- Muestre todas las inscripciones del socio con documento "1222".
 select s.nombre,d.nombre,anio,matricula
  from deportes as d
  join inscriptos as i
  on codigodeporte=d.codigo
  join socios as s
  on s.documento=i.documento
  where s.documento='22222222';

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
81 - Restricciones al crear la tabla
Primer problema:
Un club de barrio tiene en su sistema 4 tablas:
- "socios": en la cual almacena documento, número, nombre y domicilio de cada socio;
- "deportes": que guarda un código, nombre del deporte, día de la semana que se dicta y documento 
del profesor instructor;
- "profesores": donde se guarda el documento, nombre y domicilio de los profesores e
- "inscriptos": que almacena el número de socio, el código de deporte y si la matricula está paga o 
no 
1- Elimine las tablas si existen:*/


 if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;
 if object_id('profesores') is not null
  drop table profesores;
 if object_id('deportes') is not null
  drop table deportes;

/*2- Considere que:
- un socio puede inscribirse en varios deportes, pero no dos veces en el mismo.
- un socio tiene un documento único y un número de socio único.
- el documento del socio debe contener 8 dígitos.
- un deporte debe tener asignado un profesor que exista en "profesores" o "null" si aún no tiene un 
instructor definido.
- el campo "dia" de "deportes" puede ser: lunes, martes, miercoles, jueves, viernes o sabado.
- el campo "dia" de "deportes" por defecto debe almacenar 'sabado'.
- un profesor puede ser instructor de varios deportes o puede no dictar ningún deporte.
- un profesor no puede estar repetido en "profesores".
- el documento del profesor debe contener 8 dígitos.
- un inscripto debe ser socio, un socio puede no estar inscripto en ningún deporte.
- una inscripción debe tener un valor en socio existente en "socios" y un deporte que exista en 
"deportes".
- el campo "matricula" de "inscriptos" debe aceptar solamente los caracteres 's' o 'n'.
3- Cree las tablas con las restricciones necesarias*/

create table profesores(
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  constraint CK_profesores_documento_patron check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  constraint PK_profesores_documento
   primary key (documento)
 );

 create table deportes(
  codigo tinyint identity,
  nombre varchar(20) not null,
  dia varchar(30)
   constraint DF_deportes_dia default('sabado'),
  profesor char(8),--documento del profesor
  constraint CK_deportes_dia_lista check (dia in ('lunes','martes','miercoles','jueves','viernes','sabado')),
  constraint PK_deportes_codigo
   primary key (codigo)
 );

 create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  constraint CK_documento_patron check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  constraint PK_socios_numero
   primary key nonclustered(numero),
  constraint UQ_socios_documento
   unique clustered(documento)
 );

 create table inscriptos(
  numerosocio int not null,
  codigodeporte tinyint,
  matricula char(1),
  constraint PK_inscriptos_numerodeporte
   primary key clustered (numerosocio,codigodeporte),
  constraint FK_inscriptos_deporte
   foreign key (codigodeporte)
   references deportes(codigo)
   on update cascade,
  constraint FK_inscriptos_socios
   foreign key (numerosocio)
   references socios(numero)
   on update cascade
   on delete cascade,
  constraint CK_matricula_valores check (matricula in ('s','n'))
)

--4- Ingrese registros en "profesores":
 insert into profesores values('21111111','Andres Acosta','Avellaneda 111');
 insert into profesores values('22222222','Betina Bustos','Bulnes 222');
 insert into profesores values('23333333','Carlos Caseros','Colon 333');

/*5- Ingrese registros en "deportes". Ingrese el mismo día para distintos deportes, un deporte sin día 
confirmado, un deporte sin profesor definido:*/

 insert into deportes values('basquet','lunes',null);
 insert into deportes values('futbol','lunes','23333333');
 insert into deportes values('natacion',null,'22222222');
 insert into deportes values('padle',default,'23333333');
 insert into deportes (nombre,dia) values('tenis','jueves');

--6- Ingrese registros en "socios":
 insert into socios values('30111111','Ana Acosta','America 111');
 insert into socios values('30222222','Bernardo Bueno','Bolivia 222');
 insert into socios values('30333333','Camila Conte','Caseros 333');
 insert into socios values('30444444','Daniel Duarte','Dinamarca 444');

/*7- Ingrese registros en "inscriptos". Inscriba a un socio en distintos deportes, inscriba varios 
socios en el mismo deporte.*/
 insert into inscriptos values(1,3,'s');
 insert into inscriptos values(1,5,'s');
 insert into inscriptos values(2,1,'s');
 insert into inscriptos values(4,1,'n');
 insert into inscriptos values(4,4,'s');

 /*8- Realice un "join" (del tipo que sea necesario) para mostrar todos los datos del socio junto con 
el nombre de los deportes en los cuales está inscripto, el día que tiene que asistir y el nombre del 
profesor que lo instruirá.
5 registros.*/

 select s.*,d.nombre as deporte,d.dia,p.nombre as profesor
  from socios as s
  join inscriptos as i
  on numero=i.numerosocio
  join deportes as d
  on d.codigo=i.codigodeporte
  left join profesores as p
  on d.profesor=p.documento;

  /*9- Realice la misma consulta anterior pero incluya los socios que no están inscriptos en ningún 
deporte.
6 registros.*/

 select s.*,d.nombre as deporte,d.dia,p.nombre as profesor
  from socios as s
  full join inscriptos as i
  on numero=i.numerosocio
  left join deportes as d
  on d.codigo=i.codigodeporte
  left join profesores as p
  on d.profesor=p.documento;

  /*10- Muestre todos los datos de los profesores, incluido el deporte que dicta y el día, incluyendo 
los profesores que no tienen asignado ningún deporte. 
4 registros.*/

 select p.*,d.nombre as deporte,d.dia
  from profesores as p
  left join deportes as d
  on d.profesor=p.documento;

/*11- Muestre todos los deportes y la cantidad de inscriptos, incluyendo aquellos deportes para los 
cuales no hay inscriptos.
5 registros.*/

select d.nombre,count(i.codigodeporte) as cantidad
  from deportes as d
  left join inscriptos as i
  on d.codigo=i.codigodeporte
  group by d.nombre;  

/*12- Muestre las restricciones de "socios".
3 restricciones y 1 "foreign key" de "inscriptos" que la referencia.*/

exec sp_helpconstraint socios;

/*13- Muestre las restricciones de "deportes".
3 restricciones y 1 "foreign key" de "inscriptos" que la referencia.*/
 exec sp_helpconstraint deportes;

/*14- Muestre las restricciones de "profesores".
2 restricciones. */
exec sp_helpconstraint profesores;

/*15- Muestre las restricciones de "inscriptos".
4 restricciones.*/
 exec sp_helpconstraint inscriptos;
 ---------------------------------------------------------------------------------------------------------------------
 
/*87 - Tipo de dato definido por el usuario (crear - informacion)

 Primer problema:
Un comercio almacena los datos de sus empleados en una tabla denominada "empleados".
1- Elimine la tabla si existe */
 if object_id ('empleados') is not null
  drop table empleados;

/*2- Defina un nuevo tipo de dato llamado "tipo_legajo". Primero debe eliminarlo (si existe) para 
volver a crearlo. Para ello emplee esta sentencia que explicaremos en el siguiente capítulo: */

 if exists (select name from systypes
  where name = 'tipo_legajo')
  exec sp_droptype tipo_legajo;

/*3- Cree un tipo de dato definido por el usuario llamado "tipo_legajo" basado en el tipo "char" de 4 
caracteres que no permita valores nulos. */

 exec sp_addtype tipo_legajo, 'char(4)','not null';

 exec sp_help tipo_legajo;

/*4- Ejecute el procedimiento almacenado "sp_help" junto al nombre del tipo de dato definido 
anteriormente para obtener información del mismo. */

/*5- Cree la tabla "empleados" con 3 campos: legajo (tipo_legajo), documento (char de 8) y nombre (30 
caracteres): */
 create table empleados(
  legajo tipo_legajo,
  documento char(8),
  nombre varchar(30)
 );

/*6- Intente ingresar un registro con valores por defecto:
 insert into empleados default values;
No se puede porque el campo "tipo_legajo" no admite valores nulos y no tiene definido un valor por 
defecto.*/
 insert into empleados default values;

--7- Ingrese un registro con valores válidos

 insert into empleados values('E8912','22222222','Juan Perez');

 ----------------------------------------------------------------------------------------------------------------------------------
 /*
88 - Tipo de dato definido por el usuario (asociación de reglas)
Primer problema:
Un comercio almacena los datos de sus empleados en una tabla denominada "empleados" y en otra 
llamada "clientes" los datos de sus clientes".
1- Elimine ambas tablas, si existen*/

if object_id ('empleados') is not null
  drop table empleados;

 if object_id ('clientes') is not null
  drop table clientes;

  /*2- Defina un nuevo tipo de dato llamado "tipo_año". Primero debe eliminarlo, si existe, para volver 
a crearlo. Para ello emplee esta sentencia que explicaremos en el siguiente capítulo:
;*/ 
if exists (select *from systypes
  where name = 'tipo_año')
   exec sp_droptype tipo_año

   /*3- Cree un tipo de dato definido por el usuario llamado "tipo_año" basado en el tipo "int" que 
permita valores nulos:
*/	
exec sp_addtype tipo_año, 'int','null';

/*4- Ejecute el procedimiento almacenado "sp_help" junto al nombre del tipo de dato definido 
anteriormente para obtener información del mismo:  */
 exec sp_help tipo_año;

 /*5- Cree la tabla "empleados" con 3 campos: documento (char de 8), nombre (30 caracteres) y 
añoingreso (tipo_año):*/

 create table empleados(
  documento char(8),
  nombre varchar(30),
  añoingreso tipo_año
 );

 --6- Elimine la regla llamada "RG_año" si existe:
 if object_id ('RG_año') is not null
   drop rule RG_año;

/*7- Cree la regla que permita valores integer desde 1990 (año en que se inauguró el comercio) y el 
año actual:*/

 create rule RG_año
  as @año between 1990 and datepart(year,getdate());

  /*8- Asocie la regla al tipo de datos "tipo_año" especificando que solamente se aplique a los futuros 
campos de este tipo: */

 exec sp_bindrule RG_año, 'tipo_año', 'futureonly';

 --9- Vea si se aplicó a la tabla empleados:
 exec sp_helpconstraint empleados;
--No se aplicó porque especificamos la opción "futureonly":

/*10- Cree la tabla "clientes" con 3 campos: nombre (30 caracteres), añoingreso (tipo_año) y domicilio 
(30 caracteres):*/

 create table clientes(
  documento char(8),
  nombre varchar(30),
  añoingreso tipo_año
 );

 --11- Vea si se aplicó la regla en la nueva tabla:
 exec sp_helpconstraint clientes;

 --12- Ingrese registros con valores para el año que infrinjan la regla en la tabla "empleados":
 insert into empleados values('11111111','Ana Acosta',2050);
 select * from empleados;

 --13- Intente ingresar en la tabla "clientes" un valor de fecha que infrinja la regla:
 insert into clientes values('22222222','Juan Perez',2050);

 --14- Quite la asociación de la regla con el tipo de datos:
 exec sp_unbindrule 'tipo_año';

--15- Vea si se quitó la asociación:
 exec sp_helpconstraint clientes;

 --16- Vuelva a asociar la regla, ahora sin el parámetro "futureonly":
 exec sp_bindrule RG_año, 'tipo_año';

/* 17- Intente agregar una fecha de ingreso fuera del intervalo que admite la regla en cualquiera de 
las tablas (ambas tienen la asociación): */
 insert into empleados values('33333333','Romina Guzman',1900);

 --18- Vea la información del tipo de dato:
 exec sp_help tipo_año;

 19- Elimine la regla llamada "RG_añonegativo", si existe:
 if object_id ('RG_añonegativo') is not null
   drop rule RG_añonegativo;

--20- Cree una regla llamada "RG_añonegativo" que admita valores entre -2000 y -1:
  create rule RG_añonegativo
  as @año between -2000 and -1;

  --21- Asocie la regla "RG_añonegativo" al campo "añoingreso" de la tabla "clientes":
 exec sp_bindrule RG_añonegativo, 'clientes.añoingreso';

 --22- Vea si se asoció:
 exec sp_helpconstraint clientes;


--23- Verifique que no está asociada al tipo de datos "tipo_año":
 exec sp_help tipo_año;

 --24- Intente ingresar un registro con valor '-1900' para el campo "añoingreso" de "empleados":
 insert into empleados values('44444444','Pedro Perez',-1900);

 /*25- Ingrese un registro con valor '-1900' para el campo "añoingreso" de "clientes" y recupere los 
registros de dicha tabla:*/
 insert into clientes values('44444444','Pedro Perez',-1900);
 select * from clientes

 ------------------------------------------------------------------------------	---------------------

 
/*89 - Tipo de dato definido por el usuario (valores predeterminados)

 Primer problema:
Un comercio almacena los datos de sus empleados en una tabla denominada "empleados" y en otra 
llamada "clientes" los datos de sus clientes".
1- Elimine ambas tablas, si existen:*/

 if object_id ('empleados') is not null
  drop table empleados;
 if object_id ('clientes') is not null
  drop table clientes;

/*2- Defina un nuevo tipo de dato llamado "tipo_año". Primero debe eliminarlo, si existe, para volver 
a crearlo. Para ello emplee esta sentencia que explicaremos en el siguiente capítulo: */

 if exists (select *from systypes
  where name = 'tipo_año')
   exec sp_droptype tipo_año;

 /* 3- Cree un tipo de dato definido por el usuario llamado "tipo_año" basado en el tipo "int" que 
permita valores nulos:*/

 exec sp_addtype tipo_año, 'int','null';

 /*4- Ejecute el procedimiento almacenado "sp_help" junto al nombre del tipo de dato definido 
anteriormente para obtener información del mismo:*/
 exec sp_help tipo_año;

/*5- Cree la tabla "empleados" con 3 campos: documento (char de 8), nombre (30 caracteres) y 
añoingreso (tipo_año):*/

 create table empleados(
  documento char(8),
  nombre varchar(30),
  añoingreso tipo_año
 );

 --6- Elimine el valor predeterminado "VP_añoactual" si existe:
 if object_id ('VP_añoactual') is not null
   drop default VP_añoactual;

--7- Cree el valor predeterminado "VP_añoactual" que almacene el año actual:
 create default VP_añoactual
  as datepart(year,getdate());

  /*8- Asocie el valor predeterminado al tipo de datos "tipo_año" especificando que solamente se aplique 
a los futuros campos de este tipo:*/
 exec sp_bindefault VP_añoactual, 'tipo_año', 'futureonly';

-- 9- Vea si se aplicó a la tabla empleados:
 exec sp_helpconstraint empleados;

 /*10- Cree la tabla "clientes" con 3 campos: nombre (30 caracteres), añoingreso (tipo_año) y domicilio 
(30 caracteres): */

 create table clientes(
  documento char(8),
  nombre varchar(30),
  añoingreso tipo_año
 );

 --11- Vea si se aplicó la regla en la nueva tabla:
 exec sp_helpconstraint clientes;


/*12- Ingrese un registro con valores por defecto en la tabla "empleados" y vea qué se almacenó en 
"añoingreso": */

 insert into empleados default values;
 select * from empleados

 --13- Ingrese en la tabla "clientes" un registro con valores por defecto y recupere los registros:
 insert into clientes default values;
 select * from clientes;


--14- Elimine el valor predeterminado llamado "VP_año2000", si existe:
 if object_id ('VP_año2000') is not null
   drop default Vp_año2000;

--15- Cree un valor predeterminado llamado "VP_año2000" con el valor 2000:
 create default VP_año2000
  as 2000;

--16- Asócielo al tipo de dato definido sin especificar "futureonly":
 exec sp_bindefault VP_año2000, 'tipo_año';

--17- Verifique que se asoció a la tabla "empleados":
 exec sp_helpconstraint empleados;

--18- Verifique que reemplazó al valor predeterminado anterior en la tabla "clientes":
 exec sp_helpconstraint clientes

 --19- Vea la información del tipo de dato:
 exec sp_help tipo_año;

 --20- Intente agregar a la tabla "empleados" una restricción "default":
 alter table empleados
 add constraint DF_empleados_año																	
 exec sp_unbindefault 'tipo_año';
 default 1990
 for añoingreso;

 --21- Quite la asociación del valor predeterminado al tipo de dato:
 exec sp_unbindefault 'tipo_año';

 --22- Agregue a la tabla "empleados" una restricción "default":
 alter table empleados
 add constraint DF_empleados_año
 default 1990
 for añoingreso;

 --23- Asocie el valor predeterminado "VP_añoactual" al tipo de dato "tipo_año":
 exec sp_bindefault VP_añoactual, 'tipo_año';

--24- Verifique que el tipo de dato tiene asociado el valor predeterminado:
 exec sp_help tipo_año;

--25- Verifique que la tabla "clientes" tiene asociado el valor predeterminado:
 exec sp_helpconstraint clientes;

/*26- Verifique que la tabla "empleados" no tiene asociado el valor predeterminado "VP_añoactual" 
asociado al tipo de dato y tiene la restricción "default": */
 exec p_helpconstraint empleados;

 ------------------------------------------------------------------------------------------------------------------
 /*
90 - Tipo de dato definido por el usuario (eliminar)
Primer problema:
Un comercio almacena los datos de sus empleados en una tabla denominada "empleados".
1- Elimine la tabla si existe:*/
 if object_id ('empleados') is not null
  drop table empleados;

/*2- Defina un nuevo tipo de dato llamado "tipo_año". Primero debe eliminarlo, si existe para volver a 
crearlo: */
 if exists (select *from systypes
  where name = 'tipo_año')
  exec sp_droptype tipo_año;

/*3- Cree un tipo de dato definido por el usuario llamado "tipo_año" basado en el tipo "int" que 
permita valores nulos:*/
 exec sp_addtype tipo_año, 'int','null';

--4- Elimine la regla llamada "RG_año" si existe:
 if object_id ('RG_año') is not null
   drop rule RG_año;

/*5- Cree la regla que permita valores integer desde 1990 (fecha en que se inauguró el comercio) y el 
año actual:*/
 create rule RG_año
  as @año between 1990 and datepart(year,getdate());

--6- Asocie la regla al tipo de datos "tipo_año":
 exec sp_bindrule RG_año, 'tipo_año';

 --7- Cree la tabla "empleados" con un campo del tipo creado anteriormente:
 create table empleados(
  documento char(8),
  nombre varchar(30),
  añoingreso tipo_año
 );

--8- Intente ingresar un registro con un valor inválido para el campo "añoingreso":
 insert into empleados values('22222222','Juan Lopez',1980);


--9- Ingrese un registro con un valor válido para el campo "añoingreso":
 insert into empleados values('22222222','Juan Lopez',2000);

--10- Intente eliminar la regla asociada al tipo de datos:
 drop rule RG_año;

 --11- Elimine la asociación:
 exec sp_unbindrule 'tipo_año';

--12- Verifique que la asociación ha sido eliminada pero la regla sigue existiendo:
 exec sp_helpconstraint empleados;
 exec sp_help tipo_año;

--13- Elimine la regla:
 drop rule RG_año;

--14- Verifique que la regla ya no existe:
 exec sp_help RG_año;

 --15- Ingrese el registro que no pudo ingresar en el punto 8:
 insert into empleados values('22222222','Juan Lopez',1980);


--16- Intente eliminar el tipo de datos "tipo_año":
 exec sp_droptype tipo_año;


--17- Elimine la tabla "empleados":
 drop table empleados;

--18- Verifique que el tipo de dato "tipo_año" aún existe:
 exec sp_help tipo_año;

--19- Elimine el tipo de datos:
 exec sp_droptype tipo_año;

--20- Verifique que el tipo de dato "tipo_año" ya no existe:
 exec sp_help tipo_año;

 --------------------------------------------------------------------------------------------------------
 /*
83 - Agregar y eliminar campos ( alter table - add - drop)
Primer problema:
Trabaje con una tabla llamada "empleados".
1- Elimine la tabla, si existe, créela y cargue un registro:*/
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  fechaingreso datetime
 );
 insert into empleados(apellido,nombre) values ('Rodriguez','Pablo');

 --2- Agregue el campo "sueldo", de tipo decimal(5,2).
  insert into empleados(apellido,nombre) values ('Perez','Sanchez');
   alter table empleados
  add sueldo decimal(5,2);

  --3- Verifique que la estructura de la tabla ha cambiado.
   exec sp_columns empleados;

--4- Agregue un campo "codigo", de tipo int con el atributo "identity".
 alter table empleados
  add codigo int identity;

--5- Intente agregar un campo "documento" no nulo.
 alter table empleados
  add documento char(8) not null;

  --6- Agregue el campo del punto anterior especificando un valor por defecto:
 alter table empleados
  add documento char(8) not null default '00000000';

 -- 7- Verifique que la estructura de la tabla ha cambiado.
  exec sp_columns empleados;
--8- Elimine el campo "sueldo".
alter table empleados
  drop column sueldo;
--9- Verifique la eliminación:
 exec sp_columns empleado

 --10- Intente eliminar el campo "documento".
 alter table empleados
  drop column documento;

--11- Elimine los campos "codigo" y "fechaingreso" en una sola sentencia.
alter table empleados
  drop column codigo,fechaingreso;
--12- Verifique la eliminación de los campos:
 exec sp_columns empleados;
 -------------------------------------------------------------------------------------------------------------------
 /*
92 - Subconsultas como expresión

 Primer problema:
Un profesor almacena el documento, nombre y la nota final de cada alumno de su clase en una tabla 
llamada "alumnos".
1- Elimine la tabla, si existe:	*/
 if object_id('alumnos') is not null
  drop table alumnos

 /*2- Créela con los campos necesarios. Agregue una restricción "primary key" para el campo "documento" 
y una "check" para validar que el campo "nota" se encuentre entre los valores 0 y 10:*/

 create table alumnos(
  documento char(8),
  nombre varchar(30),
  nota decimal(4,2),
  primary key(documento),
  constraint CK_alumnos_nota_valores check (nota>=0 and nota <=10),
 );

 --3-Ingrese algunos registros:
 insert into alumnos values('30111111','Ana Algarbe',5.1);
 insert into alumnos values('30222222','Bernardo Bustamante',3.2);
 insert into alumnos values('30333333','Carolina Conte',4.5);
 insert into alumnos values('30444444','Diana Dominguez',9.7);
 insert into alumnos values('30555555','Fabian Fuentes',8.5);
 insert into alumnos values('30666666','Gaston Gonzalez',9.70);

 /*4- Obtenga todos los datos de los alumnos con la nota más alta, empleando subconsulta.
2 registros. */
   select alumnos.*
  from alumnos
  where nota=
   (select max(nota) from alumnos);

/*5- Realice la misma consulta anterior pero intente que la consulta interna retorne, además del 
máximo valor de nota, el nombre. 
Mensaje de error, porque la lista de selección de una subconsulta que va luego de un operador de 
comparación puede incluir sólo un campo o expresión (excepto si se emplea "exists" o "in").*/

 select documento ,nombre, nota
  from alumnos
  where nota=
   (select nombre,max(nota) from alumnos);

/*6- Muestre los alumnos que tienen una nota menor al promedio, su nota, y la diferencia con el 
promedio.
3 registros.*/

select alumnos.*,
 (select avg(nota) from alumnos)-nota as diferencia
  from alumnos
  where nota<
   (select avg(nota) from alumnos);

/*7- Cambie la nota del alumno que tiene la menor nota por 4.
1 registro modificado.*/
 update alumnos set nota=4
  where nota=
   (select min(nota) from alumnos);
/*8- Elimine los alumnos cuya nota es menor al promedio.
3 registros eliminados*/

 delete from alumnos
 where nota<
   (select avg(nota) from alumnos);

/*
93 - Subconsultas con in

 Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla 
"ciudades" donde registra los nombres de las ciudades.
1- Elimine las tablas "clientes" y "ciudades", si existen: */

  if (object_id('ciudades')) is not null
   drop table ciudades;
  if (object_id('clientes')) is not null
   drop table clientes;

/*2- Cree la tabla "clientes" (codigo, nombre, domicilio, ciudad, codigociudad) y "ciudades" (codigo, 
nombre). Agregue una restricción "primary key" para el campo "codigo" de ambas tablas y una "foreing 
key" para validar que el campo "codigociudad" exista en "ciudades" con actualización en cascada: */

 create table ciudades(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  codigociudad tinyint not null,
  primary key(codigo),
  constraint FK_clientes_ciudad
   foreign key (codigociudad)
   references ciudades(codigo)
   on update cascade,
 );

 --3- Ingrese algunos registros para ambas tablas:
 insert into ciudades (nombre) values('Cordoba');
 insert into ciudades (nombre) values('Cruz del Eje');
 insert into ciudades (nombre) values('Carlos Paz');
 insert into ciudades (nombre) values('La Falda');
 insert into ciudades (nombre) values('Villa Maria');

 insert into clientes values ('Lopez Marcos','Colon 111',1);
 insert into clientes values ('Lopez Hector','San Martin 222',1);
 insert into clientes values ('Perez Ana','San Martin 333',2);
 insert into clientes values ('Garcia Juan','Rivadavia 444',3);
 insert into clientes values ('Perez Luis','Sarmiento 555',3);
 insert into clientes values ('Gomez Ines','San Martin 666',4);
 insert into clientes values ('Torres Fabiola','Alem 777',5);
 insert into clientes values ('Garcia Luis','Sucre 888',5);

 /*4- Necesitamos conocer los nombres de las ciudades de aquellos clientes cuyo domicilio es en calle 
"San Martin", empleando subconsulta.
3 registros.*/
select nombre
  from ciudades
  where codigo in
   (select codigociudad
     from clientes
     where domicilio like 'San Martin %');

--5- Obtenga la misma salida anterior pero empleando join.
 select distinct ci.nombre
  from ciudades as ci
  join clientes as cl
  on codigociudad=ci.codigo
  where domicilio like 'San Martin%';

  /*6- Obtenga los nombre de las ciudades de los clientes cuyo apellido no comienza con una letra 
específica, empleando subconsulta.
2 registros.*/
select nombre
  from ciudades
  where codigo not in
   (select codigociudad
     from clientes
     where nombre like 'G%');

/*7- Pruebe la subconsulta del punto 6 separada de la consulta exterior para verificar que retorna una 
lista de valores de un solo campo*/
select codigociudad
  from clientes
  where nombre like 'G%';
  ---------------------------------------------------------------------------------------------------------------------------------------

 /*Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada 
"inscriptos" en la cual almacena el número de "socio", el código del deporte en el cual se inscribe 
y la cantidad de cuotas pagas (desde 0 hasta 10 que es el total por todo el año), y una tabla 
denominada "socios" en la que guarda los datos personales de cada socio.*/
--1- Elimine las tablas si existen:
 if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;

--2- Cree las tablas:
 create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas tinyint
  constraint CK_inscriptos_cuotas
   check (cuotas>=0 and cuotas<=10)
  constraint DF_inscriptos_cuotas default 0,
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
   on update cascade
   on delete cascade,
 );

--3- Ingrese algunos registros:
 insert into socios values('23333333','Alberto Paredes','Colon 111');
 insert into socios values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);

/*4- Muestre el número de socio, el nombre del socio y el deporte en que está inscripto con un join de 
ambas tablas.*/
 insert into socios values('23333333','Alberto Paredes','Colon 111');
 insert into socios values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios values('26666666','Hector Lopez','Sucre 344');


/*5- Muestre los socios que se serán compañeros en tenis y también en natación (empleando 
subconsulta)
3 filas devueltas.*/
 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);

/*6- vea si el socio 1 se ha inscripto en algún deporte en el cual se haya inscripto el socio 2.
3 filas.*/
select numero,nombre,deporte
  from socios as s
  join inscriptos as i
  on numerosocio=numero;

 select nombre
  from socios
  join inscriptos as i
  on numero=numerosocio
  where deporte='natacion' and 
  numero= any
  (select numerosocio
    from inscriptos as i
    where deporte='tenis');
--7- Obtenga el mismo resultado anterior pero empleando join.
select deporte
  from inscriptos as i
  where numerosocio=1 and
  deporte= any
   (select deporte
    from inscriptos as i
    where numerosocio=2);

/*8- Muestre los deportes en los cuales el socio 2 pagó más cuotas que ALGUN deporte en los que se 
inscribió el socio 1./
2 registros.*/
select i1.deporte
  from inscriptos as i1
  join inscriptos as i2
  on i1.deporte=i2.deporte
  where i1.numerosocio=1 and
  i2.numerosocio=2;

/*9- Muestre los deportes en los cuales el socio 2 pagó más cuotas que TODOS los deportes en que se 
inscribió el socio 1.
1 registro.*/
select deporte
  from inscriptos as i
  where numerosocio=2 and
  cuotas>any
   (select cuotas
    from inscriptos
    where numerosocio=1);

/*10- Cuando un socio no ha pagado la matrícula de alguno de los deportes en que se ha inscripto, se 
lo borra de la inscripción de todos los deportes. Elimine todos los socios que no pagaron ninguna 
cuota en algún deporte.
7 registros.*/
select deporte
  from inscriptos as i
  where numerosocio=2 and
  cuotas>any
   (select cuotas
    from inscriptos
    where numerosocio=1);


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada 
"inscriptos" en la cual almacena el número de "socio", el código del deporte en el cual se inscribe 
y la cantidad de cuotas pagas (desde 0 hasta 10 que es el total por todo el año), y una tabla 
denominada "socios" en la que guarda los datos personales de cada socio.*/
--1- Elimine las tablas si existen:
 if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;
---2- Cree las tablas:
 create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas tinyint
  constraint CK_inscriptos_cuotas
   check (cuotas>=0 and cuotas<=10)
  constraint DF_inscriptos_cuotas default 0,
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
   on update cascade
   on delete cascade,
 );

---3- Ingrese algunos registros:
 insert into socios values('23333333','Alberto Paredes','Colon 111');
 insert into socios values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);

/*4- Se necesita un listado de todos los socios que incluya nombre y domicilio, la cantidad de 
deportes a los cuales se ha inscripto, empleando subconsulta.
4 registros.*/
 select nombre,domicilio,
  (select count(*)
    from inscriptos as i
    where s.numero=i.numerosocio) as 'deportes'
 from socios as s;
/*5- Se necesita el nombre de todos los socios, el total de cuotas que debe pagar (10 por cada 
deporte) y el total de cuotas pagas, empleando subconsulta.
4 registros.*/
 select nombre,
  (select (count(*)*10)
    from inscriptos as i
    where s.numero=i.numerosocio) as total,
  (select sum(i.cuotas)
    from inscriptos as i
    where s.numero=i.numerosocio) as pagas
 from socios as s;
---6- Obtenga la misma salida anterior empleando join.

 select nombre,
  count(i.deporte)*10 as total,
  sum(i.cuotas) as pagas
  from socios as s
  join inscriptos as i
  on numero=numerosocio
  group by nombre;
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada "deportes" 
en la cual almacena el nombre del deporte, el nombre del profesor que lo dicta, el día de la semana 
que se dicta y el costo de la cuota mensual.
1- Elimine la tabla si existe:*/
 if object_id('deportes') is not null
  drop table deportes;

--2- Cree la tabla:
 create table deportes(
  nombre varchar(15),
  profesor varchar(30),
  dia varchar(10),
  cuota decimal(5,2),
 );
 
--3- Ingrese algunos registros. Incluya profesores que dicten más de un curso:
 insert into deportes values('tenis','Ana Lopez','lunes',20);
 insert into deportes values('natacion','Ana Lopez','martes',15);
 insert into deportes values('futbol','Carlos Fuentes','miercoles',10);
 insert into deportes values('basquet','Gaston Garcia','jueves',15);
 insert into deportes values('padle','Juan Huerta','lunes',15);
 insert into deportes values('handball','Juan Huerta','martes',10);

--4- Muestre los nombres de los profesores que dictan más de un deporte empleando subconsulta.
select distinct d1.profesor
  from deportes as d1
  where d1.profesor in
  (select d2.profesor
    from deportes as d2 
    where d1.nombre <> d2.nombre);

--5- Obtenga el mismo resultado empleando join.
 select distinct d1.profesor
  from deportes as d1
  join deportes as d2
  on d1.profesor=d2.profesor
  where d1.nombre<>d2.nombre;
/*6- Buscamos todos los deportes que se dictan el mismo día que un determinado deporte (natacion) 
empleando subconsulta.*/
 select nombre
  from deportes
  where nombre<>'natacion' and
  dia =
   (select dia
     from deportes
     where nombre='natacion');

--7- Obtenga la misma salida empleando "join".
select d1.nombre
  from deportes as d1
  join deportes as d2
  on d1.dia=d2.dia
  where d2.nombre='natacion' and
  d1.nombre<>d2.nombre;
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Un club dicta clases de distintos deportes. En una tabla llamada "socios" guarda los datos de los 
socios, en una tabla llamada "deportes" la información referente a los diferentes deportes que se 
dictan y en una tabla denominada "inscriptos", las inscripciones de los socios a los distintos 
deportes.
Un socio puede inscribirse en varios deportes el mismo año. Un socio no puede inscribirse en el 
mismo deporte el mismo año. Distintos socios se inscriben en un mismo deporte en el mismo año.

1- Elimine las tablas si existen:*/
 if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;
 if object_id('deportes') is not null
  drop table deportes;

--2- Cree las tablas con las siguientes estructuras:
 create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );
 create table deportes(
  codigo tinyint identity,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
 );
 create table inscriptos(
  documento char(8) not null, 
  codigodeporte tinyint not null,
  año char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,año),
  constraint FK_inscriptos_socio
   foreign key (documento)
   references socios(documento)
   on update cascade
   on delete cascade
 );

--3- Ingrese algunos registros en las 3 tablas:
 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

 insert into deportes values('basquet','Juan Juarez');
 insert into deportes values('futbol','Pedro Perez');
 insert into deportes values('natacion','Marina Morales');
 insert into deportes values('tenis','Marina Morales');

 insert into inscriptos values ('22222222',3,'2006','s');
 insert into inscriptos values ('23333333',3,'2006','s');
 insert into inscriptos values ('24444444',3,'2006','n');
 insert into inscriptos values ('22222222',3,'2005','s');
 insert into inscriptos values ('22222222',3,'2007','n');
 insert into inscriptos values ('24444444',1,'2006','s');
 insert into inscriptos values ('24444444',2,'2006','s');

/*4- Realice una consulta en la cual muestre todos los datos de las inscripciones, incluyendo el 
nombre del deporte y del profesor.
Esta consulta es un join.*/
 select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor
 from deportes as d
 join inscriptos as i
 on d.codigo=i.codigodeporte;

/*5- Utilice el resultado de la consulta anterior como una tabla derivada para emplear en lugar de una 
tabla para realizar un "join" y recuperar el nombre del socio, el deporte en el cual está inscripto, 
el año, el nombre del profesor y la matrícula.*/
 select s.nombre,td.deporte,td.profesor,td.año,td.matricula
  from socios as s
  join (select i.documento,i.codigodeporte,d.nombre as deporte, año, matricula, d.profesor
	from deportes as d
	join inscriptos as i
	on d.codigo=i.codigodeporte) as td
  on td.documento=s.documento;
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".
---1- Eliminamos la tabla, si existe y la creamos:
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  seccion varchar(20),
  primary key(documento)
 );

--2- Ingrese algunos registros:
 insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
 insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
 insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

--3- Elimine el procedimiento llamado "pa_empleados_sueldo" si existe:
 if object_id('pa_empleados_sueldo') is not null
  drop procedure pa_empleados_sueldo;

/*4- Cree un procedimiento almacenado llamado "pa_empleados_sueldo" que seleccione los nombres, 
apellidos y sueldos de los empleados que tengan un sueldo superior o igual al enviado como 
parámetro.*/
 create procedure pa_empleados_sueldo
  @sueldo decimal(6,2)
 as
  select nombre,apellido,sueldo
   from empleados
    where sueldo>=@sueldo;
--5- Ejecute el procedimiento creado anteriormente con distintos valores:
 exec pa_empleados_sueldo 400;
 exec pa_empleados_sueldo 500;

/*6- Ejecute el procedimiento almacenado "pa_empleados_sueldo" sin parámetros.
Mensaje de error.*/
exec pa_empleados_sueldo;
--7- Elimine el procedimiento almacenado "pa_empleados_actualizar_sueldo" si existe:
 if object_id('pa_empleados_actualizar_sueldo') is not null
  drop procedure pa_empleados_actualizar_sueldo;

/*8- Cree un procedimiento almacenado llamado "pa_empleados_actualizar_sueldo" que actualice los 
sueldos iguales al enviado como primer parámetro con el valor enviado como segundo parámetro.*/
 create procedure pa_empleados_actualizar_sueldo
  @sueldoanterior decimal(6,2),
  @sueldonuevo decimal(6,2)
 as
  update empleados set sueldo=@sueldonuevo
   where sueldo=@sueldoanterior;

--9- Ejecute el procedimiento creado anteriormente y verifique si se ha ejecutado correctamente:
 exec pa_empleados_actualizar_sueldo 300,350;
 select * from empleados;

/*10- Ejecute el procedimiento "pa_empleados_actualizar_sueldo" enviando un solo parámetro.
Error.*/

 exec pa_empleados_actualizar_sueldo 350;
/*11- Ejecute el procedimiento almacenado "pa_empleados_actualizar_sueldo" enviando en primer lugar el 
parámetro @sueldonuevo y en segundo lugar @sueldoanterior (parámetros por nombre).*/
 exec pa_empleados_actualizar_sueldo @sueldonuevo=400,@sueldoanterior=350;
--12- Verifique el cambio:
 select * from empleados;

--13- Elimine el procedimiento almacenado "pa_sueldototal", si existe:
 if object_id('pa_sueldototal') is not null
  drop procedure pa_sueldototal;

/*14- Cree un procedimiento llamado "pa_sueldototal" que reciba el documento de un empleado y muestre 
su nombre, apellido y el sueldo total (resultado de la suma del sueldo y salario por hijo, que es de 
$200 si el sueldo es menor a $500 y $100, si el sueldo es mayor o igual a $500). Coloque como valor 
por defecto para el parámetro el patrón "%".*/
create procedure pa_sueldototal
  @documento varchar(8) = '%'
 as
  select nombre,apellido,
   sueldototal=
   case 
    when sueldo<500 then sueldo+(cantidadhijos*200)
    when sueldo>=500 then sueldo+(cantidadhijos*100)
   end
   from empleados
   where documento like @documento;
--15- Ejecute el procedimiento anterior enviando diferentes valores:
 exec pa_sueldototal '22333333';
 exec pa_sueldototal '22444444';
 exec pa_sueldototal '22666666';

/*16-  Ejecute el procedimiento sin enviar parámetro para que tome el valor por defecto.
Muestra los 5 registros.*/
 exec pa_sueldototal;
     ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".
1- Eliminamos la tabla, si existe y la creamos:*/
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  seccion varchar(20),
  primary key(documento)
 );

--2- Ingrese algunos registros:
 insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
 insert into empleados values('22333333','Luis','Lopez',350,0,'Contaduria');
 insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',null,2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',460,3,'Secretaria');
 insert into empleados values('22777777','Andres','Perez',580,3,'Sistemas');
 insert into empleados values('22888888','Laura','Garcia',400,3,'Secretaria');

--3- Elimine el procedimiento llamado "pa_seccion" si existe:
 if object_id('pa_seccion') is not null
  drop procedure pa_seccion;

/*4- Cree un procedimiento almacenado llamado "pa_seccion" al cual le enviamos el nombre de una 
sección y que nos retorne el promedio de sueldos de todos los empleados de esa sección y el valor 
mayor de sueldo (de esa sección)*/
 if object_id('pa_seccion') is not null
  drop procedure pa_seccion;

 create procedure pa_seccion
  @seccion varchar(20)='%',
  @promedio decimal(6,2) output,
  @mayor decimal(6,2) output
 as
  select @promedio=avg(sueldo)
   from empleados
   where seccion like @seccion
  select @mayor=max(sueldo)
   from empleados
    where seccion like @seccion;

--5- Ejecute el procedimiento creado anteriormente con distintos valores.
 declare @p decimal(6,2), @m decimal(6,2)
 execute pa_seccion 'Contaduria', @p output, @m output
 select @p as promedio, @m as mayor

/*6- Ejecute el procedimiento "pa_seccion" sin pasar valor para el parámetro "sección". Luego muestre 
los valores devueltos por el procedimiento.
Calcula sobre todos los registros porque toma el valor por defecto.*/
execute pa_seccion 'Secretaria', @p output, @m output
 select @p as promedio, @m as mayor;

/*7- Elimine el procedimiento almacenado "pa_sueldototal", si existe y cree un procedimiento con ese 
nombre que reciba el documento de un empleado y retorne el sueldo total, resultado de la suma del 
sueldo y salario por hijo, que es $200 si el sueldo es menor a $500 y $100 si es mayor o igual.*/
declare @p decimal(6,2), @m decimal(6,2)
 execute pa_seccion @promedio=@p output,@mayor= @m output
 select @p as promedio, @m as mayor;
--8- Ejecute el procedimiento anterior enviando un documento existente.
 if object_id('pa_sueldototal') is not null
  drop procedure pa_sueldototal;

 create procedure pa_sueldototal
  @documento varchar(8)='%',
  @sueldototal decimal(8,2) output
 as
  select @sueldototal=
   case 
    when sueldo<500 then sueldo+(cantidadhijos*200)
    when sueldo>=500 then sueldo+(cantidadhijos*100)
   end
   from empleados
   where documento like @documento;
/*9- Ejecute el procedimiento anterior enviando un documento inexistente.
Retorna "null".*/
declare @st decimal(8,2)
 exec pa_sueldototal '22666666', @st output
 select @st;

 declare @st decimal(8,2)
 exec pa_sueldototal '22999999', @st output
 select @st;

/*10- Ejecute el procedimiento anterior enviando el documento de un empleado en cuyo campo "sueldo" 
contenga "null".
Retorna "null".*/

 declare @st decimal(8,2)
 exec pa_sueldototal '22555555', @st output
 select @st;


/*11- Ejecute el procedimiento anterior sin enviar valor para el parámetro "documento".
Retorna el valor calculado del último registro.*/
 declare @st decimal(8,2)
 exec pa_sueldototal @sueldototal=@st output
 select @st;
      -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".
1- Eliminamos la tabla, si existe y la creamos:*/
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  cantidadhijos tinyint,
  seccion varchar(20),
  primary key(documento)
 );

--2- Ingrese algunos registros:
 insert into empleados values('22222222','Juan','Perez',2,'Contaduria');
 insert into empleados values('22333333','Luis','Lopez',0,'Contaduria');
 insert into empleados values ('22444444','Marta','Perez',NULL,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',1,'Secretaria');
 insert into empleados values('22777777','Andres','Perez',3,'Sistemas');
 insert into empleados values('22888888','Laura','Garcia',3,'Secretaria');

--3- Elimine el procedimiento llamado "pa_empleados_seccion", si existe:
 if object_id('pa_empleados_seccion') is not null
  drop procedure pa_empleados_seccion;

/*4- Cree un procedimiento que muestre todos los empleados de una sección determinada que se ingresa 
como parámetro. Si no se ingresa un valor, o se ingresa "null", se muestra un mensaje y se sale del 
procedimiento.*/
create procedure pa_empleados_seccion
  @seccion varchar(20)=null
 as 
 if @seccion is null
 begin 
  select 'Debe indicar una seccion'
  return
 end
 select nombre from empleados where seccion=@seccion;
--5- Ejecute el procedimiento enviándole un valor para el parámetro.
 exec pa_empleados_seccion 'Secretaria';

--6- Ejecute el procedimiento sin parámetro.
 exec pa_empleados_seccion;
--7- Elimine el procedimiento "pa_actualizarhijos", si existe:
 if object_id('pa_actualizarhijos') is not null
  drop procedure pa_actualizarhijos;

/*8- Cree un procedimiento almacenado que permita modificar la cantidad de hijos ingresando el 
documento de un empleado y la cantidad de hijos nueva. Ambos parámetros DEBEN ingresarse con un 
valor distinto de "null". El procedimiento retorna "1" si la actualización se realiza (si se 
ingresan valores para ambos parámetros) y "0", en caso que uno o ambos parámetros no se ingresen o 
sean nulos.*/
create procedure pa_actualizarhijos
  @documento char(8)=null,
  @hijos tinyint=null
 as 
 if (@documento is null) or (@hijos is null)
  return 0
 else 
 begin
  update empleados set cantidadhijos=@hijos where documento=@documento
  return 1
 end;

/*9- Declare una variable en la cual se almacenará el valor devuelto por el procedimiento, ejecute el 
procedimiento enviando los dos parámetros y vea el contenido de la variable.
El procedimiento retorna "1", con lo cual indica que fue actualizado.*/
 declare @retorno int
 exec @retorno=pa_actualizarhijos '22222222',3
 select 'Registro actualizado=1' = @retorno;

--10- Verifique la actualización consultando la tabla:
 select *from empleados;

/*11- Ejecute los mismos pasos, pero esta vez envíe solamente un valor para el parámetro "documento".
Retorna "0", lo que indica que el registro no fue actualizado.*/
declare @retorno int
 exec @retorno=pa_actualizarhijos '22333333'
 select 'Registro actualizado=1' = @retorno;
--12- Verifique que el registro no se actualizó consultando la tabla:
 select *from empleados;

/*13- Emplee un "if" para controlar el valor de la variable de retorno. Enviando al procedimiento valores para los parámetros.
Retorna 1.*/
 declare @retorno int
 exec @retorno=pa_actualizarhijos '22333333',2
 if @retorno=1 select 'Registro actualizado'
 else select 'Registro no actualizado, se necesita un documento y la cantidad de hijos';
--14- Verifique la actualización consultando la tabla:
 select *from empleados;

/*15- Emplee nuevamente un "if" y envíe solamente valor para el parámetro "hijos".
Retorna 0.*/
declare @retorno int
 exec @retorno=pa_actualizarhijos @hijos=4
 if @retorno=1 select 'Registro actualizado'
 else select 'Registro no actualizado, se necesita un documento y la cantidad de hijos';
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Una empresa almacena la información de sus clientes en dos tablas llamadas "clientes" y "ciudades".
1- Elimine las tablas, si existen:*/
 if object_id('clientes') is not null
  drop table clientes;
 if object_id('ciudades') is not null
  drop table ciudades;

--2- Cree las tablas:
 create table ciudades(
  codigo tinyint identity,
  nombre varchar(20),
  constraint PK_ciudades
   primary key (codigo)
 );

 create table clientes(
  nombre varchar(20),
  apellido varchar(20),
  documento char(8),
  domicilio varchar(30),
  codigociudad tinyint
   constraint FK_clientes_ciudad
    foreign key (codigociudad)
   references ciudades(codigo)
   on update cascade
 );

--3- Ingrese algunos registros:
 insert into ciudades values('Cordoba');
 insert into ciudades values('Carlos Paz');
 insert into ciudades values('Cruz del Eje');
 insert into ciudades values('La Falda');

 insert into clientes values('Juan','Perez','22222222','Colon 1123',1);
 insert into clientes values('Karina','Lopez','23333333','San Martin 254',2);
 insert into clientes values('Luis','Garcia','24444444','Caseros 345',1);
 insert into clientes values('Marcos','Gonzalez','25555555','Sucre 458',3);
 insert into clientes values('Nora','Torres','26666666','Bulnes 567',1);
 insert into clientes values('Oscar','Luque','27777777','San Martin 786',4);

--4- Elimine la vista "vista_clientes" si existe:
 if object_id('vista_clientes') is not null
  drop view vista_clientes;

/*5- Cree la vista "vista_clientes" para que recupere el nombre, apellido, documento, domicilio, el 
código y nombre de la ciudad a la cual pertenece, de la ciudad de "Cordoba" empleando "with check 
option".*/
 create view vista_clientes
 as
  select apellido, cl.nombre, documento, domicilio, cl.codigociudad,ci.nombre as ciudad
  from clientes as cl
  join ciudades as ci
  on codigociudad=codigo
  where ci.nombre='Cordoba'
  with check option;

--6- Consulte la vista:
 select * from vista_clientes;

--7- Actualice el apellido de un cliente a través de la vista.
 update vista_clientes set apellido='Pereyra' where documento='22222222';

--8- Verifique que la modificación se realizó en la tabla:
 select * from clientes;

/*9- Intente cambiar la ciudad de algún registro.
Mensaje de error.*/

 update vista_clientes set codigociudad=2 where documento='22222222';
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*En una página web se guardan los siguientes datos de las visitas: número de visita, nombre, mail, 
pais, fecha.
1- Elimine la tabla "visitas", si existe:*/
 if object_id('visitas') is not null
  drop table visitas;

--2- Créela con la siguiente estructura:
 create table visitas (
  numero int identity,
  nombre varchar(30),
  mail varchar(50),
  pais varchar (20),
  fecha datetime
  constraint DF_visitas_fecha default getdate(),
  comentarios text,
  constraint PK_visitas
  primary key(numero)
);

--3- Ingrese algunos registros:
 insert into visitas values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10',null);
 insert into visitas values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30',default);
 insert into visitas values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico',default,'Excelente página');
 insert into visitas values ('Mariano Perez','PerezM@hotmail.com','Argentina','2006-11-11 14:30','Muy buena y divertida');

/*4- Leemos la información almacenada en el campo "comentarios" de "visitas" del registro número 3, 
desde la posición 0, 10 caracteres.*/
declare @puntero varbinary(16)
 select @puntero=textptr(comentarios) 
  from visitas
  where numero=3
 readtext visitas.comentarios @puntero 0 10;
/*5- Intente leer el campo "comentarios" del registro número 1.
Error, porque el puntero es inválido.*/
declare @puntero varbinary(16)
 select @puntero=textptr(comentarios) 
  from visitas
  where numero=1
 readtext visitas.comentarios @puntero 0 10;


/*6- Recupere el campo "comentarios" de la visita número 1 (desde el comienzo al final), controlando 
que el puntero sea válido.*/
declare @puntero varbinary(16)
 select @puntero=textptr(comentarios) 
  from visitas where numero=1
 if (textvalid('visitas.comentarios', @puntero)=1)
  readtext visitas.comentarios @puntero 0 0
 else select 'puntero invalido';
 ---------------------------------------------------------------------------------------------------------------------

 --67- Lenguaje de control de flujo (case)
--Una empresa registra los datos de sus empleados en una tabla llamada "empleados".
--1--- Elimine la tabla "empleados" si existe:
 if object_id('empleados') is not null
  drop table empleados;

--2- Cree la tabla:
 create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  sexo char(1),
  fechanacimiento datetime,
  fechaingreso datetime,
  cantidadhijos tinyint,
  sueldo decimal(5,2),
  primary key(documento)
);

--3- Ingrese algunos registros:
 insert into empleados values ('22333111','Juan Perez','m','1970-05-10','1987-04-05',2,550);
 insert into empleados values ('25444444','Susana Morales','f','1975-11-06','1990-04-06',0,650);
 insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25','1997-04-12',3,510);
 insert into empleados values ('30000222','Luis LUque','m','1980-03-29','1999-11-06',1,700);
 insert into empleados values ('20555444','Laura Torres','f','1965-12-22','2003-11-06',3,400);
 insert into empleados values ('30000234','Alberto Soto','m','1989-10-10','1999-11-06',2,420);
 insert into empleados values ('20125478','Ana Gomez','f','1976-09-21','1998-11-06',3,350);
 insert into empleados values ('24154269','Ofelia Garcia','f','1974-05-12','1990-11-06',0,390);
 insert into empleados values ('30415426','Oscar Torres','m','1978-05-02','1997-11-06',1,400);

 /*4- Es política de la empresa festejar cada fin de mes, los cumpleaños de todos los empleados que 
cumplen ese mes. Si los empleados son de sexo femenino, se les regala un ramo de rosas, si son de 
sexo masculino, una corbata. La secretaria de la Gerencia necesita saber cuántos ramos de rosas y 
cuántas corbatas debe comprar para el mes de mayo.*/
 select sexo, count(*) as cantidad, obsequio=
  case 
   when sexo='f' then 'rosas'
   else 'corbata'
  end
  from empleados
  where datepart(month,fechanacimiento)=5
  group by sexo;

/*5- Además, si el empleado cumple 10,20,30,40... años de servicio, se le regala una placa 
recordatoria. La secretaria de Gerencia necesita saber la cantidad de años de servicio que cumplen 
los empleados que ingresaron en el mes de abril para encargar dichas placas.*/
 select nombre,datepart(year,fechaingreso) as añoingreso,
  datepart(year,getdate())-datepart(year,fechaingreso) as AñosdeServicio, placa=
   case (datepart(year,getdate())-datepart(year,fechaingreso)) %10
     when 0 then 'Si'
     else 'No'
   end
  from empleados
  where datepart(month,fechaingreso)=4;

/*6- La empresa paga un sueldo adicional por hijos a cargos. Para un sueldo menor o igual a $500 el 
salario familiar por hijo es de $200, para un sueldo superior, el monto es de $100 por hijo. Muestre 
el nombre del empleado, el sueldo básico, la cantidad de hijos a cargo, el valor del salario por 
hijo, el valor total del salario familiar y el sueldo final con el salario familiar incluido de 
todos los empleados.*/
select nombre,sueldo,cantidadhijos,porhijo=
  case 
   when sueldo<=500 then 200
   else 100
  end,
 salariofamilar=
  case
   when sueldo<=500 then 200*cantidadhijos
   else 100*cantidadhijos
  end,
 sueldototal=
  case
   when sueldo<=500 then sueldo+(200*cantidadhijos)
   else sueldo+(100*cantidadhijos)
  end
  from empleados
  order by sueldototal;

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--68- Lenguaje de control de flujo (if)
--Primer problema:
--Una empresa registra los datos de sus empleados en una tabla llamada "empleados".
--1- Elimine la tabla "empleados" si existe:
 if object_id('empleados') is not null
  drop table empleados;

--2- Cree la tabla:
 create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  sexo char(1),
  fechanacimiento datetime,
  sueldo decimal(5,2),
  primary key(documento)
);

--3- Ingrese algunos registros:
 insert into empleados values ('22333111','Juan Perez','m','1970-05-10',550);
 insert into empleados values ('25444444','Susana Morales','f','1975-11-06',650);
 insert into empleados values ('20111222','Hector Pereyra','m','1965-03-25',510);
 insert into empleados values ('30000222','Luis LUque','m','1980-03-29',700);
 insert into empleados values ('20555444','Laura Torres','f','1965-12-22',400);
 insert into empleados values ('30000234','Alberto Soto','m','1989-10-10',420);
 insert into empleados values ('20125478','Ana Gomez','f','1976-09-21',350);
 insert into empleados values ('24154269','Ofelia Garcia','f','1974-05-12',390);
 insert into empleados values ('30415426','Oscar Torres','m','1978-05-02',400);

/*4- Es política de la empresa festejar cada fin de mes, los 
cumpleaños de todos los empleados que cumplen ese mes. Si los 
empleados son de sexo femenino, se les regala un ramo de rosas, si son de 
sexo masculino, una corbata. La secretaria de la Gerencia necesita saber
cuántos ramos de rosas y cuántas corbatas debe comprar para el mes de mayo.*/
if exists(select * from empleados
	   where datepart(month,fechanacimiento)=5)
  (select sexo,count(*) as cantidad 
   from empleados
   where datepart(month,fechanacimiento)=5
   group by sexo)
 else select 'no hay empleados que cumplan en mayo';

--Segundo problema:
--Un teatro con varias salas guarda la información de las entradas vendidas en una tabla llamada 
--"entradas".
--1- Elimine la tabla, si existe:
 if object_id('entradas') is not null
  drop table entradas;

--2- Cree la tabla:
 create table entradas(
  sala tinyint,
  fechahora datetime,
  capacidad smallint,
  entradasvendidas smallint,
  primary key(sala,fechahora)
 );

--3- Ingrese algunos registros:
 insert into entradas values(1,'2006-05-10 20:00',300,50);
 insert into entradas values(1,'2006-05-10 23:00',300,250);
 insert into entradas values(2,'2006-05-10 20:00',400,350);
 insert into entradas values(2,'2006-05-11 20:00',400,380);
 insert into entradas values(2,'2006-05-11 23:00',400,400);
 insert into entradas values(3,'2006-05-12 20:00',350,350);
 insert into entradas values(3,'2006-05-12 22:30',350,100);
 insert into entradas values(4,'2006-05-12 20:00',250,0);

--4- Muestre, si existen, todas las funciones para la 
--cuales hay entradas disponibles, sino un mensaje 
--que indique que están agotadas.
if exists
  (select * from entradas where capacidad>entradasvendidas)
  select sala,fechahora,capacidad-entradasvendidas as disponibles
   from entradas
   where capacidad>entradasvendidas
 else select 'Todas las entradas estan agotadas';

 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--70- Procedimientos almacenados (crear - ejecutar)
--Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".
--1--- Eliminamos la tabla, si existe y la creamos:
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  seccion varchar(20),
  primary key(documento)
 );

--2- Ingrese algunos registros:
 insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
 insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
 insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

--3- Elimine el procedimiento llamado "pa_empleados_sueldo" si existe:
 if object_id('pa_empleados_sueldo') is not null
  drop procedure pa_empleados_sueldo;

--4- Cree un procedimiento almacenado llamado "pa_empleados_sueldo" que seleccione los nombres, 
--apellidos y sueldos de los empleados.
 create procedure pa_empleados_sueldo
 as
 select nombre,apellido,sueldo
 from empleados;

--5- Ejecute el procedimiento creado anteriormente.
 exec pa_empleados_sueldo;

--6- Elimine el procedimiento llamado "pa_empleados_hijos" si existe:
 if object_id('pa_empleados_hijos') is not null
  drop procedure pa_empleados_hijos;

--7- Cree un procedimiento almacenado llamado "pa_empleados_hijos" que seleccione los nombres, 
--apellidos y cantidad de hijos de los empleados con hijos.
create procedure pa_empleados_hijos
 as
  select nombre,apellido,cantidadhijos
   from empleados
   where cantidadhijos>0;

--8- Ejecute el procedimiento creado anteriormente.
exec pa_empleados_hijos;

/*--9- Actualice la cantidad de hijos de algún empleado sin hijos y 
vuelva a ejecutar el procedimiento para verificar que ahora si 
aparece en la lista.*/
 update empleados set cantidadhijos=1 where documento='22333333';
 exec pa_empleados_hijos;

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 --73- Funciones escalares (crear y llamar)
 --Primer problema:
/*Una clínica almacena los turnos para los distintos médicos 
en una tabla llamada "consultas" y en 
otra tabla "medicos" los datos de los médicos.*/
--1- Elimine las tablas si existen:
 if object_id('consultas') is not null
  drop table consultas;
 if object_id('medicos') is not null
  drop table medicos;

--2- Cree las tablas con las siguientes estructuras:
 create table medicos (
  documento char(8) not null,
  nombre varchar(30),
  constraint PK_medicos 
   primary key clustered (documento)
 );

 create table consultas(
  fecha datetime,
  medico char(8) not null,
  paciente varchar(30),
  constraint PK_consultas
   primary key (fecha,medico),
  constraint FK_consultas_medico
   foreign key (medico)
   references medicos(documento)
   on update cascade
   on delete cascade
 );

--3- Ingrese algunos registros:
 insert into medicos values('22222222','Alfredo Acosta');
 insert into medicos values('23333333','Pedro Perez');
 insert into medicos values('24444444','Marcela Morales');

 insert into consultas values('2007/03/26 8:00','22222222','Juan Juarez');
 insert into consultas values('2007/03/26 8:00','23333333','Gaston Gomez');
 insert into consultas values('2007/03/26 8:30','22222222','Nora Norte');
 insert into consultas values('2007/03/28 9:00','22222222','Juan Juarez');
 insert into consultas values('2007/03/29 8:00','24444444','Nora Norte');
 insert into consultas values('2007/03/24 8:30','22222222','Hector Huerta'); 
 insert into consultas values('2007/03/24 9:30','23333333','Hector Huerta');

--4- Elimine la función "f_nombreDia" si existe:
 if object_id('f_nombreDia') is not null
  drop function f_nombreDia;

--5- Cree la función "f_nombreDia" que recibe una fecha 
--(tipo string) y nos retorne el nombre del día en español.
create function f_nombreDia
 (@fecha varchar(30))
  returns varchar(10)
  as
  begin
    declare @nombre varchar(10)
    set @nombre='Fecha inválida'   
    if (isdate(@fecha)=1)
    begin
      set @fecha=cast(@fecha as datetime)
      set @nombre=
      case datename(weekday,@fecha)
       when 'Monday' then 'lunes'
       when 'Tuesday' then 'martes'
       when 'Wednesday' then 'miércoles'
       when 'Thursday' then 'jueves'
       when 'Friday' then 'viernes'
       when 'Saturday' then 'sábado'
       when 'Sunday' then 'domingo'
      end
    end
    return @nombre
 end;
 
--6- Elimine la función "f_horario" si existe:
 if object_id('f_horario') is not null
  drop function f_horario;

--7- Cree la función "f_horario" que recibe una fecha 
--(tipo string) y nos retorne la hora y minutos.
 create function f_horario
 (@fecha varchar(30))
  returns varchar(5)
  as
  begin
    declare @nombre varchar(5)
    set @nombre='Fecha inválida'   
    if (isdate(@fecha)=1)
    begin
      set @fecha=cast(@fecha as datetime)
      set @nombre=rtrim(cast(datepart(hour,@fecha) as char(2)))+':'
      set @nombre=@nombre+rtrim(cast(datepart(minute,@fecha) as char(2)))
    end--si es una fecha válida
    return @nombre
 end;

--8- Elimine la función "f_fecha" si existe:
 if object_id('f_fecha') is not null
  drop function f_fecha;

--9- Cree la función "f_fecha" que recibe una fecha (tipo string) 
--y nos retorne la fecha (sin hora ni minutos)
 create function f_fecha
 (@fecha varchar(30))
  returns varchar(12)
  as
  begin
    declare @nombre varchar(12)
    set @nombre='Fecha inválida'   
    if (isdate(@fecha)=1)
    begin
      set @fecha=cast(@fecha as datetime)
      set @nombre=rtrim(cast(datepart(day,@fecha) as char(2)))+'/'
      set @nombre=@nombre+rtrim(cast(datepart(month,@fecha) as char(2)))+'/'
      set @nombre=@nombre+rtrim(cast(datepart(year,@fecha) as char(4)))
    end--si es una fecha válida
    return @nombre
 end;

/*10- Muestre todas las consultas del médico llamado 'Alfredo Acosta', incluyendo el día (emplee la 
función "f_nombreDia", la fecha (emplee la función "f_fecha"), el horario (emplee la función 
"f_horario") y el nombre del paciente.*/
 select dbo.f_nombredia(fecha) as dia,
  dbo.f_fecha(fecha) as fecha,
  dbo.f_horario(fecha) as horario,
  paciente
  from consultas as c
  join medicos as m
  on m.documento=c.medico
  where m.nombre='Alfredo Acosta';

--11- Muestre todos los turnos para el día sábado, junto con la fecha, de todos los médicos.
 select fecha, m.nombre
 from consultas as c
 join medicos as m
 on m.documento=c.medico
 where dbo.f_nombredia(fecha)='sábado';

--12- Envíe a la función "f_nombreDia" una fecha y muestre el valor retornado:
 declare @valor char(30)
 set @valor='2007/04/09'
 select dbo.f_nombreDia(@valor);


--Segundo problema:
/*Una empresa almacena datos de sus empleados en una tabla denominada "empleados".
1- Elimine la tabla si existe y créela con la siguiente estructura:*/
 if object_id('empleados') is not null
  drop table empleados;
 create table empleados(
  documento char(8) not null,
  nombre varchar(30),
  fechanacimiento datetime,
  fechaingreso datetime,
  telefono char(12),
  mail varchar(50)
 );

--2- Ingrese algunos registros:
  insert into empleados values('22222222', 'Ana Acosta', '1970/10/02', '1995/10/10', '4556677', 'anitaacosta@hotmail.com');
  insert into empleados values('25555555', 'Bernardo Bustos', '1973/01/15', '1999/02/15', '4789012', null);
  insert into empleados values('30000000', 'Carlos Caseros', '1980/5/25', '2001/05/05', null, null);
  insert into empleados values('32222222', 'Estela Esper', '1985/02/20', '2006/12/12', null, 'estelaesper@gmail.com');

--3- Elimine la función "f_edad" si existe:
 if object_id('f_edad') is not null
  drop function f_edad;

/*4- Cree la función "f_edad" que reciba 2 fechas (de tipo datetime) y nos retorne un valor positivo 
correspondiente a la diferencia entre ambas.
Recuerde que en las funciones definidas por el usuario no pueden incluir funciones no 
determinísticas (como getdate), por ello, debemos enviar la fecha actual.
Note que la función retorna un valor positivo (tinyint), en ella se valida que la primera fecha a la 
cual se le  resta la segunda fecha sea mayor. Si quisiéramos calcular la cantidad de años entre dos 
fechas podríamos emplear la función del sistema "datediff" que retorna un int, esta función (ya 
vista) retorna un valor negativo si la primera fecha es menor a la segunda fecha enviada. Pero 
nosotros queremos la edad de una persona, así que siempre enviaremos como primera fecha una 
posterior a la segunda.*/
 create function f_edad
 (@fechaactual datetime,
  @fecha datetime='2007/01/01'
  )
  returns tinyint
  as
  begin
    declare @edad tinyint
    set @edad=null
    if (@fechaactual>=@fecha)
    begin
      set @edad=datepart(year,@fechaactual)-datepart(year,@fecha)
      if (datepart(month,@fecha)>datepart(month,@fechaactual))
       set @edad=@edad-1
      else 
        if (datepart(month,@fecha)=datepart(month,@fechaactual)) and 
	   (datepart(day,@fecha)>datepart(day,@fechaactual))
          set @edad=@edad-1
     end--es mayor la actual
    return @edad
  end;

--5- Muestre los nombres de los empleados y la edad (calculada con la función anteriormente creada)
 select nombre, dbo.f_edad(getdate(),fechanacimiento) as edad
  from empleados;

--6- Muestre el nombre de los empleados y la edad (calculada con la función "f_edad") que tenían al 
--ingresar a la empresa y los años de servicio.
select nombre, dbo.f_edad(fechaingreso,fechanacimiento) as 'edad al ingresar',
   dbo.f_edad(getdate(),fechaingreso) as 'años de servicio'
  from empleados;

--7- Llame a la función "f_edad" enviándole la fecha actual y su fecha de nacimiento y muestre el 
--valor retornado.
 select dbo.f_edad(getdate(),'1971/05/25');
--8- Intente invocar la función sin enviarle valores.
--Mensaje de error.
 select dbo.f_edad();

--9- Llame a la función para que tome el valor por defecto del segundo argumento.
 select dbo.f_edad(getdate(),default);

--10- Elimine la función "f_valorNulo" si existe:
  if object_id('f_valorNulo') is not null
   drop function f_valorNulo;

--11- Cree una función para reemplazar un valor "null" por el texto "No tiene".
 create function f_valorNulo
 (@valor varchar(50))
 returns varchar(50)
 begin
  if @valor is null
   set @valor='No tiene'
  return @valor
 end;

--12- Muestre todos los empleados, empleando la función "f_valorNulo" enviándole como argumento los 
--campos "mail" y "telefono".
select documento,nombre,fechanacimiento,
  dbo.f_valorNulo(telefono) as telefono,
  dbo.f_valorNulo(mail) as mail
  from empleados;

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--74- Funciones de tabla de varias instrucciones
--Una empresa almacena los datos de sus empleados en una tabla denominada "empleados".
--1- Elimine la tabvla si existe:
 if object_id('empleados') is not null
  drop table empleados;

--2- Cree la tabla con la siguiente estructura:
create table empleados(
  documento char(8) not null,
  apellido varchar(30) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(30),
  fechanacimiento datetime,
  constraint PK_empleados
   primary key(documento)
 );

--3- Ingrese algunos registros:
 insert into empleados values('22222222','Acosta','Ana','Avellaneda 123','Cordoba','1970/10/10');
 insert into empleados values('23333333','Bustos','Bernardo','Bulnes 234','Cordoba','1972/05/15');
 insert into empleados values('24444444','Caseros','Carlos','Colon 356','Carlos Paz','1980/02/25');
 insert into empleados values('25555555','Fuentes','Fabiola','Fragueiro 987','Jesus Maria','1984/06/12');

--4- Elimine la función "f_empleados" si existe:
 if object_id('f_empleados') is not null
  drop function f_empleados;

/*5- Cree una función que reciba como parámetro el texto "total" o "parcial" y muestre, en el primer 
caso, todos los datos de los empleados y en el segundo caso (si recibe el valor "parcial"): el 
documento, apellido, ciudad y año de nacimiento.*/

 create function f_empleados
 (@opcion varchar(10)
 )
 returns @listado table
 (documento char(8),
 nombre varchar(60),
 domicilio varchar(60),
 nacimiento varchar(12))
 as 
 begin
  if @opcion not in ('total','parcial')
    set @opcion='parcial'
  if @opcion='total'
   insert @listado 
    select documento,
    (apellido+' '+nombre),
    (domicilio+' ('+ciudad+')'), 
    cast(fechanacimiento as varchar(12))
     from empleados
  else
   insert @listado
   select documento,apellido,ciudad,cast(datepart(year,fechanacimiento) as char(4))
   from empleados
  return
end;
--6- Llame a la función creada anteriormente enviándole "total".
select *from dbo.f_empleados('total');

--7- Llame a la función anteriormente creada sin enviar argumento.
--Mensaje de error.
select *from dbo.f_empleados();

--8- Llame a la función enviándole una cadena vacía.
 select *from dbo.f_empleados('');

--9- Ejecute la función "f_empleados" enviando "parcial" como argumento y recupere solamente los 
--registros cuyo domicilio es "Cordoba".
 select *from dbo.f_empleados('parcial')
  where domicilio='Cordoba';


