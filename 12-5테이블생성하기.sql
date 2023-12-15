/*
    ���̺� �����ϱ�
    
    CREATE TABLE ���̺��(
        �÷��� ������Ÿ�� ��������,
        �÷��� ������Ÿ��,
        �÷��� ������Ÿ��(������),
        �÷��� ������Ÿ�� DEFAULT �⺻��
    
    );
*/

/*
        CREATE TABLE
            ���̺��� ������Ű�� SQL��ɾ��.
            SAMPLE_BOOKS
             ���� ������ ���̺��� �̸��̴�.
             BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE,
             BOOK_STOCK, BOOK_REG_DATE
             ���� ������ ���̺��� �÷��̸��̴�.
            NUMBER 
                �ش� �÷��� ������Ÿ���� ���������� �����Ѵ�.
            VARCHAR2
                �ش� �÷��� ������ Ÿ���� ���� ���̹��������� �����Ѵ�.
            DATE
                �ش� �÷��� ������ Ÿ���� ��¥������ �����Ѵ�. 
            PRIMARY KEY 
                �ش� �÷��� ���̺��� ���� �ĺ��ϱ� ���� ���� ������ �⺻Ű �÷����� �����Ѵ�.
                �ش� �÷��� NULL�� ������� ������, ���� ���̺� ��ü���� �����ϴ�.
            NOTNULL
                �ش� �÷��� NULL�� ���¸� ���� �� ����.
            DEFAULT10
                ���ο� ���� �߰��Ҷ� �ش� �÷��� ���� �������� ������ 10�� �⺻������ ����ȴ�,
            DEFAULT SYSDATE
                ���ο� ���� �߰� �Ҷ� �ش�Į���� �������� ������ �ý����� ���� ��¥�� ����ȴ�.

*/



CREATE TABLE SAMPLE_BOOKS (
    BOOK_NO       NUMBER(6) PRIMARY KEY,
    BOOK_TITLE    VARCHAR2(255) NOT NULL,
    BOOK_WRITER   VARCHAR2(255),
    BOOK_PRICE    NUMBER (7,0) NOT NULL,
    BOOK_STOCK    NUMBER (3,0) DEFAULT 10,
    BOOK_REG_DATE DATE DEFAULT SYSDATE
    );
    
    
    
    /*
        ���̺� �ű� �� �߰��ϱ�
        
        INSERT INTO ���̺��(�÷���, �÷���, �÷���)
        VALUES              (��,    ��,     ��);
        * �ű� ���� �߰� �� �� ���� ����� �÷��� ���� �����ϴ� ����̴�.
        * ������ �÷����� NULL ���� ����ǰų�,�⺻���� ����ȴ�.
        * ���̺��� �÷� ������ ������� ������ �÷��� ���� ������ ���� �����Ѵ�.
        * ���� ����ȯ�濡���� �̹���� ����Ѵ�.
        
        INSERT INTO ���̺��
        VALUES (��, ��, ��, ��, ��,);
        * �ű� ���� �߰� �Ҷ� �÷����� �����ϴ� ����̴�.
        * �ű����� ��� �÷��� ���ؼ� ���� �����ؾ��Ѵ�.
          (������ ���� ������ NULL�� ��������� ���´�.)
        * ���̺��� �÷������� ������ ������ ���� �����ؾ��Ѵ�.
    */
    
    --�ű� å���� �߰��ϱ�
    INSERT INTO SAMPLE_BOOKS
    (BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE)
    VALUES
    (10,'�ڹ��� ����', '���ü�', 32000);
    
    INSERT INTO SAMPLE_BOOKS
    (BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE, BOOK_STOCK)
    VALUES
    (12, '�̰��� �ڹٴ�', '�ſ��',35000, 25);
    
    INSERT INTO SAMPLE_BOOKS
    VALUES(14, '����Ƽ�� �ڹ�', '����ö', 18000, 10, SYSDATE);
    
    INSERT INTO SAMPLE_BOOKS
    VALUES(20, '�ڹ��� ��', '���º�', 32000,11,SYSDATE);
    
    select book_title from sample_books;
-- INSERT ������ �������� �����ͺ��̽��� ���������� �����Ų��.
    COMMIT;
    
/*
    ������ �����ϱ�
    
    UPDATE ���̺��
    SET
        �÷��� = ���氪;
        �÷��� = ���氪;
        ....
        [WHERE ���ǽ�]
        * ���̺��� ������ �÷��� ���� ���氪���� �����Ų��.
        * WHERE���� �����ϸ� ���̺��� ��� �࿡ ���ؼ� ������ �÷��� ���� ����ȴ�.
        * WHERE���� �ִ� ��� ���ǽ��� �����ϴ� �࿡ ���ؼ��� ������ �÷��� ���� ����ȴ�.
*/

-- ���� ���̺��� å��ȣ�� 10�� å�� �������� 9������ �����ϱ�
UPDATE SAMPLE_BOOKS
SET
    BOOK_STOCK = 9
WHERE BOOK_NO = 10;

