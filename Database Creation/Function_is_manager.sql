DELIMITER $$

DROP FUNCTION IF EXISTS is_manager;

CREATE FUNCTION is_manager(input_user_id INT) RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE user_role VARCHAR(10);
    DECLARE staff_role VARCHAR(10);
    
    SELECT role INTO user_role FROM user WHERE user_id = input_user_id LIMIT 1;

    IF user_role = 'staff' THEN
        SELECT role INTO staff_role FROM Staff WHERE user_id = input_user_id LIMIT 1;
        IF staff_role = 'manager' THEN
            RETURN TRUE;
        END IF;
    END IF;
    
    RETURN FALSE;
END$$

DELIMITER ;