use videoclub;

DELIMITER//
DROP trigger if exists act_17//

CREATE TRIGGER act_17
    AFTER INSERT
    ON VISUALITZACIONS

    FOR EACH ROW
    BEGIN
        DECLARE pa_VisComplertes smallint unsigned;
        DECLARE pa_VisParcials smallint unsigned;

            SELECT COUNT(*)
                INTO pa_VisComplertes
                FROM VISUALITZACIONS
                WHERE temps IS NULL AND 
                id_peli = new.id_peli;
            
            SELECT COUNT(*)
                INTO pa_VisParcials
                FROM VISUALITZACIONS
                WHERE temps IS NOT NULL AND 
                id_peli = new.id_peli;

        UPDATE PELLICULES
            SET qtatVisualCompc = pa_VisComplertes,
            qtatVisualParc = pa_VisParcials
            WHERE id_peli = new.id_peli;
                
    END//
DELIMITER;

