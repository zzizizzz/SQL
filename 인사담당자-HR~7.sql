/*
��ü ����

 ���δ���� �Ǵ� ���̺��� ���� ���̺��϶� �߻��ϴ� �����̴�.
 ���� ���̺��� �����ϱ� ������,���� ���� ����� ��Ī�� ���ϰ�, �� ���ҿ� �°� ���������� �����ؾ��Ѵ�.
 ���� ���̺��� �����ϱ� ������ ��ȸ�ϴ� �÷����� ������ ��찡 ������ ��Ī�� ���̴� ���� ����.
 
*/

-- �������̺��� �������̵�, �����̸�, �ش������� �����̵�,  ����̸��� ��ȸ�ϱ�
--             E(����)     E(����) E(����)-MANAGER_ID   
--                               E(���)-EMPLOYEE_ID  E(���)

-- ��ü�� �����ϴ°��� �ƴϰ� ������ �Ŵ������̵�� �����ڿ� ���� ���̵��̴�.
SELECT EMP.EMPLOYEE_ID AS EMP_ID,
       EMP.FIRST_NAME  AS EMP_NAME,
       MGR.EMPLOYEE_ID  AS MGR_ID,
       MGR.FIRST_NAME   AS MGR_NAME
FROM EMPLOYEES EMP, EMPLOYEES MGR
WHERE EMP.MANAGER_ID = MGR.EMPLOYEE_ID;

SELECT P.NAME ����, C.NO ��ǰ��ȣ, C.NAME ��ǰ��
FROM PRODUCTS C, PRODUCTS p
WHERE C.PNO IS NOT NULL
AND C.PNO = P.NO;

-- �������̵�, �����̸�, ������ �ҼӺμ���, ����� ���̵�, ����� �̸�, ����� �ҼӺμ���
--   E        E                       E
--                     D1
--                                    M              M          
--                                                               D2                                                       
--����                                  ������ �ҼӺμ�        ���                          ����� �ҼӺμ�
--[102 ȫ�浿 100 60]                -   [  60-IT]        [100 ������ NULL  90]           [90-EXECUTIVE]

SELECT E.EMPLOYEE_ID        AS EMP_ID,
       E.FIRST_NAME         AS EMP_NAME,
       ED.DEPARTMENT_NAME   AS EMP_DEPT_NAME,
       M.EMPLOYEE_ID        AS MGR_ID,
       M.FIRST_NAME         AS MGR_NAME,
       MD.DEPARTMENT_NAME   AS MGR_DEPT_NAME
FROM EMPLOYEES E,       --���� 
     EMPLOYEES M,       -- ������
     DEPARTMENTS ED,    --������ �ҼӺμ�
     DEPARTMENTS MD     -- ������ �ҼӺμ�
WHERE E.DEPARTMENT_ID = ED.DEPARTMENT_ID(+)  --������ ������ �ҼӺμ� ����
AND E.MANAGER_ID = M.EMPLOYEE_ID(+)           --������ �Ŵ��� ����
AND M.DEPARTMENT_ID = MD.DEPARTMENT_ID(+);      -- �Ŵ����� �Ŵ����� �ҼӺμ� ����










