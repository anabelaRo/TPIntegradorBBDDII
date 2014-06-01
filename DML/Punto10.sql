--Mostrar el código de alumno y el promedio de las materias aprobadas siempre que haya aprobado 5 ó más materias.

SELECT alu.codigoal, alu.nombreal , mon.codmat, nota.calif
FROM tp1.alumno AS alu
	INNER JOIN tp1.monitor AS mon
		ON alu.codigoal = mon.codigoal
	INNER JOIN tp1.nota AS nota
		ON mon.codmat = nota.codmat
WHERE nota.calif >= 4
GROUP BY alu.codigoal;

SELECT *
FROM tp1.alumno;

SELECT *
FROM tp1.monitor;

SELECT *
FROM tp1.nota;