use test;

BEGIN;
UPDATE users SET age = 24 WHERE id = 1;
COMMIT;
-- ROLLBACK;

BEGIN;
SELECT * FROM users WHERE age > 17;
COMMIT;

BEGIN;
INSERT INTO users(name, age) VALUES ('Mike', 29);
COMMIT;

BEGIN;
INSERT INTO users(name, age) VALUES ('Marina', 32);
COMMIT;

BEGIN;
SELECT * FROM users WHERE age > 27 AND age < 33 FOR UPDATE;
COMMIT;

-- Phantom read
BEGIN;
INSERT INTO users(name, age) VALUES ('Kate', 23);
COMMIT;
