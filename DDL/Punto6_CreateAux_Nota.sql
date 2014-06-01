SELECT * INTO tp1.aux_nota  
FROM  tp1.nota
WHERE codmat = 9 /*BASES DE DATOS I*/
AND calif < 4     /*Se aprueba con 4*/

ALTER TABLE tp1.aux_nota WITH CHECK ADD  CONSTRAINT PK_aux_nota PRIMARY KEY CLUSTERED (codmat, codigoal, fecha)
GO

ALTER TABLE tp1.aux_nota CHECK CONSTRAINT FK_AuxNota_Materia
GO

ALTER TABLE tp1.aux_nota WITH CHECK ADD  CONSTRAINT FK_AuxNota_Alumno FOREIGN KEY(codigoal)
REFERENCES tp1.alumno(codigoal)
GO
ALTER TABLE tp1.aux_nota CHECK CONSTRAINT FK_AuxNota_Alumno
GO

select * from tp1.aux_nota /*query para validar el create*/