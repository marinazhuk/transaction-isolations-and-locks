# Transaction Isolation & locks
Demo project to learn Isolations & locks in databases trying to reproduce Read phenomenas:
  * lost update 
  * dirty read 
  * non-repeatable read 
  * phantom read


### Phantom read

```sql
Tx1:
BEGIN;
SELECT * FROM users WHERE name = 'Kate'; -- empty set

Tx2:
BEGIN;
INSERT INTO users(name, age) VALUES ('Kate', 23);
COMMIT;

Tx1:
UPDATE users SET age = 24 where name = 'Kate'; --  1 row affected.
SELECT * FROM users WHERE name = 'Kate';  -- 1 row. phantom read here
COMMIT;
```

## PostgreSQL
isolation levels | Dirty reads | Non-repeatable reads | Phantom reads | Lost updates
---|-------------|----------------------|---------------| ---
READ COMMITTED | -           | +                    | +             | +
REPEATABLE READ | -           | -                    | -             | -
SERIALIZABLE | -           | -                    | -             | -

[postgre_scripts](postgre_scripts) scripts were used for testing

## Percona

isolation levels | Dirty reads | Non-repeatable reads | Phantom reads | Lost updates
---|-------------|----------------------|---------------| ---
READ UNCOMMITTED | +           | +                    | +             | +
READ COMMITTED | -           | +                    | +             | +
REPEATABLE READ | -           | -                    | +             | -
SERIALIZABLE | -           | -                    | -             | -

[percona_scripts](percona_scripts) scripts were used for testing