


CREATE TABLE dept (
   deptno NUMBER(2) NOT NULL
 , dname  VARCHAR2(14)
 , loc    VARCHAR2(13)
 , CONSTRAINT pk_dept PRIMARY KEY (deptno)
);

CREATE TABLE emp (
   empno    NUMBER(4) NOT NULL
 , ename    VARCHAR2(10) 
 , job      VARCHAR2(9)
 , hiredate DATE
 , sal      NUMBER(7,2)
 , deptno   NUMBER(2)
 , grade    NUMBER
 , CONSTRAINT pk_emp PRIMARY KEY (empno)
 , CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
);

CREATE TABLE salgrade (
   grade  NUMBER
 , lowsal NUMBER
 , hisal  NUMBER
);

CREATE TABLE personeval (
   ename VARCHAR2(10)
 , eval VARCHAR2(1)
);

CREATE TABLE tmp (
   empno    NUMBER(4) NOT NULL
 , ename    VARCHAR2(10) 
 , job      VARCHAR2(9)
 , hiredate DATE
 , sal      NUMBER(7,2)
 , deptno   NUMBER(2)
 , grade    NUMBER
);
