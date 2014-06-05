SELECT alu.codigoal AS Alumno, AVG(nota.calif) AS Promedio
FROM tp1.nota AS nota
	INNER JOIN tp1.monitor AS mon
		ON nota.codmat = mon.codmat
	INNER JOIN tp1.alumno AS alu
		ON mon.codigoal = alu.codigoal
WHERE nota.calif >= 4
GROUP BY alu.codigoal
HAVING COUNT(mon.codmat) > 5;