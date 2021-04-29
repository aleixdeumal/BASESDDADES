use videoclub;
delimiter //
  drop trigger if exists act_14_1;
  drop trigger if exists act_14_2;
create trigger act_14_1
      before insert on PELLICULES
      for each row
         begin 
            set new.titol_peli = upper(new.titol_peli);
         end//

create trigger act_14_2
      before update on PELLICULES
      for each row
         begin 
            set new.titol_peli = upper(new.titol_peli);
         end//

delimiter ;
