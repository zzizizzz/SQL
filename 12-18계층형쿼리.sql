/*
������ ����
    ���̺� ������ �����Ͱ� �����ϴ� ��� �� �����͸� ��ȸ�ϱ� ���ؼ� ����ϴ� ������.
    * ������ �����Ͷ� ������ ���̺� ���������� ������ ���� ������ ���Ե� �����ʹ�.
    * ����) �������̺� ����� ������
           ������ ���̺��� ���������� ��������
           �޴����̺��� �����޴��� �����޴�
           ī�װ����̺��� ����ī�װ��� �Ͽ�ī�װ�
           
    ����
        SELECT �÷���, �÷���, ....
        FROM ���̺��
        [WHERE ���ǽ�]
        START WITH ���ǽ�
        CONNECT BY PRIOR���ǽ�,
        
         * START WITH : ���� �˻��� ���۽����� �����Ѵ�.
         * CONNECT BY : �θ���� �ڽ��� ���� ���谡 �ִ� �÷��� �����Ѵ�.
            CONNECT BY PRIOR    �θ�Ű(�⺻Ű) = �ڽ�Ű(�ܷ�Ű) 
                ������������ �θ� -> �ڽ� �������� �������� ������ �˻�
            CONNECT BY PRIOR    �ڽä�Ű(�ܷ�Ű) = �θ�Ű(�⺻Ű)
                ������������ �ڽ� -> �θ� �������� �ö󰡴� ������ �˻�
*/
-- ������ �˻�
-- 101�� ������ ���� ������ �˻��ϱ�
SELECT LEVEL, 
        LPAD(' ', 4*(LEVEL-1), ' ') || EMPLOYEE_ID, 
        FIRST_NAME, 
        MANAGER_ID
FROM EMPLOYEES
START WITH EMPLOYEE_ID = 101      -- 101�� ������ ���������̴�.
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;

-- ������ �˻�
-- 206�� ������ �������� ��ȸ�ϱ�
SELECT LEVEL,
       EMPLOYEE_ID,
       FIRST_NAME,
       MANAGER_ID
FROM EMPLOYEES
START WITH EMPLOYEE_ID = 206
CONNECT BY PRIOR MANAGER_ID = EMPLOYEE_ID;

-- ���ӵ� ���ڸ� �����
SELECT LEVEL
FROM DUAL
CONNECT BY LEVEL <= 10;

-- 1�� ~ 12������ ���ӵ� ���� �����
SELECT LPAD(LEVEL, 2, '0') MONTH
FROM DUAL
CONNECT BY LEVEL <= 12;

-- Ư�� �Ⱓ ������ ��¥ �����ϱ�
 SELECT TO_DATE('2023-11-01') + LEVEL -1 
 FROM DUAL
 CONNECT BY LEVEL < TO_DATE ('2023-12-31') - TO_DATE ('2023-11-02') + 1;
 
 -- 2003�� �Ի��� �������� ���� �Ի��� ���ڸ� ��ȸ�ϱ�
 SELECT TO_CHAR(HIRE_DATE, 'MM'), COUNT(*)
 FROM EMPLOYEES
 WHERE HIRE_DATE >= '2003/01/01' AND HIRE_DATE <'2004/01/01'
 GROUP BY TO_CHAR(HIRE_DATE, 'MM');
 
 SELECT A.MONTH,NVL(B.CNT, 0) CNT
 FROM A,B
 WHERE  A.MONTH = B.MONTH(+);
 
 A :
 SELECT LPAD(LEVEL, 2,0)
 FROM DUAL
 CONNECT BY LEVEL <= 12;

B : 
SELECT TO_CHAR(HIRE_DATE, 'MM'), COUNT(*) CNT
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2003'
GROUP BY TO_CHAR(HIRE_DATE, 'MM');

 SELECT A.MONTH,NVL(B.CNT, 0) CNT
        FROM (SELECT LPAD (LEVEL, 2,'0') MONTH
        FROM DUAL 
        CONNECT BY LEVEL <=12) A,
        (SELECT TO_CHAR(HIRE_DATE, 'MM') MONTH, COUNT(*) CNT
        FROM EMPLOYEES
        WHERE TO_CHAR (HIRE_DATE, 'YYYY') = '2003'
        GROUP BY TO_CHAR (HIRE_DATE, 'MM')) B
WHERE  A.MONTH = B.MONTH(+)
ORDER BY A.MONTH;
 
 



