
/*
    ���̺��� ������ ��ȸ
    
    1. ������ ���̺��� ��� ��, ��� ���� ��ȸ�Ѵ�.
    SELECT *
    FROM���̺��;
    
    2. ������ ���̺��� �����, ������ ���� ��ȸ�ϱ�
    SELECT �÷���, �÷���, �÷��� ........
    FROM ���̺��
    
    3. SELECT������ ��Ģ������ ������ �� �ִ�.
    SELECT �÷���*����, �÷���*�÷���,.......
    FROM ���̺��;
    *��Ģ���꿡 ���Ǵ� �ķ��� �ش�Ŀ���� ���� ���ڰ��̾���Ѵ�.
    
    4. �÷��� ��Ī(ALIAS)�ο��ϱ�
    SELECT �÷��� AS ��Ī, �÷���AS��Ī, ....
    FROM ���̺��;
    
    SELECT �÷��� ��Ī, �÷��� ��Ī, �÷��� ��Ī,....
    FROM ���̺��;
*/

-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT*
FROM REGIONS;

-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM COUNTRIES;

-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM JOBS;

-- �μ� ���̺��� ��� ��, ��翭 ��ȸ�ϱ�
SELECT *
FROM departments;

-- �����׺��� ��� ��, ��翭 ��ȸ�ϱ�
SELECT *
FROM EMPLOYEES;

-- ���� ���̺��� ���� ���̵�, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT JOB_ID, MIN_SALARY, MAX_SALARY
FROM JOBS;


-- ���� ���̺��� �������̵�, �����̸�(FIRST_NAME),�޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES;

-- ������ ���̺��� ������ ���̵� , �ּ�, ���ø��� ��ȸ�ϱ�
SELECT LOCATION_ID, STREET_ADDRESS, CITY
FROM LOCATIONS;

-- ���� ���̺��� �������̵�, �����̸�, �޿�, ������ȸ�ϱ�
-- ������ �޿�*12�� ����Ѵ�.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY*12
FROM EMPLOYEES;

-- �������̺��� �������̵�, �����̸�, �޿�, ������ȸ�ϱ�
-- ������ �޿� *12�� ����Ѵ�.
-- ������ ��Ī�� ANNUAL_SALARY��.
SELECT EMPLOYEE_ID, FIRST_NAME , SALARY , SALARY*12 AS ANNUAL_SALART
FROM EMPLOYEES;

-- ���� ���̺��� �������̵�, �ְ�޿�, �����޿�, �ְ�޿��� �����޿��� ���̸� ��ȸ�ϱ�
-- �ְ�޿��� �����޿��� ���̴� SALARY_GAP ��Ī�� �ο��Ѵ�.
SELECT JOB_ID, MAX_SALARY, MIN_SALARY, MAX_SALARY - MIN_SALARY AS SALARY_GRP
FROM JOBS;

/*
    ������ ���͸��ϱ�
    
    1. WHERE���� ���ǽ��� �ۼ��ؼ� �ش� ���ǽ��� ������Ű�� �ุ ��ȸ�ϱ�
    SELECT �÷���, �÷���, �÷���,.....
    FROM ���̺��
    WHERE ���ǽ�;
    
    2.WHERE������ 2���̻��� ���ǽ����� �����͸� ���͸��� �� �ִ�.
      2���̻��� ���ǽ��� �ۼ��� ���� AND, OR, NOT �� �����ڸ� ����Ѵ�.
    SELECT �÷���, �÷���, �÷���,....
    FROM ���̺��
    WHERE ���ǽ� AND ���ǽ�;
    *���ǽ� 1�� ���ǽ�2�� ��� TRUE�� �����Ǵ� �ุ ��ȸ�ȴ�.
    
    SELECT �÷���, �÷���, �÷���...
    FORM ���̺��
    WHERE ���ǽ�1 OR  ���ǽ�2;
    *���ǽ�1�� ���ǽ�2 �߿��� �ϳ��� TRUE�� �����Ǵ� �ุ ��ȸ�ȴ�.
    
    SELECT �÷���, �÷���, �÷���,....
    FROM ���̺��
    WHERE ���ǽ�1 AND (���ǽ�2 OR ���ǽ�3);
    * AND �����ڿ� OR �����ڸ� ���� ����ҋ��� OR ������� ��ȣ�� ���´�.    
*/
 -- ���� ���̺��� �ҼӺμ� ���̵� 60���� �������̵�, �������̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

