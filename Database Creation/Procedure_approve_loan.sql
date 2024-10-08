use bank_database;
DROP PROCEDURE IF EXISTS approve_loan;

DELIMITER $$

CREATE PROCEDURE approve_loan(IN input_loan_id INT, IN manager_user_id INT)
BEGIN
    DECLARE loan_status VARCHAR(20);

    IF is_manager(manager_user_id) THEN
		START TRANSACTION;
        SELECT status INTO loan_status FROM loan WHERE loan_id = input_loan_id;

        IF loan_status = 'pending' THEN
            UPDATE loan
            SET status = 'approved'
            WHERE loan_id = input_loan_id;
            COMMIT;
        ELSE
			ROLLBACK;
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Loan is already approved';
        END IF;
    ELSE 
		ROLLBACK;
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'User is not authorized to approve loans';
    END IF;
    
END$$

DELIMITER ;


CALL approve_loan(1, 3);
