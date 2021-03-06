-- just to have one statement before the actual test statement
CREATE VIEW all_misters AS SELECT * FROM test_user WHERE name LIKE 'Mr.%';

-- a statement with line break and interspersed comment between CREATE and PROCEDURE
CREATE
-- my special
PROCEDURE nested_block(OUT val INT) LANGUAGE SQLSCRIPT
READS SQL DATA AS
BEGIN
	DECLARE a INT = 1;
END;

-- just to have a trailing statement for testing
DROP VIEW all_misters;