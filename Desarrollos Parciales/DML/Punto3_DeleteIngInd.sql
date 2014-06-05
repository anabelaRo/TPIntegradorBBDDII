DELETE alu
   FROM tp1.alumno as alu 
   inner join tp1.monitor as mon
   on alu.codigoal = mon.codigoal
   inner join tp1.materia as mat
   on mon.codmat = mat.codmat
   WHERE alu.carrera = 3
   OR mat.nombremat LIKE 'Ingeniería Industrial'
 