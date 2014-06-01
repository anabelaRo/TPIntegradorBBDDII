USE [AdventureWorks]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [tp1].[v_AnalisisMatematico] 
AS 

SELECT alu.codigoal as 'codigo alumno', alu.nombreal as 'nombre', alu.carrera, mat.codmat as 'cod materia', mat.nombremat as 'materia'
FROM [tp1].[alumno] alu
INNER JOIN [tp1].[monitor] mon
ON alu.codigoal = mon.codigoal
INNER JOIN [tp1].[materia] mat
ON mon.codmat = mat.codmat
WHERE mat.nombremat = 'Análisis Matemático'

GO

insert into tp1.materia values (1, 'Análisis Matemático', 'Ingenieria informática')
insert into tp1.materia values (2, 'Bases de datos I', 'Ingenieria informática')
insert into tp1.monitor values (1, 1)
insert into tp1.alumno values (1, 'Anabela', 'Ingenieria informática')
insert into tp1.nota values (2, 1, '20140505', '2.5')