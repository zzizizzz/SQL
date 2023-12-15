-- ��� ������ ���̵�, �̸�, �μ���ȣ, �μ����� ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);

-- Ŀ�̼��� �޴� ������ ���̵�, �̸�, �������̵�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- Ŀ�̼��� �޴� ������ ���̵�, �̸�, �޿�, Ŀ�̼�, �޿������ ��ȸ�ϱ�
--              E           E   E       E       G      
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, G.GRADE, E.COMMISSION_PCT
FROM EMPLOYEES E, SALARY_GRADES G
WHERE COMMISSION_PCT IS NOT NULL --�˻�����
AND E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY;

[100, ȫ�浿 , 2000] [A,0,2499]
-- 80�� �μ��� �Ҽӵ� �������� ��ձ޿�, �����޿�, �ְ�޿��� ��ȸ�ϱ�
SELECT TRUNC(AVG(SALARY)), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;


-- 80�� �μ��� �Ҽӵ� �������� �������̵�, �̸�, ��������, �޿�, ���� �ְ�޿��� �޿����� ���̸� ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, J.JOB_TITLE, E.SALARY, J.MAX_SALARY - E.SALARY AS SALARY_GAP
FROM  EMPLOYEES E, JOBS J 
WHERE E.DEPARTMENT_ID = 80 -- ��ȸ����
AND E.JOB_ID = J.JOB_ID; -- ��������


-- �� �μ��� �ְ�޿�, �����޿�, �ְ�޿��� �����޿��� ���̸� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, MAX(SALARY), MIN(SALARY), MAX(SALARY) - MIN(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, MAX_SALARY, MIN_SALARY, MAX_SALARY - MIN_SALARY
FROM (SELECT DEPARTMENT_ID, MIN(SALARY) MAX_SALARY , MIN(SALARY) MIN_SALARY
       FROM EMPLOYEES
       WHERE DEPARTMENT_ID IS NOT NULL
       GROUP BY DEPARTMENT_ID);

-- 'Executive' �μ��� ��� �������̵�, �̸�, �������̵� ��ȸ�ϱ�
SELECT D.DEPARTMENT_NAME,E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE DEPARTMENT_NAME = 'Executive'    -- �˻�����
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID; -- ��������

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Executive');

-- ��ü ������ ��ձ޿����� �޿��� ���� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY< (SELECT AVG(SALARY)
                FROM EMPLOYEES);

-- 'Ismael'�� ���� �ؿ� �Ի��߰�, ���� �μ��� �ٹ��ϰ� �ִ� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') IN (SELECT TO_CHAR(HIRE_DATE, 'YYYY')
                                    FROM EMPLOYEES
                                    WHERE FIRST_NAME = 'Ismael')
AND DEPARTMENT_ID  = (SELECT DEPARTMENT_ID
                      FROM EMPLOYEES
                      WHERE FIRST_NAME = 'Ismael');
                      

-- �μ��� �ְ�޿��� ��ȸ���� �� �ְ�޿��� 15000�� �Ѵ� �μ��� ���̵�� �ְ�޿��� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) > 15000;
-- 'Neena'���� �޿��� ���� �޴� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, JOB_ID
FROM EMPLOYEES E
WHERE SALARY > (SELECT SALARY
                FROM EMPLOYEES
                WHERE FIRST_NAME = 'Neena');

-- �޿���޺��� �������� ��ȸ�ϱ�
SELECT G.GRADE, COUNT(*)
FROM EMPLOYEES E, SALARY_GRADES G
WHERE E.SALARY >= G.MIN_SALARY AND E.SALARY<=G.MAX_SALARY
GROUP BY G.GRADE;


-- �μ��� ��ձ޿��� ������� �� �μ��� ��ձ޿����� �޿��� ���� �޴� ������ ���̵�, �̸�, �޿�, �μ����� ��ȸ�ϱ�
SELECT A.DEPARTMENT_ID, A.AVG_SALARY, B.EMPLOYEE_ID, B.FIRST_NAME, B.SALARY, C.DEPARTMENT_NAME
FROM (SELECT DEPARTMENT_ID, AVG(SALARY) AS AVG_SALARY
       FROM EMPLOYEES
    WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID) A, EMPLOYEES B, DEPARTMENTS C
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND A.AVG_SALARY > B.SALARY
AND B.DEPARTMENT_ID = C.DEPARTMENT_ID;

--'Ismael' ������ �ٹ��ϴ� �μ��� ���̵�� �̸��� ��ȸ�ϱ�
-- ���ι��
SELECT B.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.FIRST_NAME = 'Ismael'
AND A.DEPARTMENT_ID = B.DEPARTMENT_ID;

-- ���� ���� ���
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE FIRST_NAME ='Ismael');
                        
                        
                        
-- 'Neena'���� �����ϴ� ������ ���̵�� �̸��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID , FIRST_NAME
FROM  EMPLOYEES
WHERE MANAGER_ID = (SELECT EMPLOYEE_ID
                    FROM EMPLOYEES
                    WHERE FIRST_NAME = 'Neena' );
-- �μ��� ��ձ޿��� ��������� 'Ismael'�� �ٹ��ϴ� ��ձ޿����� �޿��� ���� �޴� �μ���
-- �μ� ���̵�� ��ձ޿��� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, AVG(SALARY) AVG_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >  (SELECT AVG(SALARY)
                       FROM EMPLOYEES
                       WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                                              FROM EMPLOYEES
                                              WHERE FIRST_NAME = 'Ismael'));
                    
                    



