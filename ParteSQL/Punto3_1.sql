SELECT c.carrera, MAX(c.Promedio) as Promedio
from (SELECT car.nombrecarr AS Carrera,AVG(nota.calif) as Promedio
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
GROUP BY car.nombrecarr
) c
group by c.Carrera


select *
from tp1.alumno alu
where alu.


SELECT AVG(nota.calif) AS Promedio, alu.nombreal AS Nota, carr.nombrecarr AS Carrera
FROM tp1.alumno alu
INNER JOIN tp1.nota
	ON alu.codigoal = nota.codigoal
INNER JOIN tp1.carrera carr
	ON alu.carrera  = carr.codcarr
GROUP BY alu.nombreal, carr.nombrecarr
HAVING AVG(nota.calif) IN (SELECT MAX(PromXCarrera)
							FROM (SELECT mat.carrera, AVG(nota.calif) AS PromXCarrera, nota.codigoal
									FROM tp1.nota
									INNER JOIN tp1.materia mat
									ON nota.codmat = mat.codmat
									GROUP BY mat.carrera, nota.codigoal)p
								GROUP BY p.carrera
						   )