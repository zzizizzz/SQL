/*
���̺� �����ϱ�
    SELECT *
    FROM ���̺�1, ���̺�2;
    * ���̺��� ������ ���� ����̵Ǵ� ���̺��� �̸��� FORM���� �����ϱ⸸ �ϸ�ȴ�.
    * ������ ������ ������ ���̺�1�� ������ ���̺�2�� ��� ���� ����� ������ ���̺��� �����ȴ�.
    * (���̺�1�� ���� ����* ���̺�2�� ���� ����) ��ŭ�� ���� ��ȸ�ȴ�.
        SELECT *
        FROM ���̺�1, ���̺�2;

�������� �����ϱ�
    SELECT *
    FROM ���̺�1, ���̺�2
    WHERE ���̺�1.�÷��� = ���̺�2.�÷���
    * ���ε� ���̺��� ��� �࿡�� ���������� �����ϴ� ���� �ǹ��ְ� ����� ���̴�.
    * ���������� �����ϸ� �ǹ��ְ� ����� �ุ ��ȸ�� �� �ִ�.
    * ���������� ���� = ���ε� ���̺��� ���� -1
*/

-- REGIONS ���̺�� COUNTRIES ���̺������ϱ�
-- REGIONS ���̺��� ��� �� COUNTERIES ���̺��� ��� ���� ���εȴ�.
SELECT *
FROM REIONS, COUNTRIES;
    
-- REGIONS ���̺�� COUNTRIES ���̺������ϰ�, ���� �����ִ� �ุ ���͸��ϱ�
SELECT  COUNTRIES.COUNTRY_ID, 
        COUNTRIES.COUNTRY_NAME, 
        REGIONS.REGION_NAME
FROM REGIONS, COUNTRIES
WHERE REGIONS.REGION_ID = COUNTRIES.REGION_ID;

-- �������̵�, �����̸�, �������̵�, ��������, �����ּұ޿�, �����ִ�޿�, �޿� ��ȸ�ϱ�
-- E           E        E                                           E
--                      J          J         J              J

SELECT  E.EMPLOYEE_ID,
        E.FIRST_NAME,
        E.JOB_ID,
        J.JOB_TITLE,
        J.MIN_SALARY,
        J.MAX_SALARY,
        E.SALARY
FROM  EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID;


/*
����� 
    �������ǿ��� EQUAL(=) �����ڸ� ����Ѵ�.
    ���ο� �����ϴ� ���̺��� �������� ������ �ִ� �ೢ�� �����Ѵ�.
    
    ORACLE�����
        SELECT A.�÷���, A.�÷���, B.�÷���, B.�÷���, ......
        FROM ���̺� A, ���̺� B
        WHERE A.�÷��� = B.�÷���;
        
    ANSI SQL �����
        SELECT A.�÷���, A.�÷���, B.�÷���, B.�÷���....
        FROM ���̺� A JOIN ���̺� B
        ON  A.�÷��� = B.�÷���;
*/

-- ���� ���̵�, �����̸�, �ҼӺμ����̵�, �ҼӺμ����� ��ȸ�ϱ�
--  E           E          E        
--                         D          D
-- ORACLE�� �����
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E , DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--ANSI SQL�� �����
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, B.DEPARTMENT_NAME
FROM EMPLOYEES A JOIN DEPARTMENTS B
ON A.DEPARTMENT_ID = B.DEPARTMENT_ID;

-- �μ������ڰ� ������ �μ��� �μ����̵�, �μ���, �μ������ڸ�(�����̸�)�� ��ȸ�ϱ�
--                          D       D       D 
--                                          E
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME,
       E.FIRST_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID IS NOT NULL
AND D.MANAGER_ID = E.EMPLOYEE_ID;


SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME,
       B.FIRST_NAME
FROM DEPARTMENTS A JOIN EMPLOYEES B
ON A.MANAGER_ID = B.EMPLOYEE_ID
WHERE A.MANAGER_ID IS NOT NULL;

-- �������̵�, �̸�, �ҼӺμ����̵�, �ҼӺμ���, �������̵�, ��������, �޿��� ��ȸ�ϱ�
--   E        E         E                   E               E
--                      D        D    
--                                          J        J
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME,
        E.JOB_ID, J.JOB_TITLE, E.SALARY
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.JOB_ID = J.JOB_ID;

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME,
        E.JOB_ID, J.JOB_TITLE, E.SALARY
FROM EMPLOYEES E 
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN JOBS J ON E.JOB_ID = J.JOB_ID;

-- �������̵�, �����̸�,�ҼӺμ����̵�, �μ���, ���������̵�, �ٹ��������ø��� ��ȸ�ϱ�
--  E           E      E  
--                     D           D        D
--                                          L           L

SELECT  A.EMPLOYEE_ID,
        A.FIRST_NAME,
       -- D.DEPARTMENT_ID,
       -- E.DEPARTMENT_NAME,
       -- C.LOCATION_ID,
        C.CITY
