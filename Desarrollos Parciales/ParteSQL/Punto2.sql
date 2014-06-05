SELECT alu.nombreal AS Nombre, car.nombrecarr AS Carrera, mat.nombremat AS Materia, AVG(nota.calif) as Promedio, MAX(fecha) as Fecha
FROM tp1.alumno AS alu
INNER JOIN tp1.monitor AS mon
	ON alu.codigoal = mon.codigoal
INNER JOIN tp1.materia mat
	ON mon.codmat = mat.codmat
	AND mat.codmat = mon.codmat
INNER JOIN tp1.carrera AS car
	ON mat.carrera = car.codcarr
INNER JOIN tp1.nota AS nota
	ON alu.codigoal = nota.codigoal
	AND mat.codmat = nota.codmat
GROUP BY alu.nombreal, car.nombrecarr, mat.nombremat
ORDER BY alu.nombreal,  car.nombrecarr, mat.nombremat
