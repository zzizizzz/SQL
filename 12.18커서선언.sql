// �μ����̵� ���޹޾Ƽ� �ش� �μ��� �� ������ ��ȯ�ϴ� �Լ�
CREATE OR REPLACE FUNCTION GET_TOTAL_DEPT_SALARY
(I_DEPT_ID IN NUMBER)
RETURN NUMBER
IS
    V_TOTAL_SALARY  NUMBER :=0;
    V_SALARY        EMPLOYEES.SALARY%TYPE;
    V_COMM          EMPLOYEES.COMMISSION_PCT%TYPE;
    V_ANNUAL_SALARY EMPLOYEES.SALARY%TYPE;
    
    -- Ŀ�� ����
    -- Ŀ���� SELECT���� ������ ��ȯ�Ǵ� ������� �����ϴ� �޸� ������ �����ϴ� ����������.
    -- EMP_LIST�� SELECT�� �������� ��� �ִ�.
    CURSOR EMP_LIST IS
    SELECT SALARY, NVL(COMMISSION_PCT, 0) COMM
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = I_DEPT_ID;
BEGIN
    -- Ŀ��(EMP_LIST)�� ��� �ִ� ���������� FOR���� ����ؼ� �� ���� ������.
    -- EMP�� EMP_LIST�� ��� �ִ� ���������� �ϳ��� ����Ǵ� ������.
    FOR EMP IN EMP_LIST LOOP
        V_SALARY := EMP.SALARY;
        V_COMM   := EMP.COMM;
        V_ANNUAL_SALARY :=V_SALARY*12 + TRUNC(V_SALARY*V_COMM)*12;
        V_TOTAL_SALARY := V_TOTAL_SALARY + V_ANNUAL_SALARY;
    END LOOP;
    
    RETURN V_TOTAL_SALARY;

END;


















