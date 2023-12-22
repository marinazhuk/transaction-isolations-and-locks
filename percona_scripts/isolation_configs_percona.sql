SET GLOBAL transaction_isolation = 'READ-UNCOMMITTED';

show variables like '%isolation%';

SET autocommit=0;

SET GLOBAL innodb_status_output=ON;

SET GLOBAL innodb_status_output_locks=ON;