CREATE OR REPLACE TRIGGER trg_salgrade
 AFTER UPDATE ON emp
 FOR EACH ROW
BEGIN
 FOR f_salgrade IN (SELECT * FROM salgrade) LOOP
  IF :NEW.sal > f_salgrade.lowsal AND :NEW.sal < f_salgrade.hisal AND :OLD.grade != f_salgrade.grade THEN 
   UPDATE emp e SET e.grade = f_salgrade.grade WHERE e.ename = :NEW.ename;
  END IF;
 END LOOP;
END;
