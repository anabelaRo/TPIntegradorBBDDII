--1)
CREATE SCHEMA tp1;
--
CREATE TABLE tp1.alumno
(
	codigoal SMALLINT 	 not null,
	nombreal VARCHAR(32) not null,
	carrera  SMALLINT 	 not null,
	CONSTRAINT PK_alumno PRIMARY KEY CLUSTERED (codigoal)
);
--
CREATE TABLE tp1.monitor
(
	codigoal SMALLINT not null,
	codmat 	 SMALLINT not null,
	CONSTRAINT PK_monitor PRIMARY KEY CLUSTERED (codigoal, codmat)
);
--
CREATE TABLE tp1.profesor
(
	codprof SMALLINT 	not null,
	nombre 	VARCHAR(32) not null,
	puesto 	VARCHAR(32) not null,
	carrera SMALLINT 	not null,
	CONSTRAINT PK_profesor PRIMARY KEY CLUSTERED (codprof)
);
--
CREATE TABLE tp1.materia
(
	codmat 	  SMALLINT    not null,
	nombremat VARCHAR(32) not null,
	carrera   SMALLINT 	  not null,
	CONSTRAINT PK_materia PRIMARY KEY CLUSTERED (codmat)
);
--
CREATE TABLE tp1.nota
(
	codmat   SMALLINT 	   not null,
	codigoal SMALLINT 	   not null,
	fecha 	 DATETIME 	   not null,
	calif    DECIMAL(4, 2) not null,
	CONSTRAINT PK_nota PRIMARY KEY CLUSTERED (codmat, codigoal, fecha)
);
--
ALTER TABLE tp1.monitor WITH CHECK ADD CONSTRAINT FK_Monitor_Alumno FOREIGN KEY(codigoal) 
	REFERENCES tp1.alumno(codigoal)
	ON UPDATE CASCADE
	ON DELETE CASCADE
ALTER TABLE tp1.monitor CHECK CONSTRAINT FK_Monitor_Alumno;
--
ALTER TABLE tp1.monitor WITH CHECK ADD CONSTRAINT FK_Monitor_Materia FOREIGN KEY(codmat)
	REFERENCES tp1.materia(codmat)
	ON UPDATE CASCADE
	ON DELETE CASCADE
ALTER TABLE tp1.monitor CHECK CONSTRAINT FK_Monitor_Materia;
--
ALTER TABLE tp1.nota WITH CHECK ADD  CONSTRAINT FK_Nota_Materia FOREIGN KEY(codmat)
	REFERENCES tp1.materia(codmat)
	ON UPDATE CASCADE
	ON DELETE CASCADE
ALTER TABLE tp1.nota CHECK CONSTRAINT FK_Nota_Materia;
--
ALTER TABLE tp1.nota WITH CHECK ADD CONSTRAINT FK_Nota_Alumno FOREIGN KEY(codigoal)
	REFERENCES tp1.alumno(codigoal)
	ON UPDATE CASCADE
	ON DELETE CASCADE
ALTER TABLE tp1.nota CHECK CONSTRAINT FK_Nota_Alumno;
--
--
--2)
ALTER TABLE tp1.alumno 
	ADD domicilio VARCHAR(50) NOT NULL;
--
ALTER TABLE tp1.alumno 
	ADD localidad VARCHAR(50) NOT NULL;
--
ALTER TABLE tp1.alumno 
	ADD provicia VARCHAR(50) NOT NULL;
--
ALTER TABLE tp1.alumno 
	ADD codigopostal INT NOT NULL;
--
--
--3)
ALTER TABLE tp1.materia 
	ALTER COLUMN nombremat VARCHAR(52) NOT NULL;
--
--
--4)
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW tp1.v_AnalisisMatematico
AS 
	SELECT alu.codigoal  as 'codigoAlumno', 
		   alu.nombreal  as 'nombre', 
		   alu.carrera   as 'carrera', 
		   mat.codmat    as 'codMateria', 
		   mat.nombremat as 'materia'
	FROM tp1.alumno alu
		INNER JOIN tp1.monitor mon
			ON alu.codigoal = mon.codigoal
		INNER JOIN tp1.materia mat
			ON mon.codmat = mat.codmat
	WHERE mat.nombremat = 'Análisis Matemático';
--
--
--5)
CREATE TABLE tp1.carrera
(
	codcarr 	SMALLINT 	not null,
	nombrecarr  VARCHAR(50) not null,
	CONSTRAINT PK_carrera PRIMARY KEY CLUSTERED (codcarr)
);
--
ALTER TABLE tp1.alumno WITH CHECK ADD  CONSTRAINT FK_Alumno_Carrera FOREIGN KEY(carrera)
	REFERENCES tp1.carrera(codcarr)
	ON UPDATE CASCADE
	ON DELETE CASCADE