--���� ���̺��� �޿��� 10000�޷� �̻� �޴� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000;

-- ���� ���̺��� �������̵� 'SA_MAN'�� ������ ���̵�, �̸�, �޿�, �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'SA_MAN';

-- ���� ���̺��� �޿��� 5000 ~ 10000 ������ ���ϴ� ���� ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
-- �޿��� 5000�̻� 10000���Ϸ� ���� ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000 AND SALARY <= 10000;

-- ���� ���̺��� 10�� �μ�, 20�� �μ�, 30�� �μ����� �ٹ��ϴ� ���� ���̵�, �̸�, �μ� ���̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20 OR DEPARTMENT_ID =30;
-------------------------------------------------------------------------------------

--�μ����̺��� ��� �μ� ������ ��ȸ�ϱ�
SELECT *
FROM departments;

-- �μ����̺��� ���������̵� 1700���� �μ� ���� ��ȸ�ϱ�
SELECT department_id
FROM DEPATMENTS
WHERE DEPARTMENT_ID = 1700;

-- 100�������� �����ϴ� �μ����� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 100; 

--�μ����� 'IT'�� �μ��� ���� ��ȸ�ϱ�
SELECT DEPARTMENT_NAME, DEPARTMENT_ID, MANAGER_ID, LOCATION_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT';

--���������̵� 1700���� ������ �ּ�, �����ȣ, ���ø�, �����ڵ带 ��ȸ�ϱ�
SELECT STREET_ADDRESS, POSTAL_CODE, CITY, COUNTRY_ID
FROM LOCATIONS
WHERE LOCATION_ID = '1700';

--�ּұ޿��� 2000�̻� 5000������ ������ �������̵�, ��������, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT JOB_ID,JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM JOBS
WHERE 2000<=MIN_SALARY AND 5000>=MAX_SALARY; 

--�ִ�޿��� 20000���� �ʰ��ϴ� ������ ���̵�, ��������, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM JOBS
WHERE MAX_SALARY >20000;

--100�������� �����ϴ� ������ ���̵�, �̸�, �μ����̵��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE MANAGER_ID = 100;

--80�� �μ����� �ٹ��ϰ� �޿��� 8000�� �̻� �޴� ������ ���̵�, �̸�, �޿�, Ŀ�̼�����Ʈ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80 AND SALARY >= 8000;

--�������̵� SA_REP�̰�, Ŀ�̼�����Ʈ�� 0.25�̻��� ������ ���̵�, �̸�, �޿�, Ŀ�̼�����Ʈ�� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP' AND COMMISSION_PCT >= 0.25;

--80�� �μ��� �ٹ��ϰ�, �޿��� 10000�� �̻��� ������ ���̵�, �̸�, �޿�, ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID =80 AND SALARY >= 10000;

--���� = (�޿� + �޿�xĿ�̼�)x12��
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, (SALARY + SALARY*COMMISSION_PCT)*12 ANNUAL_SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80 AND SALARY >= 10000;

--80�� �μ��� �ٹ��ϰ�, 147�� �������� �����ϴ� ��� �߿��� Ŀ�̼��� 0.1�� ������ ���̵�, �̸�, ����, �޿�, Ŀ�̼�����Ʈ�� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, COMMISSION_PCT, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80 
AND MANAGER_ID = 147 
AND COMMISSION_PCT = 0.1;



