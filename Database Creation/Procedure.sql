
-- update user information
DROP PROCEDURE IF EXISTS update_user_info;

DELIMITER $$

CREATE PROCEDURE `update_user_info`(
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


-- Withdraw funds from an account

DROP PROCEDURE IF EXISTS WithdrawFunds;

DELIMITER $$

CREATE PROCEDURE WithdrawFunds(
    IN acc_number VARCHAR(255),
    IN withdraw_amount DECIMAL(15,2),
    IN branch INT,
    IN description VARCHAR(255),
    OUT result VARCHAR(255)
)
BEGIN
    DECLARE current_balance DECIMAL(15,2);
    DECLARE acc_id INT;

    -- Declare a handler for any errors
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        -- In case of an error, rollback the transaction
        ROLLBACK;
        SET result = 'Error occurred during withdrawal';
    END;

    -- Start the transaction
    START TRANSACTION;

    -- Labeled block to handle procedure exit
    proc_exit: BEGIN

        -- Get the account ID based on the account number
        SELECT account_id INTO acc_id FROM account WHERE account_number = acc_number;

        -- Check if the account ID was found
        IF acc_id IS NULL THEN
            SET result = 'Account not found';
            LEAVE proc_exit; -- Exit the procedure if account is not found
        END IF;

        -- Check the current balance of the account
        SELECT balance INTO current_balance FROM account WHERE account_id = acc_id;

        -- Check if sufficient balance is available
        IF current_balance >= withdraw_amount THEN
            -- Update the account balance
            UPDATE account 
            SET balance = balance - withdraw_amount 
            WHERE account_id = acc_id;
            
            -- Insert the transaction into the transaction table
            INSERT INTO transaction (account_id, transaction_type, amount, date, description)
            VALUES (acc_id, 'withdrawal', withdraw_amount, NOW(), description);
            
            -- Get the transaction ID of the inserted transaction
            SET @trans_id = LAST_INSERT_ID();
            
            -- Log the withdrawal into the withdrawal table
            INSERT INTO withdrawal (transaction_id, branch_id)
            VALUES (@trans_id, branch);
            
            -- Commit the transaction after all operations succeed
            COMMIT;

            -- Success message
            SET result = 'Withdrawal successful';
        ELSE
            -- Insufficient balance message, rollback the transaction
            ROLLBACK;
            SET result = 'Insufficient balance for withdrawal';
        END IF;

    END proc_exit;
END $$

DELIMITER ;



DROP PROCEDURE IF EXISTS DepositFunds;

DELIMITER $$

CREATE PROCEDURE DepositFunds(
    IN acc_number VARCHAR(255),
    IN deposit_amount DECIMAL(15,2),
    IN branch INT,
    IN description VARCHAR(255),
    OUT result VARCHAR(255)
)
BEGIN
    DECLARE current_balance DECIMAL(15,2);
    DECLARE acc_id INT;

    -- Declare a handler for any errors
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        -- In case of an error, rollback the transaction
        ROLLBACK;
        SET result = 'Error occurred during deposit';
    END;

    START TRANSACTION;

    -- Labeled block to handle procedure exit
    proc_exit: BEGIN

        -- Get the account ID based on the account number
        SELECT account_id INTO acc_id FROM account WHERE account_number = acc_number;

        -- Check if the account ID was found
        IF acc_id IS NULL THEN
            SET result = 'Account not found';
            LEAVE proc_exit; -- Exit the procedure if account is not found
        END IF;

        -- Check the current balance of the account
        SELECT balance INTO current_balance FROM account WHERE account_id = acc_id;

        -- Update the account balance
        UPDATE account 
        SET balance = balance + deposit_amount 
        WHERE account_id = acc_id;
        
        -- Insert the transaction into the transaction table
        INSERT INTO transaction (account_id, transaction_type, amount, date, description)
        VALUES (acc_id, 'deposit', deposit_amount, NOW(), description);
        
        -- Get the transaction ID of the inserted transaction
        SET @trans_id = LAST_INSERT_ID();
        
        -- Log the deposit into the deposit table (assuming a correct table name)
        INSERT INTO deposit (transaction_id, branch_id)
        VALUES (@trans_id, branch);

        COMMIT;

        SET result = 'Deposit successful';

    END proc_exit;
END $$

DELIMITER ;
