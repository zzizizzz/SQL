-- employees ���̺��� ������� ��� �������̵� ��ȸ�ϱ�
SELECT  DISTINCT JOB_ID
FROM EMPLOYEES;

-- �޿��� 12,000�޷� �̻� �޴� ����� �̸��� �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 12000;

-- �����ȣ�� 176�� ����� ���̵�� �̸� ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 176;

-- �޿��� 12,000�޷� �̻� 15,000�޷� ���� �޴� ������� ��� ���̵�� �̸��� �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 12000 AND SALARY <= 15000;

-- 2005�� 1�� 1�Ϻ��� 2005�� 6�� 30�� ���̿� �Ի��� ����� ���̵�, �̸�, �������̵�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '2005/01/01' AND HIRE_DATE < '2005/07/01';

-- �޿��� 5,000�޷��� 12,000�޷� �����̰�, �μ���ȣ�� 20 �Ǵ� 50�� ����� �̸��� �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000 AND SALARY <= 12000
AND DEPARTMENT_ID IN (20, 30);

-- �����ڰ� ���� ����� �̸��� �������̵� ��ȸ�ϱ�
SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- Ŀ�̼��� �޴� ��� ����� �̸��� �޿�, Ŀ�̼��� �޿� �� Ŀ�̼��� ������������ �����ؼ� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC, COMMISSION_PCT DESC;

-- �̸��� 2��° ���ڰ� e�� ��� ����� �̸��� ��ȸ�ϱ�
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE SUBSTR(FIRST_NAME, 2, 1) = 'e';

-- �������̵� ST_CLERK �Ǵ� SA_REP�̰� �޿��� 2,500�޷�, 3,500�޷�, 7,000�޷� �޴� ��� ����� �̸��� �������̵�, �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES 
WHERE JOB_ID IN ('ST_CLEKR', 'SA_REP')
AND SALARY IN (2500, 3500, 7000);

-- ��� ����� �̸��� �Ի���, �ٹ� ���� ���� ����Ͽ� ��ȸ�ϱ�, �ٹ����� ���� ������ �ݿø��ϰ�, �ٹ��������� �������� ������������ �����ϱ�
SELECT FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) MONTHS
FROM EMPLOYEES
ORDER BY MONTHS ASC;

-- ����� �̸��� Ŀ�̼��� ��ȸ�ϱ�, Ŀ�̼��� ���� �ʴ� ����� '����'���� ǥ���ϱ�
SELECT FIRST_NAME, NVL(TO_CHAR(COMMISSION_PCT), '����') COMM
FROM EMPLOYEES;

-- ��� ����� �̸�, �μ���ȣ, �μ��̸��� ��ȸ�ϱ�
SELECT E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);

-- 80���μ��� �Ҽӵ� ����� �̸��� �������̵�, ��������, �μ��̸��� ��ȸ�ϱ�
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = 80
AND E.JOB_ID = J.JOB_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- Ŀ�̼��� �޴� ��� ����� �̸��� �������̵�, ��������, �μ��̸�, �μ������� ���ø��� ��ȸ�ϱ�
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D, LOCATIONS L
WHERE COMMISSION_PCT IS NOT NULL
AND E.JOB_ID = J.JOB_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND D.LOCATION_ID = L.LOCATION_ID(+);

-- 'Europe'�� �������� �ΰ� �ִ� ��� �μ����̵�� �μ��̸��� ��ȸ�ϱ�
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE R.REGION_NAME = 'Europe'
AND D.LOCATION_ID = L.LOCATION_ID
AND L.COUNTRY_ID = C.COUNTRY_ID
AND C.REGION_ID = R.REGION_ID;

-- ����� �̸��� �ҼӺμ���, �޿�, �޿� ����� ��ȸ�ϱ�
SELECT E.FIRST_NAME, D.DEPARTMENT_NAME, E.SALARY, G.GRADE
FROM EMPLOYEES E, DEPARTMENTS D, SALARY_GRADES G
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY;

-- ����� �̸��� �ҼӺμ���, �ҼӺμ��� �����ڸ��� ��ȸ�ϱ�, 
-- �ҼӺμ��� ���� ����� �ҼӺμ��� '����, �����ڸ� '����'���� ǥ���ϱ�
SELECT E.FIRST_NAME, 
       NVL(D.DEPARTMENT_NAME, '����'), 
       NVL(M.FIRST_NAME, '����')
