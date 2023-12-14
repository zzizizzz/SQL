-- ���̺� �����ϱ�
drop table sample_books;
drop table sample_customers;
drop table sample_products;

-- ������ �����ϱ�
drop sequence books_seq;
drop sequence sustomers_seq;

/*
������û �ý��ۿ� ���̺�
*/

--�а� ���̺�
CREATE TABLE DEPTS (
    DEPT_NO NUMBER(3),
    DEPT_NAME VARCHAR2(255) NOT NULL,
    
    CONSTRAINT DEPT_NO_PK PRIMARY KEY(DEPT_NO)
);

-- ���� ���̺�
CREATE TABLE PROFESSORS(
    PROF_NO NUMBER(3),
    PROF_NAME VARCHAR2(100) NOT NULL,
    PROF_POSITION VARCHAR2(100) NOT NULL,
    DEPT_NO NUMBER(3) NOT NULL,
    
    CONSTRAINT PROF_NO_PK PRIMARY KEY(PROF_NO),
    CONSTRAINT PROF_DEPTNO_FK FOREIGN KEY (DEPT_NO)
                              REFERENCES DEPTS (DEPT_NO)
);

-- �л� ���̺� 
CREATE TABLE STUDENTS (
    STUD_NO NUMBER(3),
    STUD_NAME VARCHAR2(100) NOT NULL,
    STUD_GRADE NUMBER(1),
    DEPT_NO NUMBER(3) NOT NULL,
    PROF_NO NUMBER(3),
    
    CONSTRAINT STUD_NO_PK PRIMARY KEY(STUD_NO),
    CONSTRAINT STUD_GRADE_PK CHECK (STUD_GRADE IN(1,2,3,4)),
    CONSTRAINT STUD_DEPTNO_FK FOREIGN KEY(DEPT_NO)
                              REFERENCES DEPTS(DEPT_NO),
    CONSTRAINT STUD_PROFNO_FK FOREIGN KEY(PROF_NO)
                              REFERENCES PROFESSORS(PROF_NO)
);

-- �������� ���̺�
CREATE TABLE COURSES(
    COURSE_NO NUMBER(3),
    COURSE_NAME VARCHAR(255) NOT NULL,
    DEPT_NO NUMBER(3),
    PROF_NO NUMBER(3),
    
    CONSTRAINT COUR_NO_PK PRIMARY KEY (COURSE_NO),
    CONSTRAINT COUR_DEPTNO_FK FOREIGN KEY(DEPT_NO)
                              REFERENCES DEPTS(DEPT_NO),
    CONSTRAINT COUR_PROFNO_FK FOREIGN KEY (PROF_NO)
                              REFERENCES PROFESSORS (PROF_NO)
);

-- ������û ���̺�
CREATE TABLE REQUESTS (
    STUD_NO NUMBER(3),
    COURSE_NO NUMBER(3),
    REG_DATE DATE DEFAULT SYSDATE,
    
    CONSTRAINT REQ_STUDNO_COURSENO_PK PRIMARY KEY(STUD_NO, COURSE_NO),
    CONSTRAINT REQ_STUDNO_FK FOREIGN KEY (STUD_NO)
                             REFERENCES STUDENTS(STUD_NO),
    CONSTRAINT REQ_COURSENO_FK FOREIGN KEY (COURSE_NO)
                               REFERENCES COURSES(COURSE_NO)
);

INSERT INTO DEPTS (DEPT_NO, DEPT_NAME)
VALUES (101,'��ǻ�� ���а�');
INSERT INTO DEPTS (DEPT_NO, DEPT_NAME)
VALUES (102,'���ڰ��а�');
INSERT INTO DEPTS (DEPT_NO, DEPT_NAME)
VALUES (103,'�����а�');

INSERT INTO PROFESSORS(PROF_NO, PROF_NAME, PROF_POSITION, DEPT_NO)
VALUES(201, '�豳��', '������', 101);
INSERT INTO PROFESSORS(PROF_NO, PROF_NAME, PROF_POSITION, DEPT_NO)
VALUES(202, '�̱���', '������', 101);
INSERT INTO PROFESSORS(PROF_NO, PROF_NAME, PROF_POSITION, DEPT_NO)
VALUES(203, '�ڱ���', '������', 102);
INSERT INTO PROFESSORS(PROF_NO, PROF_NAME, PROF_POSITION, DEPT_NO)
VALUES(204, '������', '������', 100); --�θ�Ű�� ��� ������� ����

DELETE FROM DEPTS
WHERE DEPT_NO = 101; -- �����ϴ� �ڽķ��ڵ尡 �����ϱ� ������ ���� ��������

INSERT INTO STUDENTS
(STUD_NO, STUD_NAME, STUD_GRADE, DEPT_NO, PROF_NO)
VALUES
(301, 'ȫ�浿', 1,101, 201);
INSERT INTO STUDENTS
(STUD_NO, STUD_NAME, STUD_GRADE, DEPT_NO, PROF_NO)
VALUES
(302, '������', 1,101, 201);
INSERT INTO STUDENTS
(STUD_NO, STUD_NAME, STUD_GRADE, DEPT_NO, PROF_NO)
VALUES
(303, '�̼���', 1,102, 203);
INSERT INTO STUDENTS
(STUD_NO, STUD_NAME, STUD_GRADE, DEPT_NO, PROF_NO)
VALUES
(304, '������', 1,102, 203);

