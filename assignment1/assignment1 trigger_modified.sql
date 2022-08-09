CREATE OR REPLACE TRIGGER trg_salgrade_before
 BEFORE UPDATE ON emp
 FOR EACH ROW
DECLARE
 v_emp emp%ROWTYPE;
BEGIN
 DELETE FROM tmp;
 FOR f_salgrade IN (SELECT * FROM salgrade) LOOP
  IF :NEW.sal > f_salgrade.lowsal AND :NEW.sal < f_salgrade.hisal AND :OLD.grade != f_salgrade.grade THEN 
   v_emp.empno    := :NEW.empno;
   v_emp.ename    := :NEW.ename;
   v_emp.job      := :NEW.job;
   v_emp.hiredate := :NEW.hiredate;
   v_emp.sal      := :NEW.sal;
   v_emp.deptno   := :NEW.deptno;
   v_emp.grade    := f_salgrade.grade;
   INSERT INTO tmp VALUES v_emp;
  END IF;
 END LOOP;
END;



CREATE OR REPLACE TRIGGER trg_salgrade_after
 AFTER UPDATE ON emp
BEGIN
 FOR f_tmp IN (SELECT * FROM tmp) LOOP
  UPDATE emp SET emp.grade = f_tmp.grade WHERE emp.empno = f_tmp.empno;
 END LOOP;
END;