ALTER TABLE tp1.alumno CHECK CONSTRAINT FK_Alumno_Carrera;
--
ALTER TABLE tp1.profesor WITH CHECK ADD  CONSTRAINT FK_Profesor_Carrera FOREIGN KEY(carrera)
	REFERENCES tp1.carrera(codcarr)
	ON UPDATE CASCADE
	ON DELETE CASCADE
ALTER TABLE tp1.profesor CHECK CONSTRAINT FK_Profesor_Carrera;
--
ALTER TABLE tp1.materia WITH CHECK ADD  CONSTRAINT FK_Materia_Carrera FOREIGN KEY(carrera)
	REFERENCES tp1.carrera(codcarr)
ALTER TABLE tp1.materia CHECK CONSTRAINT FK_Materia_Carrera
--
--
--6)
SELECT * 
INTO tp1.aux_nota  
FROM  tp1.nota
WHERE codmat = 9
  AND calif < 4 
--
ALTER TABLE tp1.aux_nota WITH CHECK ADD CONSTRAINT PK_aux_nota PRIMARY KEY CLUSTERED (codmat, codigoal, fecha)
--
ALTER TABLE tp1.aux_nota WITH CHECK ADD CONSTRAINT FK_AuxNota_Materia FOREIGN KEY(codmat)
	REFERENCES tp1.materia(codmat)
	ON UPDATE CASCADE
	ON DELETE CASCADE
ALTER TABLE tp1.aux_nota CHECK CONSTRAINT FK_AuxNota_Materia
--
ALTER TABLE tp1.aux_nota WITH CHECK ADD CONSTRAINT FK_AuxNota_Alumno FOREIGN KEY(codigoal)
	REFERENCES tp1.alumno(codigoal)
	ON UPDATE CASCADE
	ON DELETE CASCADE
ALTER TABLE tp1.aux_nota CHECK CONSTRAINT FK_AuxNota_Alumno;
--
--
--7)
ALTER TABLE tp1.aux_nota
	DROP CONSTRAINT FK_AuxNota_Alumno;
--
ALTER TABLE tp1.aux_nota
	DROP CONSTRAINT FK_AuxNota_Materia;
--
DROP TABLE tp1.aux_nota;
--
--
--8)
ALTER TABLE tp1.profesor
	DROP CONSTRAINT FK_Profesor_Carrera;
--
ALTER TABLE tp1.profesor
	DROP COLUMN carrera;
--
--
--9)
ALTER TABLE tp1.materia
	ADD nota VARCHAR(100) NULL;
--	
ALTER TABLE tp1.materia
	ADD CONSTRAINT Nota_Default
		DEFAULT GETDATE() FOR nota;
--
--
--10)
ALTER TABLE tp1.nota
	ADD CONSTRAINT chkNota1a10 CHECK (calif BETWEEN 1 AND 10);
--
--
--11)
ALTER TABLE tp1.materia 
	ADD CONSTRAINT AK_NombreMat UNIQUE (nombremat);
--
--
--12)
CREATE LOGIN B1 WITH PASSWORD='Password1';
CREATE USER B1 FOR LOGIN B1;
--
CREATE LOGIN B2 WITH PASSWORD='Password2';
CREATE USER B2 FOR LOGIN B2;
--
CREATE LOGIN B3 WITH PASSWORD='Password3';
CREATE USER B3 FOR LOGIN B3;
--
--A)
REVOKE ALL PRIVILEGES ON tp1.alumno TO B1;
--
GRANT ALL PRIVILEGES ON tp1.alumno TO B1;
--
REVOKE ALL PRIVILEGES ON tp1.profesor TO B1;
--
GRANT ALL PRIVILEGES ON tp1.profesor TO B1;
--
--B)
REVOKE ALL PRIVILEGES ON tp1.materia TO B2;
--
GRANT SELECT, UPDATE, INSERT ON tp1.materia(nota) TO B2;
--
--C)
CREATE PROCEDURE tp1.sp_valida_aplazos
	@CODMAT INT
AS
BEGIN
	--
	DECLARE @DESCRIPCIONERROR VARCHAR(200)
	--
	BEGIN TRY
		SELECT *
		FROM tp1.materia
		WHERE codmat = @CODMAT;
	END TRY
	--
	BEGIN CATCH
		SELECT @DESCRIPCIONERROR = 'Error al consultar tp1.nota - ' + ERROR_MESSAGE()
		--
		RAISERROR (@DESCRIPCIONERROR,16,1) 
	END CATCH
	--
END;
--
GRANT EXECUTE ON tp1.sp_valida_aplazos TO B3;
--
--D)
REVOKE UPDATE ON tp1.materia TO B2;	