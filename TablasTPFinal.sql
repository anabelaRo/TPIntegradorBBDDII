create schema tp1

create table tp1.alumno
(
codigoal smallint not null,
nombreal varchar(32) not null,
carrera varchar(32) not null,
CONSTRAINT PK_alumno_codigoal PRIMARY KEY CLUSTERED (codigoal))

create table tp1.monitor
(
codigoal smallint not null,
codmat smallint not null,
CONSTRAINT PK_monitor_codigoal_codmat PRIMARY KEY CLUSTERED (codigoal, codmat))

create table tp1.profesor
(
codprof smallint not null,
nombre varchar(32) not null,
puesto varchar(32) not null,
carrera varchar(32) not null,
CONSTRAINT PK_profesor_codprof PRIMARY KEY CLUSTERED (codprof))

create table tp1.materia
(
codmat smallint not null,
nombremat varchar(32) not null,
carrera varchar(32) not null,
CONSTRAINT PK_materia_codmat PRIMARY KEY CLUSTERED (codmat))

create table tp1.nota
(
codmat smallint not null,
codigoal smallint not null,
fecha date not null,
nota DECIMAL(4, 2) not null, /*poner dos digitos*/
CONSTRAINT PK_nota_codmat_codigoal PRIMARY KEY CLUSTERED (codmat, codigoal))

