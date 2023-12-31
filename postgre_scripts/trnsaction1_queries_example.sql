show transaction_isolation;

-- SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL SERIALIZABLE;

BEGIN;
SELECT age FROM users WHERE id = 1;
SELECT age FROM users WHERE id = 1;
COMMIT;

BEGIN;
SELECT * FROM users WHERE age > 17;
SELECT * FROM users WHERE age > 17;
COMMIT;


BEGIN;
SELECT * FROM users WHERE age > 17  FOR UPDATE;
COMMIT;

-- Phantom read
BEGIN;
SELECT * FROM users WHERE name = 'Kate';
UPDATE users SET age = 24 where name = 'Kate';
SELECT * FROM users WHERE name = 'Kate';
COMMIT;