SELECT carr.nombrecarr AS Carrera, AVG(nota.calif) AS Promedio, alu.nombreal AS Nombre
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