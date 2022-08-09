

CREATE OR REPLACE PROCEDURE up
IS
 rate NUMBER;
BEGIN
 FOR f_personeval IN (SELECT * FROM personeval) LOOP
  CASE f_personeval.eval
   WHEN 'A' THEN
    rate := 1.3;
   WHEN 'B' THEN
    rate := 1.2;
   WHEN 'C' THEN
    rate := 1.1;
  END CASE;
 UPDATE emp e SET e.sal = e.sal * rate WHERE e.ename = f_personeval.ename;
 END LOOP;
END;
/

DECLARE
 v_job NUMBER;
BEGIN
 DBMS_JOB.SUBMIT (
   job       => v_job
 , what      => 'up;'
 , next_date => SYSDATE 
 , interval  => q'[SYSDATE + INTERVAL '1' DAY]' 
 );
 
 COMMIT;

 DBMS_OUTPUT.PUT_LINE (v_job);
END;
