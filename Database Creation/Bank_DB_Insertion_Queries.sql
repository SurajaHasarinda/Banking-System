USE bank_database;
-- Populate user table
INSERT INTO user (user_name, password, email, role)
VALUES (
        'john_doe',
        'password123',
        'john@example.com',
        'customer'
    ),
    (
        'jane_smith',
        'password456',
        'jane@example.com',
        'customer'
    ),
    (
        'admin_user',
        'adminpass',
        'admin@bank.com',
        'staff'
    ),
    (
        'staff_user',
        'staffpass',
        'staff@bank.com',
        'staff'
    ),
    (
        'alice_brown',
        'pass789',
        'alice@example.com',
        'customer'
    ),
    (
        'bob_martin',
        'pass987',
        'bob@example.com',
        'customer'
    ),
    (
        'charlie_black',
        'charliepass',
        'charlie@example.com',
        'customer'
    ),
    (
        'diana_green',
        'diana123',
        'diana@example.com',
        'customer'
    ),
    (
        'eve_white',
        'evepass',
        'eve@example.com',
        'staff'
    ),
    (
        'frank_gray',
        'frankpass',
        'frank@example.com',
        'staff'
    );
-- Populate Staff table
INSERT INTO Staff (user_id, full_name, date_of_birth, NIC, role)
VALUES (
        3,
        'Admin User',
        '1980-01-01',
        '800101-1234',
        'manager'
    ),
    (
        4,
        'Staff User',
        '1990-05-15',
        '900515-5678',
        'employee'
    ),
    (
        9,
        'Eve White',
        '1985-07-20',
        '850720-6789',
        'manager'
    ),
    (
        10,
        'Frank Gray',
        '1991-11-02',
        '911102-2345',
        'employee'
    );
-- Populate customer table
INSERT INTO customer (
        user_id,
        customer_type,
        mobile_number,
        landline_number,
        address
    )
VALUES (
        1,
        'individual',
        '1234567890',
        '0123456789',
        '123 Main St, City'
    ),
    (
        2,
        'organization',
        '9876543210',
        '9876543210',
        '456 Org Ave, Town'
    ),
    (
        5,
        'individual',
        '2234567890',
        '0223456789',
        '789 Elm St, City'
    ),
    (
        6,
        'individual',
        '3234567890',
        '0323456789',
        '321 Oak St, City'
    ),
    (
        7,
        'individual',
        '4234567890',
        '0423456789',
        '654 Maple St, City'
    ),
    (
        8,
        'individual',
        '5234567890',
        '0523456789',
        '987 Pine St, City'
    );
-- Populate organization table
INSERT INTO organization (customer_id, name, lisence_number)
VALUES (2, 'ABC Corporation', 'ORG12345'),
    (6, 'XYZ Enterprises', 'ORG67890');
-- Populate individual table
INSERT INTO individual (customer_id, full_name, date_of_birth, NIC)
VALUES (1, 'John Doe', '1985-03-20', '850320-1234'),
    (5, 'Alice Brown', '1987-05-10', '870510-5678'),
    (7, 'Bob Martin', '1992-08-25', '920825-9876'),
    (8, 'Charlie Black', '1995-12-30', '951230-6543');
-- Populate branch table
INSERT INTO branch (name, location)
VALUES ('Main Branch', 'Downtown'),
    ('North Branch', 'Uptown'),
    ('East Branch', 'Suburb'),
    ('West Branch', 'Industrial Park');
-- Populate manager table
INSERT INTO manager (staff_id)
VALUES (1),
    (9);
-- Update branch with manager
UPDATE branch
SET manager_id = 1
WHERE branch_id = 1;
UPDATE branch
SET manager_id = 9
WHERE branch_id = 2;
-- Populate employee table
INSERT INTO employee (staff_id, branch_id)
VALUES (2, 1),
    (10, 2);
-- Populate account table
INSERT INTO account (
        account_type,
        account_number,
        customer_id,
        branch_id,
        balance,
        status
    )
VALUES ('savings', 'SAV001', 1, 1, 5000.00, 'active'),
    ('checking', 'CHK001', 2, 1, 10000.00, 'active'),
    ('savings', 'SAV002', 5, 2, 2000.00, 'active'),
    ('checking', 'CHK002', 6, 2, 3000.00, 'active'),
    ('savings', 'SAV003', 7, 3, 1500.00, 'active'),
    ('checking', 'CHK003', 8, 3, 2500.00, 'active');
