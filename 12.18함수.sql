/*
�Լ�

����
    CREATE OR REPLACE FUNCTION �Լ���
    (������ IN ������Ÿ��,
     ������ IN ������Ÿ��,.....)
     -- �Լ��� ��ȯ�ϴ� ��ȯ���� Ÿ���� �����Ѵ�.
     RETURN ������Ÿ��
     IS
        ������ ����Ÿ��;
    BEGIN
        PL/SQL����;
        
        --���� ��ȯ�ϴ� ������ �ݵ�� �־����.
        RETURN ��ȯ��;
    END;
*/

// �μ����̵� ���޹޾Ƽ� ������� ��ȯ�ϴ� �Լ�
CREATE OR REPLACE FUNCTION GET_EMP_COUNT
(I_DEPT_ID IN NUMBER)
RETURN NUMBER

IS
    V_EMP_CNT NUMBER(3,0);
BEGIN
    SELECT COUNT(*)
    INTO V_EMP_CNT
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = I_DEPT_ID;
        
    RETURN V_EMP_CNT;
END;
