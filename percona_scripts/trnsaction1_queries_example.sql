use test;

BEGIN;
SELECT age FROM users WHERE id = 1;
SELECT age FROM users WHERE id = 1;
COMMIT;


BEGIN;
SELECT * FROM users WHERE age > 17;
SELECT * FROM users WHERE age > 17;
COMMIT;

BEGIN;
SELECT * FROM users WHERE age > 27 AND age < 33;
SELECT * FROM users WHERE age > 27 AND age < 33;
COMMIT;


BEGIN;
SELECT * FROM users WHERE age > 27 AND age < 33 FOR UPDATE;
UPDATE users SET name=CONCAT(name, 'Updated') WHERE age > 27 AND age < 33;
COMMIT;

-- Phantom read
BEGIN;
SELECT * FROM users WHERE name = 'Kate';
UPDATE users SET age = 24 where name = 'Kate';
SELECT * FROM users WHERE name = 'Kate';
COMMIT;