-- Populate savings_plan table
INSERT INTO savings_plan (type, Interest_rate, minimum_balance, age_limit)
VALUES ('adult', 2.5, 1000.00, 18),
    ('child', 3.0, 500.00, 12),
    ('senior', 2.0, 800.00, 60);
-- Populate fd_plan table
INSERT INTO fd_plan (duration, Interest_rate)
VALUES (12, 5.5),
    (24, 6.0),
    (36, 6.5);
-- Populate savings_account table
INSERT INTO savings_account (account_id, savings_plan_id)
VALUES (1, 1),
    (3, 1),
    (5, 2);
-- Populate fixed_deposit table
INSERT INTO fixed_deposit (
        savings_account_id,
        amount,
        fd_plan_id,
        start_date,
        end_date
    )
VALUES (1, 10000.00, 1, '2023-01-01', '2024-01-01'),
    (3, 15000.00, 2, '2023-02-01', '2025-02-01');
-- Populate transaction table
INSERT INTO transaction (
        account_id,
        transaction_type,
        amount,
        date,
        description
    )
VALUES (
        1,
        'deposit',
        1000.00,
        '2023-06-01 10:00:00',
        'Initial deposit'
    ),
    (
        2,
        'withdrawal',
        500.00,
        '2023-06-02 14:30:00',
        'ATM withdrawal'
    ),
    (
        3,
        'deposit',
        2000.00,
        '2023-06-03 11:00:00',
        'Salary credit'
    ),
    (
        4,
        'withdrawal',
        300.00,
        '2023-06-04 15:00:00',
        'Bill payment'
    );
-- Populate penalty_types table
INSERT INTO penalty_types (penalty_amount, penalty_type)
VALUES (50.00, 'Late payment'),
    (25.00, 'Insufficient funds'),
    (75.00, 'Overdraft fee');
-- Populate customer_log table
INSERT INTO customer_log (
        customer_id,
        mobile_number,
        landline_number,
        address,
        updated_date
    )
VALUES (
        1,
        '1234567890',
        '0123456789',
        '123 Main St, City',
        '2023-01-01'
    ),
    (
        5,
        '2234567890',
        '0223456789',
        '789 Elm St, City',
        '2023-03-15'
    ),
    (
        7,
        '4234567890',
        '0423456789',
        '654 Maple St, City',
        '2023-05-20'
    );
-- Populate loan table
INSERT INTO loan (
        account_id,
        loan_type,
        amount,
        interest_rate,
        start_date,
        end_date,
        status
    )
VALUES (
        1,
        'personal',
        5000.00,
        8.5,
        '2023-01-01',
        '2024-01-01',
        'approved'
    ),
    (
        3,
        'home',
        150000.00,
        7.0,
        '2023-02-01',
        '2025-02-01',
        'approved'
    );
-- Populate penalty table
INSERT INTO penalty (penalty_type_id)
VALUES (1),
    (2),
    (3);
-- Populate deposit table
INSERT INTO deposit (transaction_id, branch_id)
VALUES (1, 1),
    (3, 2);
-- Populate loan_installment table
INSERT INTO loan_installment (loan_id, amount, duration)
VALUES (1, 500.00, 12),
    (2, 1000.00, 24);
-- Populate withdrawal table
INSERT INTO withdrawal (transaction_id, branch_id)
VALUES (2, 1),
    (4, 2);
-- Populate checking_account table
INSERT INTO checking_account (account_id)
VALUES (2),
    (4),
    (6);
-- Populate transfer table
INSERT INTO transfer (transaction_id, beneficiary_account_id)
VALUES (1, 2),
    (3, 4);
-- Populate loan_payment table
INSERT INTO loan_payment (
        instalment_id,
        amount,
        due_date,
        payed_date,
        status,
        penalty_id
    )
VALUES (
        1,
        500.00,
        '2023-02-01',
        '2023-02-01',
        'paid',
        NULL
    ),
    (
        2,
        1000.00,
        '2023-03-01',
        '2023-03-01',
        'paid',
        2
    );