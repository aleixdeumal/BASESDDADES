use videoclub;
delimiter //
drop trigger if exists act_15;

create trigger act_15
      after insert on VISUALITZACIONS
      for each row
         begin
           declare paCodiPeli smallint unsigned;
           set paCodiPeli = new.id_peli;
           update PELLICULES
               set recaudacio_peli = recaudacio_peli + 2
               where id_peli = new.id_peli;
         end//

delimiter ;

SELECT titol_peli, recaudacio_peli
FROM PELLICULES
WHERE id_peli = 2;

/*
+-------------+-----------------+
| titol_peli  | recaudacio_peli |
+-------------+-----------------+
| LA TERMINAL |       140813273 |
+-------------+-----------------+
*/
INSERT INTO VISUALITZACIONS
   VALUES (2,4444,"00:54:00");
   
SELECT titol_peli,recaudacio_peli
FROM PELLICULES
WHERE id_peli = 2;
/*
+-------------+-----------------+
| titol_peli  | recaudacio_peli |
+-------------+-----------------+
| LA TERMINAL |       140813275 |
+-------------+-----------------+
*/