-- ��� �л� ������ ��ȸ�ϱ�
-- �й�, �̸�, �г�, �Ҽ��а���, ��米����
SELECT S.STUD_NO, S.STUD_NAME, S.STUD_GRADE, D.DEPT_NAME, P.PROF_NAME
FROM STUDENTS S, DEPTS D, PROFESSORS P
WHERE S.DEPT_NO = D.DEPT_NO
AND S.PROF_NO = P.PROF_NO;

INSERT INTO  COURSES
(COURSE_NO, COURSE_NAME, DEPT_NO, PROF_NO)
VALUES
(401,'�ü�� ����',101,201);
INSERT INTO  COURSES
(COURSE_NO, COURSE_NAME, DEPT_NO, PROF_NO)
VALUES
(402,'�����ͺ��̽�',101,201);
INSERT INTO  COURSES
(COURSE_NO, COURSE_NAME, DEPT_NO, PROF_NO)
VALUES
(403,'���α׷��� ����',101,201);

-- �������� ��ȸ�ϱ�
-- ������ȣ, ������, �����а�, ��米���̸� ��ȸ�ϱ�
-- C         C       D      P
SELECT C.COURSE_NO, C.COURSE_NAME, D.DEPT_NAME, P.PROF_NAME
FROM COURSES C , DEPTS D, PROFESSORS P
WHERE  C.DEPT_NO = D.DEPT_NO
AND C.PROF_NO = P.PROF_NO;

INSERT INTO REQUESTS
(STUD_NO, COURSE_NO) VALUES(301, 401);
INSERT INTO REQUESTS
(STUD_NO, COURSE_NO) VALUES(301, 402);
INSERT INTO REQUESTS
(STUD_NO, COURSE_NO) VALUES(302, 401);
INSERT INTO REQUESTS
(STUD_NO, COURSE_NO) VALUES(302, 402);
INSERT INTO REQUESTS
(STUD_NO, COURSE_NO) VALUES(302, 403);

-- ȫ�浿 �л��� ������û�� ���� ��ȸ�ϱ�
-- ���� ��ȣ, ������, �����а���, ��米����, ��û�� ��ȸ
-- R                          P       R
-- C          C
--                   D   
--               
��û����                 ��������                              �а�����               ��������
[�а�, *������ȣ, ��û��] - [*������ȣ, ������, +�а���ȣ, &������ȣ]-[+�а���ȣ, �а���] - [&������ȣ, ������]
SELECT C.COURSE_NO, C.COURSE_NAME, D.DEPT_NAME, P.PROF_NAME, R.REG_DATE
FROM REQUESTS R, COURSES C, PROFESSORS P , DEPTS D
WHERE C.COURSE_NO = R.COURSE_NO -- [�а�, *������ȣ, ��û��] - [*������ȣ, ������, +�а���ȣ, &������ȣ]
AND C.DEPT_NO = D.DEPT_NO -- [*������ȣ, ������, +�а���ȣ, &������ȣ]-[+�а���ȣ, �а���]
AND C.PROF_NO = P.PROF_NO -- [*������ȣ, ������, +�а���ȣ, &������ȣ]- [&������ȣ, ������]
AND R.STUD_NO IN (SELECT STUD_NO
                  FROM STUDENTS
                  WHERE STUD_NAME = '������'); 
            
/*
���̺� ���� ����
    �θ����̺� --> �ڽ����̺�

���̺� ���� ����
    �ڽ����̺� --> �θ����̺�
    
    REQUESTS -> COURSES
             -> STUDENTS -> PROFESSORS -> DEPTS
*/
-- ���̺� �����ϱ�
DROP TABLE DEPTS;      -- PROFESSORS, STUDENTS, COURSES���� �����ϰ� �ִ�. (����X)
DROP TABLE PROFESSORS; -- STUDENTS, COURSES���� �����ϰ� �ִ�.(����X)
DROP TABLE STUDENTS;   -- REQUESTS���� �����ϰ��ִ�.(����X)
DROP TABLE COURSES;    -- REQUESTS���� �����ϰ� �ִ�.(����X)
DROP TABLE REQUESTS;   -- �����ϴ� ���̺����(����O)

-- CASCADE CONSTRAINTS�� �� ���̺��� �����ϴ� �ڽ����̺��� �ܷ�Ű ����������
-- ������ ����, �� ���̺��� �����Ѵ�.
DROP TABLE DEPTS CASCADE CONSTRAINTS; -- �������ǹ����ϰ� ���̺��� �����Ѵ�.
DROP TABLE PROFESSORS CASCADE CONSTRAINTS;
DROP TABLE STUDENTS CASCADE CONSTRAINTS;
DROP TABLE COURSES CASCADE CONSTRAINTS;
DROP TABLE REQUESTS CASCADE CONSTRAINTS;

/*
���� ������ �߰�/����

* �ܷ�Ű �������� �߰��ϱ�
ALTER TABLE ���̺��
ADD CONSTRAINT �������� ��Ī FOREIGN KEY(�÷���)
                           REFERENCES �θ����̺��(�÷���);
                           
* �������� �����ϱ�
ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǻ�Ī;

* �������� ��Ȱ��ȭ�ϱ�
ALTER TABLE ���̺�� DISABLE CONSTRAINT �������Ǻ�Ī;

* �������� Ȱ��ȭ�ϱ�
ALTER TABLE ���̺�� ENABLE CONSTRAINT �������Ǻ�Ī;

���̺��� ���鶧 ��Ȱ��Ȱ�� ���������� �ְ� �������� ��������Ȱ��ȭ�� �ϸ�ȴ�.
*/
DROP TABLE 











