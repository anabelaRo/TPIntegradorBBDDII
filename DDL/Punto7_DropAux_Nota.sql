ALTER TABLE tp1.aux_nota
	DROP CONSTRAINT FK_AuxNota_Alumno;
--

ALTER TABLE tp1.aux_nota
	DROP CONSTRAINT FK_AuxNota_Materia;
	
--	/*Probar si es necesario borrar las constraint o si borras directamente la tabla*/

DROP TABLE tp1.aux_nota