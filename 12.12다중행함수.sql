/*
������ �Լ�
    ��ȸ�� ����� ���ձ׷쿡 ����Ǿ� �׷�� �ϳ��� ����� �����ϴ� �Լ���.
        
    * ���ձ׷� : ���̺� ��ü
                �׷�ȭ�� ���̺��� ��(GROUP BY�� ����ϸ� ���̺��� ���� �׷�ȭ �Ҽ� �ִ�.)
    COUNT(*)
        ��ȸ�� ��� ���� ������ ��ȯ�Ѵ�.
    COUNT(�÷���)
        ��ȸ�� �࿡�� ������ �÷��� ���� NULL�� �ƴ� ���� ������ ��ȯ�Ѵ�.
    SUM(�÷���)
        ��ȸ�� �࿡�� ������ �÷� ���� �հ踦 ��ȯ�Ѵ�(NULL�� �����Ѵ�)
    AVG(�÷���)
        ��ȸ�� �࿡�� ������ �÷� ���� ����� ��ȯ�Ѵ�(NULL�� �����Ѵ�)
    MIN(�÷���)
        ��ȸ�� �࿡�� ������ �÷��� �ּҰ��� �հ踦 ��ȯ�Ѵ�(NULL�� �����Ѵ�)
    MAX(�÷���)
        ��ȸ�� �࿡�� ������ �÷��� �ִ밪�� �հ踦 ��ȯ�Ѵ�(NULL�� �����Ѵ�)
        
    ������ �Լ� �ۼ��� ���ǻ���
        - ������ �Լ��� WHERE������ ����Ҽ� ����.
            SELECT *
            FROM EMPLOYEES
            WHERE COUNT(*) > 10  ������!
        - ������ �Լ��� �Ϲ� �÷����� SELECT���� ���� ������ ����.
            SELECT DEPARTMENT_ID, COUNT(*)
            FROM EMPLOYEES;      ������!
            ��, GROUP BY���� ����� �÷����� SELECT���� ������ �մ�.
        - ������ �Լ��� ��ø�� �ѹ��� �Ͽ�ȴ�.
            SELECT TRUNC(ADD_MONTHS(TO_DATE('1980/01/01)), (SYSDATE)) // 3���� ��ø�ȹ�
            FROM DUAL;
*/

-- ���ձ׷��� ���̺���ü��
SELECT COUNT(*)
FROM EMPLOYEES;

-- ���ձ׷��� ��������. �������̺��� �μ� ���̵� ���� �ͳ��� �׷�ȭ ���״�.
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- Ŀ�̼��� �޴� ������ ���� ��ȸ�ϱ�
SELECT COUNT(*)
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES;

-- 60�� �μ��� �Ҽӵ� ������ ��� �޿��� ��ȸ�ϱ�
SELECT AVG(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 80�� �μ��� �Ҽӵ� ������ �޿� ���հ�, ��ձ޿�, �ּұ޿�, �ִ�޿��� ��ȸ�ϱ�
SELECT SUM(SALARY), TRUNC(AVG(SALARY)), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

-- �������� �����ϰ� �ִ� �������̵� �ߺ��� ������ ���� ������ ��ȸ�ϱ�
SELECT COUNT(DISTINCT JOB_ID) -- �ߺ����� �������̵� ��ȸ
FROM EMPLOYEES;

/*
�׷�ȭ�ϱ�
    GROUP BY ���� ����ؼ� ���̺��� ���� ������ �÷��� ���� ���� ���� ������ �ೢ�� �׷�ȭ�� �� �ִ�.
    
    SELECT �÷���1, �÷���2 �׷��Լ�(), �׷��Լ�()
    FROM ���̺��
    [WHERE ���ǽ�]                                      
    [GROUP BY �÷���1, �÷���2, ......]
    [ORDER BY �÷���]
    * GROUP BY������ ���̺��� ���� �׷�ȭ�� �� ������ �Ǵ� �÷��� �����Ѵ�.
    * GROUP BY������ �÷��� �ϳ��̻� ������ �� �ִ�.
    * SELECT���� �÷����� GROUP BY������ ����� �÷���� ������ �÷��� �����ϴ�. 
    * GROUP BY���� ����ϸ� ���̺��� ���� �׷�ȭ�ϰ�, �׷�ȭ�� �� �׷쿡 ������ �Լ��� �����ؼ� �����Ű��
      �������� ��ȯ���� �� �ִ�.
        * �μ��� �ְ�޿�, �����޿�, ��ձ޿�, �޿� ������ ��ȸ�Ҽ� �ִ�.
        * ������ �ְ�޿�, �����޿�, ��ձ޿�, �޿� ����, ���� ���� ���� ��ȸ�� �� �ִ�.
        * �Ի�⵵�� �ְ�޿�, �����޿�, ��ձ޿�, �޿� ����, ���� ���� ���� ��ȸ�� �� �ִ�.
        * �޿���޺� �ְ�޿�, �����޿�, ��ձ޿�, �޿� ����, ���� ���� ���� ��ȸ�� �� �ִ�.

*/ 
 
 -- ������ ������� ��ȸ�ϱ�
 SELECT JOB_ID, COUNT(*)
 FROM EMPLOYEES
 GROUP BY JOB_ID;
 
 -- �μ��� ������� ��ȸ�ϱ�
 SELECT D.DEPARTMENT_NAME, COUNT(*)
 FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
 GROUP BY D.DEPARTMENT_NAME;
 
 -- �ٹ������� ������� ��ȸ�ϱ�
 SELECT L.CITY, COUNT(*)
 FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
 AND D.LOCATION_ID = L.LOCATION_ID
 GROUP BY L.CITY;
 
-- �Ի�⵵�� ������� ��ȸ�ϱ�
SELECT TO_CHAR(HIRE_DATE, 'YYYY'), COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY 1;

-- �μ���, �Ի�⵵�� ������� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY'), COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY 1 ASC, 2ASC;

/*
�׷��Լ� �������� ���͸��ϱ�
    HAVING���� �̿��ϸ� �׷��Լ� �������� ���͸� �Ҽ� �ִ�.
    
    SELECT �÷���, �׷��Լ�()
    FROM ���̺�� 
    [WHERE ���ǽ�]
    [GROUP BY �÷���]
    [HAVING ���ǽ�] -- GROUP BY �������� �ݵ�ÿ;��Ѵ�.
    [ORDER BY �÷���]
    *HAVING ���� GROUP BY���� �Բ� ���ȴ�.
    *WHERE ���� ���ǽĿ��� �׷��Լ��� ����Ҽ� ������, HAVING���� ���ǽĿ��� �׷��Լ��� ����Ҽ� �ִ�.
*/

-- �μ��� �������� ��ȸ���� �� �������� 10�� �̻��� �μ��� ���̵�� �������� ��ȸ�ϱ�(HAVING)
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 20;

-- 2005�� ������ �Ի��� �������� �μ����� �������� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE < '2005/01/01'
GROUP BY DEPARTMENT_ID;

-- 2005�� ������ �Ի��� �������� �μ����� �������� ��ȸ������ �������� 5���̻��κμ����̵�� �������� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE < '2005/01/01'
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 5;


























