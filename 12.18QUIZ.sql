--employees ���̺��� ������� ��� �������̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID
FROM EMPLOYEES;
--�޿��� 12,000�޷� �̻� �޴� ����� �̸��� �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY>12000;
--�����ȣ�� 176�� ����� ���̵�� �̸� ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 176;
--�޿��� 12,000�޷� �̻� 15,000�޷� ���� �޴� ������� ��� ���̵�� �̸��� �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE  SALARY >=12000 AND 
        SALARY<=15000;
--2005�� 1�� 1�Ϻ��� 2005�� 6�� 30�� ���̿� �Ի��� ����� ���̵�, �̸�, �������̵�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE '2005/01/01'>HIRE_DATE
AND HIRE_DATE<'2005/06/30';

--�޿��� 5,000�޷��� 12,000�޷� �����̰�, �μ���ȣ�� 20 �Ǵ� 50�� ����� �̸��� �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY>5000 AND SALARY<12000
AND DEPARTMENT_ID IN (20,50);
--�����ڰ� ���� ����� �̸��� �������̵� ��ȸ�ϱ�
SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC, COMMISSION_PCT DESC;
--Ŀ�̼��� �޴� ��� ����� �̸��� �޿�, Ŀ�̼��� �޿� �� Ŀ�̼��� ������������ �����ؼ� ��ȸ�ϱ�
SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC, COMMISSION_PCT DESC;
--�̸��� 2��° ���ڰ� e�� ��� ����� �̸��� ��ȸ�ϱ�
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE SUBSTR(FIRST_NAME, 2, 1) = 'e';
--�������̵� ST_CLERK �Ǵ� SA_REP�̰� �޿��� 2,500�޷�, 3,500�޷�, 7,000�޷� �޴� ��� ����� �̸��� �������̵�, �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID IN('ST_CLERK', 'SA_REP')
AND SALARY IN (2500,3500,700);
--��� ����� �̸��� �Ի���, �ٹ� ���� ���� ����Ͽ� ��ȸ�ϱ�, �ٹ����� ���� ������ �ݿø��ϰ�, �ٹ��������� �������� ������������ �����ϱ�

--����� �̸��� Ŀ�̼��� ��ȸ�ϱ�, Ŀ�̼��� ���� �ʴ� ����� '����'���� ǥ���ϱ�
SELECT FIRST_NAME , NVL(TO_CHAR(COMMISSION_PCT), '����') COMM
FROM EMPLOYEES;
--��� ����� �̸�, �μ���ȣ, �μ��̸��� ��ȸ�ϱ�
SELECT E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D;

--80���μ��� �Ҽӵ� ����� �̸��� �������̵�, ��������, �μ��̸��� ��ȸ�ϱ�
SELECT E.FIRST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, E.DEPARTMENT_ID
FROM EMPLOYEES E , JOBS J, DEPARTMENTS D
WHERE D.DEPARTMENT_ID = 80
AND E.JOB_ID = J.JOB_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;
--Ŀ�̼��� �޴� ��� ����� �̸��� �������̵�, ��������, �μ��̸�, �μ������� ���ø��� ��ȸ�ϱ�
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, D.DEPARTMENT_NAME, L.LOCATION_ID
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D, LOCATIONS L
WHERE COMMISSION_PCT IS NOT NULL
AND E.JOB_ID = J.JOB_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID;

--������ �������� �ΰ� �ִ� ��� �μ����̵�� �μ��̸��� ��ȸ�ϱ�
SELECT D.DEPARTMENT_ID, R.REGION_NAME
FROM DEPARTMENTS D, REGIONS R
WHERE D.DEPARTMENT_ID = R.REGION_NAME;

--����� �̸��� �ҼӺμ���, �޿�, �޿� ����� ��ȸ�ϱ�
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, G.GRADE
FROM EMPLOYEES E, SALARY_GRADES G
WHERE E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY;

--����� �̸��� �ҼӺμ���, �ҼӺμ��� �����ڸ��� ��ȸ�ϱ�, �ҼӺμ��� ���� ����� �ҼӺμ��� '����, �����ڸ� '����'���� ǥ���ϱ�


--��� ����� �޿� �ְ��, �޿� ������, �޿� �Ѿ�, �޿� ��վ��� ��ȸ�ϱ�
SELECT AVG(SALARY), MIN(SALARY), MAX(SALARY), TRUNC(AVG(SALARY))
FROM EMPLOYEES;

--������ �޿� �ְ��, �޿� ������, �޿� �Ѿ�, �޿� ��վ��� ��ȸ�ϱ�
SELECT JOB_ID, MAX(SALARY), MIN(SALARY), SUM(SALARY), AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;

--�� ������ ������� ��ȸ�ؼ� ���� ������� ���� ���� 3���� ��ȸ�ϱ�, �������̵�� ����� ǥ���ϱ�

--�����ں� ������� ��ȸ�ϱ�, ������ �̸��� �� �����ڰ� �����ϴ� ����� ǥ���ϱ�


--�� �μ��� ���� �μ��̸�, ������ �̸�, �Ҽӻ�� ��, �Ҽӻ������ ��� �޿��� ��ȸ�ϱ�
SELECT DEPARMENT_NAME, MANAGER_NAME, 

--Steven King�� ���� �μ��� ���� ����� �̸��� �Ի����� ��ȸ�ϱ�
SELECT B.DEPARTMENT_ID, B.DEPARTMENT_NAME, HIRE_DATE
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.FIRST_NAME = 'Steven'
AND A.DEPARTMENT_ID = B.DEPARTMENT_ID;

--�Ҽ� �μ��� ��ձ޿����� ���� �޿��� �޴� ����� ���̵�� ����̸�, �޿�, �� �μ��� ��� �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY
FROM EMPLOYEES 
WHERE SALARY>(SELECT AVG(SALARY)
              FROM EMPLOYEES);

--Kochhar�� ������ �޿� ��� ����� �̸��� �Ի��� �޿��� ��ȸ�ϱ�, ����� Kochhar�� ���Խ�Ű�� �ʱ�
SELECT FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT SALARY
                FROM EMPLOYEES
                WHERE FIRST_NAME = 'Valli')
AND FIRST_NAME != 'Valli';

--�Ҽ� �μ��� �Ի����� ������, �� ���� �޿��� �޴� ����� �̸��� �ҼӺμ���, �޿��� ��ȸ�ϱ�
SELECT A.FIRST_NAME,A.DEPARTMENT_ID, A.SALARY, A.HIRE_DATE
FROM EMPLOYEES A,  EMPLOYEES B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND A.HIRE_DATE > B.HIRE_DATE
AND A.SALARY< B.SALARY;
--������ ���̵�, �����ڸ�, �� �����ڰ� �����ϴ� �����, �� �����ڰ� �Ҽӵ� �μ��� ��ȸ�ϱ