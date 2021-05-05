USE videoclub;
    DROP FUNCTION IF EXISTS Ex12;
    DELIMITER //
    CREATE FUNCTION Ex12(CodiPeli SMALLINT UNSIGNED) 
        RETURNS SMALLINT
        DETERMINISTIC
    BEGIN
        DECLARE fi int default false;
        DECLARE CodiActor SMALLINT UNSIGNED;
        DECLARE curso cursor for
            SELECT   id_actor
            FROM ACTORS_PELLICULES
            WHERE id_peli = CodiPeli
            AND principal = 1;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND 
    SET fi = 1;
    open curso;
    bucle:loop
        fetch curso into CodiActor;

        if fi = 1 then leave bucle;
        end if;
        RETURN CodiActor;
    END loop bucle;
    close curso;
    
    END//
DELIMITER ;

SELECT ACTORS.nom_actor, PELLICULES.titol_peli
FROM ACTORS , PELLICULES
WHERE id_actor = Ex12(2) AND id_peli = 2;