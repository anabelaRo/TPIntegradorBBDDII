SELECT car.codcarr AS Carrera, car.nombrecarr, COUNT(alu.codigoal) Cant_Alumnos
FROM tp1.carrera AS car
	INNER JOIN tp1.alumno AS alu
		ON car.codcarr = alu.carrera
GROUP BY car.codcarr, car.nombrecarr
ORDER BY COUNT(alu.codigoal) DESC;
