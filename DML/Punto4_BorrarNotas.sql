DELETE n
  FROM tp1.nota AS n
       INNER JOIN tp1.alumno AS al
         ON n.codigoal = al.codigoal
 WHERE al.localidad = 'Nueva'