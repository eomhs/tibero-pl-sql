
CREATE OR REPLACE PROCEDURE synchronize
IS
BEGIN 
 DELETE FROM mv1;
 DELETE FROM mv2;
 DELETE FROM mv3;
 INSERT INTO mv1 SELECT * FROM v1;
 INSERT INTO mv2 SELECT * FROM v2;
 INSERT INTO mv3 SELECT * FROM v3;
END;




DECLARE
 v_job NUMBER;
BEGIN
 DBMS_JOB.SUBMIT (
    job       => v_job
  , what      => 'synchronize;'
  , next_date => SYSDATE
  , interval  => q'[SYSDATE + INTERVAL '1' DAY]'
 );
 
 COMMIT;

 DBMS_OUTPUT.PUT_LINE(v_job);
END;

