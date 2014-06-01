SELECT alu.nombreal AS Nombre, car.nombrecarr AS Carrera, mat.nombremat AS Materia, nota.calif AS Calificación, nota.fecha AS Fecha
FROM tp1.alumno AS alu
INNER JOIN tp1.mONitor AS mON
	ON alu.codigoal = mON.codigoal
INNER JOIN tp1.materia mat
	ON mON.codmat = mat.codmat
	AND mat.codmat = mON.codmat
INNER JOIN tp1.carrera AS car
	ON mat.carrera = car.codcarr
INNER JOIN tp1.nota AS nota
	ON alu.codigoal = nota.codigoal
	AND mat.codmat = nota.codmat
ORDER BY alu.nombreal,  car.nombrecarr, mat.nombremat