-- �������̺��� å��ȣ�� 12�� å�� ������ 10%�����ϰ�, �������� 1���ҽ�Ų��.
UPDATE SAMPLE_BOOKS
SET
    BOOK_PRICE = BOOK_PRICE*0.9,
    BOOK_STOCK = BOOK_STOCK - 1
WHERE BOOK_NO = 12;

-- ���� ���̺� ���� ���������� ������ ���̽��� ���������� �ݿ��ȴ�.
COMMIT;

/*
    ���̺��� �� �����ϱ�
    
    DELETE FROM ���̺��
    [WHERE ���ǽ�]
    
    * WHERE���� �����ϸ� ���̺��� ��� ���� �����ȴ�.
    * WHERE���� ������ ���ǽ��� �����ϴ� �ุ �����ȴ�.
    * WHERE���� ���ǽ��� ������ Ư�� �� �ϳ��� �����ǵ��� ���ǽ��� �ۼ�����.
        (Ư�� �� �ϳ��� �����ǵ��� �ϱ� ���ؼ��� ���ǽ��� �ش� ���̺��� 
         �⺻Ű ���������� ����� �÷��� �˻��������� ���Ǿ�� �Ѵ�.)
    ���̺� �����ϱ� - ���� ���̺� ���·� �ǵ����°�
    TRUNCATE TABLE ���̺��;
    
    * ���̺��� �����͸� ���� �����ϰ�, ����ϰ� �ִ� ������ �ݳ��Ѵ�.
    * ���� ���̺� ���������� ������ ���°� �ȴ�.
    
*/

-- ���� ���̺��� å��ȣ�� 10�� å����(��)�� �����ϱ�
DELETE FROM SAMPLE_BOOKS
WHERE BOOK_NO = 10;

-- ���� ���̺� ��� ������ �����ϱ�
TRUNCATE TABLE SAMPLE_BOOKS;
-------------------------------------------------------------------
-- �������� �����ϴ� ���� ���̵� �ߺ����� ���� ��ȸ�ϱ�
SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

-- �ٸ� �����鿡�� ���� �޴� �Ŵ������� ���̵� �ߺ����� ���� ��ȸ�ϱ�
SELECT DISTINCT MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL;

-- ������ ������ ������ ���̵�, �̸�, ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- Ŀ�̼��� �޴� ������ �߿��� �޿��� 10000�޷� �̻� �޴� ������ ���̵�, �̸�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
AND SALARY >= 10000;

-- 2004�⵵�� ������ ����� ������ ���̵�, �ش� ������ ���� ������, ������, �������̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID
FROM JOB_HISTORY
WHERE START_DATE BETWEEN '2004/01/01' AND '2004/12/31';


-- �ѹ��̶� ������ ����� ���� �ִ� �������� ���� ���̵� �ߺ����� ��ȸ�ϱ�
SELECT DISTINCT EMPLOYEE_ID
FROM JOB_HISTORY;

-- ���� �߿��� 100�� ��翡�� �����ϰ�, Ŀ�̼��� ������, �޿��� 10000�޷� �̻� �޴� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE MANAGER_ID = 100
AND COMMISSION_PCT IS NOT NULL
AND  SALARY >= 10000;

-- ���� �߿��� 2006�� ��ݱ⿡ �Ի��� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϰ�, �Ի��� ������ �������� �����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM employees
WHERE HIRE_DATE >= '2006-01-01' AND HIRE_DATE <'2006/07/01'
ORDER BY HIRE_DATE ASC;

-- ���� �߿��� �ҼӺμ��� 50, 60, 80�� �μ� ���� �ϳ��� ���ϰ�, 100�� �������� �����ϴ� ������ ���̵�, �̸�, �������̵�, �μ����̵� ��ȸ�ϱ�
 SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID
 FROM EMPLOYEES
 WHERE MANAGER_ID = 100
 AND DEPARTMENT_ID IN (50,60,80);

-- ���� �߿��� �������̵�  'CLERK'�� ������, �޿��� 2000�� �̻� �޴� ������ ���̵�, �̸�, �޿�, �������̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE '%CLERK'
AND SALARY > 2000;

-- �μ� ������ �������� �Ϻ��� ��ġ�ϰ� �ִ� �������� ���̵�, �ּ�, �����ȣ, ���ø��� ��ȸ�ϱ�
SELECT LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY
FROM LOCATIONS
WHERE COUNTRY_ID = 'JP';

-- �μ� ������ �������� �����ȣ�� ������ �������� ���̵�, �ּ�, ���ø��� ��ȸ�ϱ�
SELECT LOCATION_ID , STREET_ADDRESS, CITY
FROM LOCATIONS
WHERE POSTAL_CODE IS NULL;

-- ���� �߿��� �̸��� 'S'�� �����ϴ� ������ ���̵�, �̸��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%';

-- 50�� �μ��� �Ҽӵ� �������� �������̵�, �̸�, �޿��� ��ȸ�ϰ� �޿������� �������� �����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
ORDER BY SALARY ASC;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    