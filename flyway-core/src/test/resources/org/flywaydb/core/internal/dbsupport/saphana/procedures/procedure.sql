-- just to have one statement before the actual test statement
CREATE VIEW all_misters AS SELECT * FROM test_user WHERE name LIKE 'Mr.%';

-- create statement with embedded ';'
-- it is expected that this statement is read as a single statement ending after 'END;'
-- and not broken into separate statements ending after each ';' withing the BEGIN...END-block.
-- this example statement is borrowed from the HANA reference for
-- CREATE PROCEDURE (http://help-legacy.sap.com/saphelp_hanaplatform/helpdata/en/20/d467407519101484f190f545d54b24/content.htm)
CREATE PROCEDURE orchestrationProc
 LANGUAGE SQLSCRIPT AS
 BEGIN
   DECLARE v_id BIGINT;
   DECLARE v_name VARCHAR(30);
   DECLARE  v_pmnt BIGINT;
   DECLARE v_msg VARCHAR(200);
   DECLARE CURSOR c_cursor1 (p_payment BIGINT) FOR
     SELECT id, name, payment FROM control_tab
       WHERE payment > :p_payment ORDER BY id ASC;
   CALL init_proc();
   OPEN c_cursor1(250000);
   FETCH c_cursor1 INTO v_id, v_name, v_pmnt; v_msg := :v_name || ' (id ' || :v_id || ') earns ' || :v_pmnt || ' $.';
   CALL ins_msg_proc(:v_msg);
   CLOSE c_cursor1;
 END;

-- just to have a trailing statement for testing
DROP VIEW all_misters;