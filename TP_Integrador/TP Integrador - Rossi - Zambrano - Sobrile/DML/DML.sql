--1)
insert into tp1.carrera values (1, 'Medicina');
insert into tp1.carrera values (2, 'Educaci�n F�sica');
insert into tp1.carrera values (3, 'Ingenier�a Industrial');
insert into tp1.carrera values (4, 'Tecnicatura Web');
--
insert into tp1.alumno values (1, 'Roberto Ram�rez', 3, 'Av Manuel Dorrego 1163', 'Villa Crespo', 'Buenos Aires', 1418 );
insert into tp1.alumno values (2, 'Juan P�rez', 3, 'Av Juan B Justo 2563', 'Villa Crespo', 'Buenos Aires', 1414 );
insert into tp1.alumno values (3, 'Maria Gonzalez', 3, 'Av Rivadavia 15345', 'Flores', 'Buenos Aires', 1418 );
insert into tp1.alumno values (4, 'Emiliano Zambrano', 4, 'Facundo 2341', 'Nueva', 'Buenos Aires', 1701 );
--
INSERT INTO tp1.materia (codmat, nombremat, carrera) VALUES (1, 'Anatom�a', 1);
INSERT INTO tp1.materia (codmat, nombremat, carrera) VALUES (2, 'Biolog�a Molecular', 1);
INSERT INTO tp1.materia (codmat, nombremat, carrera) VALUES (3, 'Gen�tica', 1);  
INSERT INTO tp1.materia (codmat, nombremat, carrera) VALUES (4, 'F�tbol', 2);
INSERT INTO tp1.materia (codmat, nombremat, carrera) VALUES (5, 'Pedagog�a', 2);
INSERT INTO tp1.materia (codmat, nombremat, carrera) VALUES (6, 'Matem�tica Discreta', 3);
INSERT INTO tp1.materia (codmat, nombremat, carrera) VALUES (7, 'An�lisis Matem�tico', 3);
INSERT INTO tp1.materia (codmat, nombremat, carrera) VALUES (8, 'Porgramaci�n Web I', 4);
INSERT INTO tp1.materia (codmat, nombremat, carrera) VALUES (9, 'Bases de datos I', 4);
INSERT INTO tp1.materia (codmat, nombremat, carrera) VALUES (10, 'Neurociencia', 1);
INSERT INTO tp1.materia (codmat, nombremat, carrera) VALUES (11, 'Anatom�a II', 1);
INSERT INTO tp1.materia (codmat, nombremat, carrera) VALUES (12, 'Gen�tica II', 1);
INSERT INTO tp1.materia (codmat, nombremat, carrera) VALUES (13, 'Cirug�a', 1);
--
insert into tp1.monitor values (1, 1);
insert into tp1.monitor values (1, 3);
insert into tp1.monitor values (2, 6);
insert into tp1.monitor values (2, 7);
insert into tp1.monitor values (3, 6);
insert into tp1.monitor values (3, 7);
insert into tp1.monitor values (4, 8);
insert into tp1.monitor values (4, 9);
insert into tp1.monitor values (1, 10);
insert into tp1.monitor values (1, 11);
insert into tp1.monitor values (1, 12);
insert into tp1.monitor values (1, 13);
	 
insert into tp1.profesor values (1, 'Juan Carlos Fernandez', 'Adjunto');
insert into tp1.profesor values (2, 'Vanesa Rossi', 'Titular');
insert into tp1.profesor values (3, 'Juan Sobrile', 'Suplente');

insert into tp1.nota values (1, 1, '19990101', 6.5);
insert into tp1.nota values (7, 2, '19990906', 2);
insert into tp1.nota values (7, 3, '20140925', 7);
insert into tp1.nota values (2, 1, '19990110', 8);
insert into tp1.nota values (10, 1, '19990110', 7);
insert into tp1.nota values (11, 1, '19990215', 8.5);
insert into tp1.nota values (12, 1, '20000215', 9);
insert into tp1.nota values (13, 1, '20010215', 9);
--
--
--2)
insert into tp1.alumno values (1, 'Carlos Alberto Garc�a Moreno', 1, 'Tucum�n 123', 'Mor�n', 'Buenos Aires', 1708);
--
--
--3)
DELETE alu
FROM tp1.alumno AS alu 
	INNER JOIN tp1.monitor AS mon
		ON alu.codigoal = mon.codigoal
   INNER JOIN tp1.materia AS mat
		ON mon.codmat = mat.codmat
WHERE alu.carrera = 3
   OR mat.nombremat LIKE 'Ingenier�a Industrial';
 --
 --
 --4)
 DELETE n
 FROM tp1.nota AS n
	INNER JOIN tp1.alumno AS al
		ON n.codigoal = al.codigoal
 WHERE al.localidad LIKE 'Nueva';
 --
 --
 --5)
 DELETE FROM tp1.profesor
 WHERE puesto LIKE 'Adjunto';
 --
 --
 --6)
 DELETE FROM tp1.monitor;
 --
 --
 --7)
 DELETE FROM tp1.nota
 WHERE year(fecha) = '1999'
   AND calif < 7;
 --
 --
 --8)
 UPDATE tp1.nota
 SET calif = ( SELECT CASE
						WHEN calif < 9
                           THEN calif + 1
                        ELSE 10
                       END
			 );
--
--
--9)
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
						   );
--
--
--10)
SELECT alu.codigoal AS Alumno, AVG(nota.calif) AS Promedio
FROM tp1.nota AS nota
	INNER JOIN tp1.monitor AS mon
		ON nota.codmat = mon.codmat
	INNER JOIN tp1.alumno AS alu
		ON mon.codigoal = alu.codigoal
WHERE nota.calif >= 4
GROUP BY alu.codigoal
HAVING COUNT(mon.codmat) > 5;
