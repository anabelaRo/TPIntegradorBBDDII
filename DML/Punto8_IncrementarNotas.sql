UPDATE tp1.nota
   SET calif = (SELECT CASE
                            WHEN calif < 9
                                 THEN calif + 1
                            ELSE 10
                       END)