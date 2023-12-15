-- �޿��� 12000�� �Ѵ� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from employees
where salary>=12000;
-- �޿��� 5000�̻� 12000������ ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
select employee_id, first_name, salary
from employees
where SALARY BETWEEN 5000 AND 12000;
-- 2007�⿡ �Ի��� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
select employee_id, first_name, hire_date
from employees
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2007';

select employee_id, first_name, hire_date
from employees
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE <'2008/01/01';
-- 20�� Ȥ�� 50�� �μ��� �Ҽӵ� ������ �̸��� �μ���ȣ�� ��ȸ�ϰ�, �̸��� ���ĺ������� �����ؼ� ��ȸ�ϱ�
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID  IN(50,20)
ORDER BY FIRSt_NAME ASC;
-- �޿��� 5000�̻� 12000���ϰ�, 20�� Ȥ�� 50�� �μ��� �Ҽӵ� ����� �̸��� �޿�, �μ���ȣ�� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID in(50, 20)
and salary > 5000 and salary < 12000
ORDER BY SALARY ASC;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID in(50, 20)
and SALARY BETWEEN 5000 AND 12000;

-- �����ڰ� ���� ������ �̸��� ����, �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- ������ 'SA_MAN'�̰ų� 'ST_MAN'�� �����߿��� �޿��� 8000�̻� �޴� ������ ���̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN ('SA_MAN', 'ST_MAN')
AND SALARY >= 8000;

-- ��� ������ �̸�, �������̵�, �޿�, �ҼӺμ����� ��ȸ�ϱ�
--      E          E         E      
--                                  D
SELECT E.FIRST_NAME, E.JOB_ID, E.SALARY, D.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT  E.FIRST_NAME,E.JOB_ID,E.SALARY, D.DEPARTMENT_NAME
FROM  EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);

-- ��� ������ �̸�, �������̵�, ��������, �޿�, �ּұ޿�, �ִ�޿��� ��ȸ�ϱ�
--       E         E                 E
--                 J           J             J       J
SELECT  E.EMPLOYEE_ID,
        E.FIRST_NAME,
        E.JOB_ID,
        J.JOB_TITLE,
        J.MIN_SALARY,
        J.MAX_SALARY,
        E.SALARY
FROM  EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID;
-- ��� ������ �̸�, �������̵�, ��������, �޿�, �ּұ޿���ȸ�ϱ�
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, J.MIN_SALARY
FROM EMPLOYEES E , JOBS J
WHERE E.JOB_ID = J.JOB_ID;

-- Ŀ�̼��� �޴� ��� ������ ���̵�, �μ��̸�, �ҼӺμ��� ������(���ø�)�� ��ȸ�ϱ�
--  E                E                    
--                                D  
--                                       L 
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E , DEPARTMENTS D, LOCATIONS L
WHERE E.COMMISSION_PCT IS NOT NULL
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND D.LOCATION_ID = L.LOCATION_ID(+);

-- �̸��� A�� a�� �����ϴ� ��� ������ �̸��� �������̵�, ��������, �޿�, �ҼӺμ����� ��ȸ�ϱ�
--   E                        E         E                E
--                                                              D
--                                      J         J  
SELECT E.FIRST_NAME, E,JOB_ID, J.JOB_TITLE, E.SALARY, D.DEPARTMENT_NAME
FROM EMPLOYEES E,DEPARTMENT D, JOBS J
WHERE LOWER(FIRST_NAME) LIKE 'a%'
-- WHERE SUBSTR(E.FIRST_NAME, 1,1) IN ('a', 'A')
-- WHERE (E.FIRST_NAME LIKE 'a%' OR E.FIRST_NAME LIKE'A%')
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.JOB_ID = J.JOB_ID;
-- 30, 60, 90�� �μ��� �ҼӵǾ� �ִ� ������ �߿��� 100���� �����ϴ� �������� �̸�, �������̵�, �޿�, �޿������ ��ȸ�ϱ�
-- E                                         E                   E       E      E      
--                                                                                      G(�ּ�/ �ִ�޿�)
SELECT E.FIRST_NAME, E.JOB_ID, E.SALARY, G.GRADE
FROM EMPLOYEES E, SALARY_GRADES G
WHERE E.DEPARTMENT_ID IN(30,60,90)
AND E.MANAGER_ID = 100
AND E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY;
-- 80�� �μ��� �Ҽӵ� �������� �̸�, �������̵�, ��������, �޿�, �޿����, �ҼӺμ����� ��ȸ�ϱ�
-- E                     E       E                E
--                               J          J
--                                                G     G        
--                                                               D
SELECT D.EMPLOYEE_ID, E.JOB_ID, J.JOB_TITLE, E.SALARY, G.GRADE, D.DEPLARTMENT_ID
FROM EMPLOYEES E, JOBS J, SALARY_GRADES G, DEPARTMENTS D
WHERE E.DEPARTMMENT_ID = 80 
AND E.JOB_ID = J.JOB_ID 
AND E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);
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
-- 'IT' �μ����� �ٹ��ϴ� ������ ���̵�, �̸��� ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.DEPARTMENT_ID
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.DEPARTMENT_NAME = 'IT'
AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;
-- �������� �ٹ� ���� ���ø��� �ߺ����� ��ȸ�ϱ�
SELECT DISTINCT L.CITY --E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.LOCATION_ID, L.LOCATION_ID, L.CITY 
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID;
-- �޿��� �޿������ �������� �� 'A' ��޿� �ش�Ǵ� �������� ���̵�, �̸�, �޿�, �������̵��� ��ȸ�ϱ�
--  E        G               G                    E        E    E     E  
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, E.JOB_ID
FROM SALARY_GRADES G, EMPLOYEES E
WHERE E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY
AND G.GRADE = 'A';
-- 200�� ������ �����ϴ� �μ����� �ٹ��ϴ� ������ ���̵�, �̸�, ������ ��ȸ�ϱ�
--  D                                   E        E     E
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID = 200
AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;
-- ��� ������ ���̵�, �̸�, �޿�, Ŀ�̼��� ����� �޿�, �޿����, �������̵�, �ҼӺμ����̵�, �ҼӺμ���, �ٹ��� ���ø��� ��ȸ�ϱ� 
--           E      E    E     E          E                   E          E                                     
--                                        G       G                   
--                                                                        D       D
--                                                                                             L

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY,
       E.SALARY + E.SALARY*NVL(COMMISSION_PCT, 0) REAL_SALARY,
       G.GRADE,
       E.JOB_ID,
       D.DEPARTMENT_ID, 
       D.DEPARTMENT_NAME, 
       L.CITY
FROM EMPLOYEES E, SALARY_GRADES G, DEPARTMENTS D, LOCATIONS L
WHERE E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND D.LOCATION_ID = L.LOCATION_ID(+);





