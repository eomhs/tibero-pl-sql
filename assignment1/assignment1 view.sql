

CREATE VIEW v1 AS
SELECT ename, sal FROM emp; 

CREATE VIEW v2 AS
SELECT ename, grade FROM emp;

CREATE VIEW v3 AS
SELECT ename, dept.deptno,dname,loc, sal, grade FROM emp LEFT JOIN dept on emp.deptno = dept.deptno;

CREATE TABLE mv1(
   ename VARCHAR2(10)
 , sal   NUMBER(7,2)
);

CREATE TABLE mv2(
   ename VARCHAR2(10)
 , grade NUMBER
);

CREATE TABLE mv3(
   ename  VARCHAR2(10)
 , deptno NUMBER(2)
 , dname  VARCHAR2(14)
 , loc    VARCHAR2(13)
 , sal    NUMBER(7,2)
 , grade  NUMBER
);
