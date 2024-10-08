CREATE DEFINER=`root`@`localhost` PROCEDURE `MoneyTransfer`(
    IN sender_account_id INT,
    IN receiver_account_id INT,
    IN transfer_amount DECIMAL(10,2)
)
BEGIN
    DECLARE sender_balance DECIMAL(15,2);
    DECLARE receiver_balance DECIMAL(15,2);
    DECLARE sender_status ENUM('active','inactive');
    DECLARE receiver_status ENUM('active','inactive');
    DECLARE transaction_time  datetime;
    -- DECLARE insufficient_funds EXCEPTION;
	
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
    ROLLBACK; -- Roll back the transaction in case of error
    SELECT 'An error occurred during the transfer. Transaction rolled back.' AS error_message;
    END;


	
    SELECT NOW() INTO transaction_time;
	START TRANSACTION;
    -- Check if both sender and receiver accounts are active and get their balances
    SELECT balance, status INTO sender_balance, sender_status 
    FROM account
    WHERE account_id = sender_account_id;
    

    SELECT balance, status INTO receiver_balance, receiver_status 
    FROM account
    WHERE account_id = receiver_account_id;
    

    -- Check if sender's account is active and has sufficient balance
    IF sender_status = 'inactive' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sender account is not active.';
    ELSEIF sender_balance < transfer_amount THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient funds in sender account.';
    END IF;

    -- Check if receiver's account is active
    IF receiver_status ='inactive' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Receiver account is not active.';
    END IF;
	
    
    -- Perform the transaction: deduct from sender's account and add to receiver's account
    UPDATE account
    SET balance = balance - transfer_amount
    WHERE account_id = sender_account_id;

    UPDATE account
    SET balance = balance + transfer_amount
    WHERE account_id = receiver_account_id;

    -- Insert transaction records for sender and receiver, including beneficiary account IDs
    INSERT INTO transaction(account_id, transaction_type, amount, date, description)
    VALUES 
    (sender_account_id, 'transfer', transfer_amount, transaction_time, CONCAT('Transfer to account ', receiver_account_id)),
    (receiver_account_id, 'deposit', transfer_amount, transaction_time, CONCAT('Transfer from account ', sender_account_id));

COMMIT;

    -- Confirm the transfer
    SELECT CONCAT('Transfer of ', transfer_amount, ' completed from account ', sender_account_id, ' to account ', receiver_account_id) AS confirmation_message;
	
END