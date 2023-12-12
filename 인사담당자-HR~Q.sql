-- 60�� �μ��� �Ҽӵ� �������� ���̵�, �̸�, �������� ���̵�, �������� �̸��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;
-- 60�� �μ��� �Ҽӵ� �������� ���̵�, �̸�, �޿�, �޿������ ��ȸ�ϱ�
--    E                   E       E   E    G
SELECT E.DEPARTMENT_ID, 
        E.EMPLOYEE_ID, 
        E.FIRST_NAME, 
        G.GRADE
FROM EMPLOYEES E, SALARY_GRADES G
WHERE E.DEPARTMENT_ID = 60;


-- ������ �߿��� �ڽ��� ��纸�� ���� �Ի��� �������� ���̵�, �̸�, �Ի���, �������� �̸�, �������� �Ի����� ��ȸ�ϱ�
SELECT EM.EMPLOYEE_ID AS EM_ID,
       EM.HIRE_DATE AS EM_DATE,
       EM.FIRST_NAME  AS EM_NAME,
       MG.EMPLOYEE_ID  AS MG_ID,
       MG.HIRE_DATE    AS MG_DATE,
       MG.FIRST_NAME   AS MG_NAME
FROM EMPLOYEES EM, EMPLOYEES MG
WHERE EM.HIRE_DATE > MG.HIRE_DATE; 

-- �������� �������̵� ��ձ޿��� ��ȸ�ؼ� �������̵�, ��ձ޿��� ��ȸ�ϱ�
--        E          E
SELECT AVG(SALARY), JOB_ID
FROM EMPLOYEES
GROUP BY JOB_ID;

-- ��ձ޿��� �Ҽ����κ��� ���� ������.
-- �����ں�(���)�� ����ڴ� �������� ��ȸ�ؼ� ������ ���̵�, �������� ����ϱ�
SELECT MANAGER_ID, COUNT(*)
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID;
-- �������� ��ü ��ձ޿����� �޿��� ���� �޴� �������� ���̵�, �̸�, �޿��� ����ϱ�
--                       
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY)
                FROM EMPLOYEES);
    
-- ��ü ������ ��ձ޿����� 2�� �̻��� �޿��� �޴� �������� ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY < 2*(SELECT AVG(SALARY)
                FROM EMPLOYEES);

-- 80�� �μ��� �ٹ��ϰ�, 80�� �μ��� �����޿��� ������ �޿��� �޴� ������ ���̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY,DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
OR SALARY = (SELECT MIN(SALARY)
             FROM EMPLOYEES);

-- �������� �޿������ ����ؼ� �޿���޺� �������� ��ȸ�ؼ� �޿����, �������� ����ϱ�
SELECT GRADE, COUNT(*)
FROM SALARY_GRADES
GROUP BY GRADE;
-- 'Neena'�� ���� �ؿ� �Ի��� �������� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE = 

