USE bank_database;
CREATE DEFINER=`root`@`localhost` FUNCTION `Calculate_interest`(`fd_plan_id` INT, `amount` DECIMAL(15,2)) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE `interest_rate` DECIMAL(5,2);
    DECLARE `interest` DECIMAL(10,2);

    -- Retrieve the interest rate based on the fd_plan_id
    SELECT fd.interest_rate INTO `interest_rate`
    FROM fd_plan AS fd
    WHERE fd.fd_plan_id = `fd_plan_id`;

    -- Calculate interest
    SET `interest` = `amount` * (`interest_rate`/1200);

    -- Return the calculated interest
    RETURN `interest`;
END