FROM EMPLOYEES A, DEPARTMENTS B, LOCATIONS C
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND B.LOCATION_ID = C.LOCATION_ID;

/*
�����ο� �������̺� �߰�
*/
CREATE TABLE SALARY_GRADES (
    GRADE CHAR(1) PRIMARY KEY,
    MIN_SALARY NUMBER(8,2),
    MAX_SALARY NUMBER(8,2)
);
INSERT INTO SALARY_GRADES VALUES('A',0,2499);
INSERT INTO SALARY_GRADES VALUES('B',2500,4999);
INSERT INTO SALARY_GRADES VALUES('C',5000, 9999);
INSERT INTO SALARY_GRADES VALUES('D',10000,29999);
INSERT INTO SALARY_GRADES VALUES('E',20000,39999);

COMMIT;

/*
������
    ���������� ������ �� ���� ������̺��� ���� ���� ���� �����͸� �������� �ٽ�,
    ũ�ų� ���� ����� �������� �����͸� ��ȸ�ϴ� ���ι���� �������̴�.
*/

-- �������̵�, �����̸�, �޿�,              �޿������ ��ȸ�ϱ�
-- E          E       E     
--                    G(�ּ�/�ִ�޿�)      G

SELECT A.EMPLOYEE_ID, FIRST_NAME, A.SALARY, B.GRADE
FROM EMPLOYEES A, SALARY_GRADES B
WHERE A.SALARY >=B.MIN_SALARY AND A.SALARY <= B.MAX_SALARY
ORDER BY A.EMPLOYEE_ID ASC;

-- ANSI SQL
SELECT A.EMPLOYEE_ID, FIRST_NAME, A.SALARY, B.GRADE
FROM EMPLOYEES A
JOIN SALARY_GRADES B
ON A.SALARY >= B.MIN_SALARY AND A.SALARY<= B.MAX_SALARY
ORDER BY A.EMPLOYEE_ID ASC;

/*
�������� : ���ο� �������� ���ϴ°͵� �������ϴ°�

���� ���̺��� �����Ͱ� �ְ�, �ٸ� �� ���̺� ���������� �����ϴ� �����Ͱ� ���� ���,
���ο� �������� ���ϱ� ������ �ش� ���� ��ȸ���� �ʴ´�.
�����Ͱ� ���� ��쿡�� �����Ͱ� �ִ� �� ���̺��� ��� ���� ��ȸ�ϴ� ���ι���̴�.
��� ���� ��ȸ�ϴ� ���̺��� �ݴ��� �������ǿ� �������� ��ȣ�� �߰��Ѵ�.
*/

-- �μ����̵�, �μ��̸�, �μ������� ���̵�,    �μ��������̸��� ��ȸ
-- D            D       D(MANAGER_ID)          
--                      E(EMPLOYEE_ID)    E(FIRST_NAME)

SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, A.MANAGER_ID, B.FIRST_NAME
FROM DEPARTMENTS A, EMPLOYEES B
WHERE A.MANAGER_ID = B.EMPLOYEE_ID(+);

--�������̵�, �����̸�, �ҼӺμ� ���̵�, �ҼӺμ��� ��ȸ�ϱ�
-- E            E         E
--                        D          D
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.DEPARTMENT_ID, B.DEPARTMENT_NAME 
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID(+); --(+)��ȣ�� NULL���� ǥ���Ҽ� �ִ�.

-- ANSI SQL
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.DEPARTMENT_ID, B.DEPARTMENT_NAME 
FROM EMPLOYEES A
LEFT OUTER JOIN DEPARTMENTS B  --LEFT OUTER JOIN�� �������̺��� ��� ���� ��ȸ�Ѵ�. -- LEFT�� ����
ON A.DEPARTMENT_ID = B.DEPARTMENT_ID;

-------------------------------------------------------------------------------------------------------------
-- 'ST_CLERK'�� �ٹ��ϴٰ� �ٸ� �������� ������ ������ ���̵�, �̸�, ������ �μ���, ���� �������̵�, ���� �ٹ��μ����� ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID,
           E.FIRST_NAME,
           H.JOB_ID   AS ��������,
           E.JOB_ID    AS ��������,
           D1.DEPARTMENT_NAME  AS �����μ���,
           D2.DEPARTMENT_NAME  AS ����μ���
FROM JOB_HISTORY H,     -- ���������̷�����(��������, �����ҼӺμ����̵�)
     EMPLOYEES E,       -- ��������(��������, ����ҼӺμ����̵�)
     DEPARTMENTS D1,    -- �����ҼӺμ�����
     DEPARTMENTS D2     -- ����ҼӺμ�����
WHERE H.JOB_ID = 'ST_CLERK'
AND H.EMPLOYEE_ID = E.EMPLOYEE_ID
AND H.DEPARTMENT_ID = D1.DEPARTMENT_ID
AND E.DEPARTMENT_ID = D2.DEPARTMENT_ID;   