FROM EMPLOYEES E, DEPARTMENTS D, EMPLOYEES M
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND D.MANAGER_ID = M.EMPLOYEE_ID(+); 

-- ��� ����� �޿� �ְ��, �޿� ������, �޿� �Ѿ�, �޿� ��վ��� ��ȸ�ϱ�
SELECT MAX(SALARY), MIN(SALARY), SUM(SALARY), TRUNC(AVG(SALARY))
FROM EMPLOYEES;

-- ������ �޿� �ְ��, �޿� ������, �޿� �Ѿ�, �޿� ��վ��� ��ȸ�ϱ�
SELECT JOB_ID, MAX(SALARY), MIN(SALARY), SUM(SALARY), AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- �� ������ ������� ��ȸ�ؼ� ���� ������� ���� ���� 3���� ��ȸ�ϱ�, �������̵�� ����� ǥ���ϱ�
WITH TEMP1 
AS (SELECT JOB_ID, COUNT(*) CNT
    FROM EMPLOYEES
    GROUP BY JOB_ID)
SELECT ROWNUM, JOB_ID, CNT
FROM (SELECT JOB_ID, CNT
      FROM TEMP1
      ORDER BY CNT DESC)
WHERE ROWNUM <= 3;

-- �����ں� ������� ��ȸ�ϱ�, ������ �̸��� �� �����ڰ� �����ϴ� ����� ǥ���ϱ�
SELECT B.FIRST_NAME, A.CNT
FROM (SELECT MANAGER_ID, COUNT(*) CNT
      FROM EMPLOYEES
      WHERE MANAGER_ID IS NOT NULL
      GROUP BY MANAGER_ID) A, EMPLOYEES B
WHERE A.MANAGER_ID = B.EMPLOYEE_ID;

-- �� �μ��� ���� �μ��̸�, ������ �̸�, �Ҽӻ�� ��, �Ҽӻ������ ��� �޿��� ��ȸ�ϱ�
SELECT D.DEPARTMENT_NAME,
       (SELECT E.FIRST_NAME
        FROM EMPLOYEES E
        WHERE E.EMPLOYEE_ID = D.MANAGER_ID) MANAGER_NAME,
       (SELECT COUNT(*)
        FROM EMPLOYEES E
        WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID) CNT,
       (SELECT TRUNC(AVG(E.SALARY)) AVG_SALARY
        FROM EMPLOYEES E
        WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID) AVG_SALARY
FROM DEPARTMENTS D;

-- Steven King�� ���� �μ��� ���� ����� �̸��� �Ի����� ��ȸ�ϱ�
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM EMPLOYEES
                       WHERE FIRST_NAME = 'Steven' AND LAST_NAME = 'King');

-- �Ҽ� �μ��� ��ձ޿����� ���� �޿��� �޴� ����� ���̵�� ����̸�, �޿�, �� �μ��� ��� �޿��� ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID, E.SALARY, A.AVG_SALARY
FROM (SELECT DEPARTMENT_ID, TRUNC(AVG(SALARY)) AVG_SALARY
      FROM EMPLOYEES
      WHERE DEPARTMENT_ID IS NOT NULL
      GROUP BY DEPARTMENT_ID) A, EMPLOYEES E
WHERE A.DEPARTMENT_ID = E.DEPARTMENT_ID
AND A.AVG_SALARY > E.SALARY;

-- Neena ������ �޿��� �޴� ��� ����� �̸��� �Ի��� �޿��� ��ȸ�ϱ�, ����� Kochhar�� ���Խ�Ű�� �ʱ�
SELECT FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT SALARY
                FROM EMPLOYEES
                WHERE FIRST_NAME = 'Neena')
AND FIRST_NAME != 'Neena';

-- �Ҽ� �μ��� �Ի����� ������, �� ���� �޿��� �޴� ����� �̸��� �ҼӺμ���, �޿��� ��ȸ�ϱ�

-- ������ ���̵�, �����ڸ�, �� �����ڰ� �����ϴ� �����, �� �����ڰ� �Ҽӵ� �μ��� ��ȸ�ϱ�
