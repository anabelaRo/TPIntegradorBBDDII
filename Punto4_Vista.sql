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
