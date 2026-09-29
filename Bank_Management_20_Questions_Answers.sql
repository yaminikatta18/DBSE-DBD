-- BANK MANAGEMENT SYSTEM
-- Aggregate Functions with WHERE, GROUP BY, HAVING, ORDER BY

CREATE TABLE IF NOT EXISTS bank_transactions (
    txn_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    branch_name VARCHAR(50),
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE
);

INSERT INTO bank_transactions VALUES
(101,'Ravi','Hyderabad','Deposit',5000,'2024-01-05'),
(102,'Sita','Hyderabad','Withdrawal',2000,'2024-01-06'),
(103,'Kiran','Vijayawada','Deposit',12000,'2024-01-08'),
(104,'Anil','Vizag','Deposit',8000,'2024-01-10'),
(105,'Priya','Hyderabad','Withdrawal',3500,'2024-01-11'),
(106,'Ramesh','Vizag','Deposit',15000,'2024-01-12'),
(107,'Keerthi','Vijayawada','Withdrawal',1000,'2024-01-13'),
(108,'Rahul','Hyderabad','Deposit',9000,'2024-01-14'),
(109,'Sneha','Vizag','Withdrawal',4000,'2024-01-15'),
(110,'Madhu','Vijayawada','Deposit',11000,'2024-01-16');


-- 1. Q01_SUM.sql
SELECT SUM(amount) AS Total_Amount FROM bank_transactions;
-- Expected Output: 70500.00

-- 2. Q02_AVG.sql
SELECT AVG(amount) AS Average_Transaction FROM bank_transactions;
-- Expected Output: 7050.00

-- 3. Q03_MAX.sql
SELECT MAX(amount) AS Highest_Transaction FROM bank_transactions;
-- Expected Output: 15000.00

-- 4. Q04_MIN.sql
SELECT MIN(amount) AS Lowest_Transaction FROM bank_transactions;
-- Expected Output: 1000.00

-- 5. Q05_COUNT.sql
SELECT COUNT(*) AS Total_Transactions FROM bank_transactions;
-- Expected Output: 10

-- 6. Q06_WHERE_SUM.sql
SELECT SUM(amount) AS Total_Deposit FROM bank_transactions WHERE transaction_type='Deposit';
-- Expected Output: 60000.00

-- 7. Q07_GROUP_BY.sql
SELECT branch_name, SUM(amount) AS Total_Amount
FROM bank_transactions
GROUP BY branch_name;
-- Expected Output: Hyderabad 19500.00; Vijayawada 24000.00; Vizag 27000.00

-- 8. Q08_GROUP_BY_HAVING.sql
SELECT branch_name, SUM(amount) AS Total_Amount
FROM bank_transactions
GROUP BY branch_name
HAVING SUM(amount) > 20000;
-- Expected Output: Vijayawada 24000.00; Vizag 27000.00

-- 9. Q09_GROUP_BY_ORDER_BY.sql
SELECT branch_name, SUM(amount) AS Total_Amount
FROM bank_transactions
GROUP BY branch_name
ORDER BY Total_Amount DESC;
-- Expected Output: Vizag 27000.00; Vijayawada 24000.00; Hyderabad 19500.00

-- 10. Q10_GROUP_BY_HAVING_ORDER_BY.sql
SELECT branch_name, COUNT(*) AS Total_Transactions
FROM bank_transactions
GROUP BY branch_name
HAVING COUNT(*) >= 3
ORDER BY Total_Transactions DESC;
-- Expected Output: Hyderabad 4; Vijayawada 3; Vizag 3

-- 11. Q11_WHERE_COUNT.sql
SELECT COUNT(*) AS Withdrawals FROM bank_transactions WHERE transaction_type='Withdrawal';
-- Expected Output: 4

-- 12. Q12_WHERE_AVG.sql
SELECT AVG(amount) AS Avg_Deposit FROM bank_transactions WHERE transaction_type='Deposit';
-- Expected Output: 10000.00

-- 13. Q13_GROUP_BY_MAX.sql
SELECT branch_name, MAX(amount) AS Highest_Amount
FROM bank_transactions
GROUP BY branch_name;
-- Expected Output: Hyderabad 9000; Vijayawada 12000; Vizag 15000

-- 14. Q14_GROUP_BY_MIN.sql
SELECT branch_name, MIN(amount) AS Lowest_Amount
FROM bank_transactions
GROUP BY branch_name;
-- Expected Output: Hyderabad 2000; Vijayawada 1000; Vizag 4000

-- 15. Q15_WHERE_ORDER_BY.sql
SELECT *
FROM bank_transactions
WHERE amount > 8000
ORDER BY amount DESC;
-- Expected Output: Ramesh 15000; Kiran 12000; Madhu 11000; Rahul 9000

-- 16. Q16_GROUP_BY_COUNT.sql
SELECT branch_name, COUNT(*) AS Customer_Count
FROM bank_transactions
GROUP BY branch_name;
-- Expected Output: Hyderabad 4; Vijayawada 3; Vizag 3

-- 17. Q17_HAVING_COUNT.sql
SELECT branch_name, COUNT(*) AS Total_Transactions
FROM bank_transactions
GROUP BY branch_name
HAVING COUNT(*) > 3;
-- Expected Output: Hyderabad 4

-- 18. Q18_GROUP_BY_AVG.sql
SELECT branch_name, AVG(amount) AS Avg_Amount
FROM bank_transactions
GROUP BY branch_name;
-- Expected Output: Hyderabad 4875.00; Vijayawada 8000.00; Vizag 9000.00

-- 19. Q19_WHERE_GROUP_BY_HAVING.sql
SELECT branch_name, SUM(amount) AS Total_Deposit
FROM bank_transactions
WHERE transaction_type='Deposit'
GROUP BY branch_name
HAVING SUM(amount) > 15000;
-- Expected Output: Vijayawada 23000; Vizag 23000

-- 20. Q20_GROUP_BY_HAVING_ORDER_BY.sql
SELECT branch_name, AVG(amount) AS Avg_Amount
FROM bank_transactions
GROUP BY branch_name
HAVING AVG(amount) > 7000
ORDER BY Avg_Amount DESC;
-- Expected Output: Vizag 9000.00; Vijayawada 8000.00