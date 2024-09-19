
-- get the account summary
CREATE VIEW `accounts_summary` AS
SELECT 
    c.customer_id,
    COALESCE(SUM(CASE WHEN a.account_type = 'checking' THEN a.balance ELSE 0 END), 0) AS checking_account_balance,
    COALESCE(SUM(CASE WHEN a.account_type = 'savings' THEN a.balance ELSE 0 END), 0) AS savings_account_balance,
    COALESCE(SUM(fd.amount), 0) AS fd_balance
FROM 
    customer c
    LEFT JOIN account a ON c.customer_id = a.customer_id
    LEFT JOIN savings_account sa ON a.account_id = sa.account_id
    LEFT JOIN fixed_deposit fd ON sa.savings_account_id = fd.savings_account_id
GROUP BY 
    c.customer_id;


-- get the transaction history
CREATE VIEW `transaction_history` AS
SELECT 
    c.customer_id,
    t.transaction_id,
    t.transaction_type,
    t.amount,
    t.date,
    t.description,
    a.account_number
FROM 
    customer c
JOIN 
    account a ON c.customer_id = a.customer_id
JOIN 
    transaction t ON a.account_id = t.account_id
ORDER BY t.date DESC;

-- get the user information
CREATE VIEW user_info AS
SELECT 
    u.user_id,
    u.user_name AS username,
    u.email,
    c.mobile_number,
    c.landline_number,
    c.address
FROM 
    user u
JOIN 
    customer c ON u.user_id = c.user_id;
