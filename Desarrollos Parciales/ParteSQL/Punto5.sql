SELECT mat.nombrecarr AS Carrera, mat.nombremat AS Materia, mat.Desaprobados 'Cantidad Desaprobados' 
FROM (SELECT TOP 3 COUNT(nota.codmat) AS Desaprobados, materia.nombremat, carrera.nombrecarr 
	  FROM tp1.nota 
	  INNER JOIN tp1.materia 
	  ON nota.codmat = materia.codmat
	  INNER JOIN tp1.carrera
	  ON carrera.codcarr = materia.carrera
	  WHERE nota.calif < 4
	  GROUP BY nota.codmat,materia.nombremat, carrera.nombrecarr)mat
ORDER BY mat.Desaprobados DESC







SELECT alu.nombreal, car.nombrecarr 
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
GROUP BY alu.nombreal, car.nombrecarr 


select *
from tp1.nota

insert into tp1.nota values (10, 1, '19980110', 1)
insert into tp1.nota values (10, 1, '19970110', 1)
insert into tp1.nota values (11, 1, '19990115', 2)

Select * from Employee where salary = (Select max(Salary) from Employee where salary < (Select max(Salary) from Employee where Salary < (Select max(Salary) from Employee where 