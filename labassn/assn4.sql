CREATE TABLE emp(
  empno INT NOT NULL UNIQUE PRIMARY KEY,
  ename VARCHAR(25) UNIQUE, 
  job VARCHAR(10) NOT NULL CHECK(job = 'Prof' OR job = 'AP' OR job = 'Lect'), 
  sal FLOAT NOT NULL, 
  deptno INT NOT NULL DEFAULT 10
);

INSERT INTO emp(empno, ename, job, sal)
VALUES(12, "AKshat", "Prof", 123.45);

--- Fail job
INSERT INTO emp(empno, ename, job, sal)
VALUES(12, "AKshat", "Proff", 123.45);

--- SALARY NULL
INSERT INTO emp(empno, ename, job, sal)
VALUES(1, "AKshat", "Prof", NULL);

--- NAME & duplicate primary key
INSERT INTO emp(empno, ename, job, sal)
VALUES(12, "AKshat", "Prof", 123.45);

--- 
INSERT INTO emp(empno, ename, job, sal, deptno)
VALUES(123, "Atharv", "AP", 123.45, 9);

SELECT *
FROM emp;

---SELECT *
---FROM USER_CONSTRAINTS;

---SELECT *
---FROM USER_COLUMN_CONSTRAINTS;

--- Book table
CREATE TABLE book(
  Rno_number INT NOT NULL UNIQUE PRIMARY KEY,
  doi DATE,
  dor DATE,
  CHECK(dor>doi)
);

INSERT INTO book(Rno_number, doi, dor)
VALUES(102103586, DATE'2023-09-23', DATE'2023-09-30');

INSERT INTO book(Rno_number, doi, dor)
VALUES(102103145, DATE'2023-09-24', DATE'2023-09-21');

SELECT *
FROM book;

CREATE TABLE st(
  Rno_number INT,
  class varchar(25),
  marks FLOAT,
  PRIMARY KEY(Rno_number, class),
  CHECK(marks > 0)
);

INSERT INTO st(Rno_number, class, marks)
VALUES (102103576, "tet", 12.3);

INSERT INTO st(Rno_number, class, marks)
VALUES (102101576, "ttt", 14.3);

INSERT INTO st(Rno_number, class, marks)
VALUES (102100981, "789", -10);

SELECT * 
FROM st;

CREATE TABLE S(
  sno INT PRIMARY KEY,
  sname VARCHAR(25),
  city VARCHAR(25),
  CHECK(sno > 0)
);

INSERT INTO S(sno, sname, city)
VALUES(1, "Salesperson#1", "Delhi");

INSERT INTO S(sno, sname, city)
VALUES(2, "Salespersion#2", "Mumbai");

SELECT *
FROM S;

CREATE TABLE P(
  pno INT PRIMARY KEY,
  pname VARCHAR(25),
  color VARCHAR(25),
  CHECK(pno > 0)
);

INSERT INTO P(pno, pname, color)
VALUES(3, "HELLO", "RED");

SELECT *
FROM P;

CREATE TABLE dept(
  deptno INT NOT NULL PRIMARY KEY,
  dname ENUM('Acc', 'comp', 'elect') NOT NULL 
);

INSERT INTO dept(deptno, dname)
VALUES(1, 'ACC');

INSERT INTO dept(deptno, dname)
VALUES(3, 'elect');

SELECT *
FROM dept;

CREATE TABLE emp(
  empno INT NOT NULL PRIMARY KEY,
  ename VARCHAR(25) UNIQUE,
  job ENUM('Prof', 'AP', 'LECT'),
  sal FLOAT NOT NULL,
  deptno INT NOT NULL,
  FOREIGN KEY(deptno) REFERENCES dept(deptno),
  CHECK(deptno > 0)
);

INSERT INTO emp(empno, ename, job, deptno)
VALUES(12, 'AKshat', 'Prof', 1);

DROP TABLE emp;
DROP TABLE dept;
DROP TABLE SP;
DROP TABLE P;
DROP TABLE S;
DROP TABLE st;
DROP TABLE book;
DROP TABLE emp;
