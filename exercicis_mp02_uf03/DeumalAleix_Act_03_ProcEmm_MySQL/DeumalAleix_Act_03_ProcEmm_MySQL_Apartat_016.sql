SELECT count(*)
FROM VISUALITZACIONS
WHERE id_soci=2222;

ALTER TABLE SOCIS
   ADD nvisualitzacio smallint unsigned;


use videoclub;
delimiter //
drop trigger if exists act_16;

create trigger act_16
      after insert on VISUALITZACIONS
      for each row
         begin
           declare pa_id_soci varchar(10);
           declare pa_qtat_visualitzacions smallint unsigned;

           set pa_id_soci = new.id_soci;

           SELECT count(*)
             INTO pa_qtat_visualitzacions
          FROM VISUALITZACIONS
              WHERE id_soci = pa_id_soci;
   -- WHERE id_soci = new.id_soci;

           UPDATE SOCIS
             SET   nvisualitzacio = pa_qtat_visualitzacions
             WHERE id_soci = pa_id_soci;
   -- WHERE id_soci = new.id_soci;
 end//

delimiter ;
