CREATE SCHEMA tp1

CREATE TABLE tp1.alumno
(
codigoal SMALLINT not null,
nombreal VARCHAR(32) not null,
carrera SMALLINT not null,
CONSTRAINT PK_alumno PRIMARY KEY CLUSTERED (codigoal))

CREATE TABLE tp1.monitor
(
codigoal SMALLINT not null,
codmat SMALLINT not null,
CONSTRAINT PK_monitor PRIMARY KEY CLUSTERED (codigoal, codmat))

CREATE TABLE tp1.profesor
(
codprof SMALLINT not null,
nombre VARCHAR(32) not null,
puesto VARCHAR(32) not null,
carrera SMALLINT not null,
CONSTRAINT PK_profesor PRIMARY KEY CLUSTERED (codprof))

CREATE TABLE tp1.materia
(
codmat SMALLINT not null,
nombremat VARCHAR(32) not null,
carrera SMALLINT not null,
CONSTRAINT PK_materia PRIMARY KEY CLUSTERED (codmat))

CREATE TABLE tp1.nota
(
codmat SMALLINT not null,
codigoal SMALLINT not null,
fecha DATE not null,
nota DECIMAL(4, 2) not null, /*poner dos digitos*/
CONSTRAINT PK_nota PRIMARY KEY CLUSTERED (codmat, codigoal))

ALTER TABLE tp1.monitor WITH CHECK ADD  CONSTRAINT FK_Monitor_Alumno FOREIGN KEY(codigoal)
REFERENCES tp1.alumno(codigoal)
GO
ALTER TABLE tp1.monitor CHECK CONSTRAINT FK_Monitor_Alumno
GO

ALTER TABLE tp1.monitor WITH CHECK ADD  CONSTRAINT FK_Monitor_Materia FOREIGN KEY(codmat)
REFERENCES tp1.materia(codmat)
GO
ALTER TABLE tp1.monitor CHECK CONSTRAINT FK_Monitor_Materia
GO

ALTER TABLE tp1.nota WITH CHECK ADD  CONSTRAINT FK_Nota_Materia FOREIGN KEY(codmat)
REFERENCES tp1.materia(codmat)
GO
ALTER TABLE tp1.nota CHECK CONSTRAINT FK_Nota_Materia
GO

ALTER TABLE tp1.nota WITH CHECK ADD  CONSTRAINT FK_Nota_Alumno FOREIGN KEY(codigoal)
REFERENCES tp1.alumno(codigoal)
GO
ALTER TABLE tp1.nota CHECK CONSTRAINT FK_Nota_Alumno
GO