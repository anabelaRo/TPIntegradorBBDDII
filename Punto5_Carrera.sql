CREATE TABLE tp1.carrera
(
codcarr SMALLINT not null,
nombrecarr VARCHAR(50) not null,
CONSTRAINT PK_carrera PRIMARY KEY CLUSTERED (codcarr)
)

ALTER TABLE tp1.alumno WITH CHECK ADD  CONSTRAINT FK_Alumno_Carrera FOREIGN KEY(carrera)
REFERENCES tp1.carrera(codcarr)
GO
ALTER TABLE tp1.alumno CHECK CONSTRAINT FK_Alumno_Carrera
GO

ALTER TABLE tp1.profesor WITH CHECK ADD  CONSTRAINT FK_Profesor_Carrera FOREIGN KEY(carrera)
REFERENCES tp1.carrera(codcarr)
GO
ALTER TABLE tp1.profesor CHECK CONSTRAINT FK_Profesor_Carrera
GO

ALTER TABLE tp1.materia WITH CHECK ADD  CONSTRAINT FK_Materia_Carrera FOREIGN KEY(carrera)
REFERENCES tp1.carrera(codcarr)
GO
ALTER TABLE tp1.materia CHECK CONSTRAINT FK_Materia_Carrera
GO