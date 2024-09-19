
-- update user information
DROP PROCEDURE IF EXISTS update_user_info;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_info`(
    IN userId INT,
    IN new_username VARCHAR(255),
    IN new_email VARCHAR(255),
    IN new_address TEXT,
    IN new_mobile_number VARCHAR(15),
    IN new_landline_number VARCHAR(15)
)
BEGIN
    -- Update the 'user' table
    UPDATE user
    SET user_name = new_username, email = new_email
    WHERE user_id = userId;

    -- Update the 'customer' table
    UPDATE customer
    SET address = new_address, mobile_number = new_mobile_number, landline_number = new_landline_number
    WHERE user_id = userId;
END $$

DELIMITER ;
