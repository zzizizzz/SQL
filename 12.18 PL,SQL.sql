/*
PL/SQL
    Procedural Language extension to SQL�Ǿ��ڴ�
    * Procedural Language�� ������ ���α׷��� ����.
      ������ ���α׷��� ���� �������� , ����ó��(IF), �ݺ�ó��(LOOP, WHILE, FOR)���� �����Ѵ�.
    * SQL�� ������ ���α׷��� ���� Ȯ�� ��Ų ���̴�.

    Ư¡
        * DBMS ���ο��� ����Ǵ� ������ ���α׷��̴�.
        * BEGIN/END �� ��� ������ ���α׷��� ���ȭ�Ѵ�.
        * ���ǹ�, �ݺ����� ����ؼ� �������� SQL�۾��� ������ �� �ִ�.
    ���� 
        ���ν���(Procedure)
            * Ư�� �۾��� �����ϴ� �̸��ִ� PL/SQL ����̴�.
            * �Ű������� ���� �� �ְ�, �����Ҽ� �ִ� PL/SQL ����̴�.
            * ���Ӽ��� ������ �۾� Ȥ�� ����ܰ谡 ������ Ʈ�����(SQL�۾�)�� �����ϱ� ���ؼ� ����Ѵ�.
        �Լ�(Function)
            * ���ν����� �����ϰ� PL/SQL�� �̿��ؼ� �Ϸ��� SQL �۾��� ó���ϰ�, �� ó������� 
              ���ϰ����� ��ȯ�ϴ� PL/SQL ���α׷��̴�. 
        Ʈ����(Trigger)
            * Ư�� ���̺� �������� �߰�/����/���� ���� �����ͺ��� �̺�Ʈ�� �߻��ϸ�
              DBMS���� �ڵ����� ���� �ǵ��� PL/SQL�� ������ ���α׷��̴�.
        
*/

/*
���ν���

����
    CREATE OR REPLACE PROCEDURE ���ν�����
    (������ IN ������Ÿ��,
     ������ IN ������Ÿ��,
     ������ OUT ������Ÿ��,....)
     IS
            --��������
            ������ ������Ÿ��;
            ������ ������Ÿ�� :=��;
        BEGIN 
            SQL ���� Ȥ�� PL/SQL �����
            ...
        END;
*/
/*
CREATE OR REPLACE PROCEDURE TEST
(NO IN NUMBER,
 AMOUNT IN NUMBER,
 MESSAGE OUT VARCHAR2)
 IS 
 
 BEGIN
    MESSAGE :='����Ϸ�';
END;

DECLARE 
    STR VARCHAR2(100);
BEGIN
    TEST(10, 1000, STR);
    --STR�� ���ν����� ������ ���� ���޹��� �� �ִ�.
    DBMS_OUTPUT.PUT_LINE(STR);
END;
*/

/*
    ���� ���̵� ���� �޾Ƽ� ������ �޿��� �λ��Ű�� ���ν��� �ۼ��ϱ�
    �λ����� �޿��� ���� �ٸ���.
        20000�̻� 10% �λ�
        10000�̻� 15%�λ�
        �� �ܴ� 20%�λ�
        
    public void updateSalary(int empId) {
        Employee emp = empRepository.getEmployeeById(empId);
        double salary = emp.getSalary();
        double increaseRate = 0.0;
        
        if(salary >=20000) {
                increaseRate = 0.1;
            } else if(salary >= 10000) {
                increaseRate = 0.15;
            } else {
                increaseRate = 0.20;
            }
            
            double increaseSalary = salary * increaseRate;
            
            emp.setSalary(salary + increaseSalary);
            emp.Repository.updateEmployee(emp);
            }
*/

CREATE OR REPLACE PROCEDURE UPDATE_SALARY
    --�Ű����� �����ϱ�
(I_EMP_ID IN NUMBER)
IS
    --���� �����ϱ�
    V_EMP_SALARY        EMPLOYEES.SALARY%TYPE;    --EMPLOYEES���̺��� SALARY�÷��� Ÿ�԰� ������ Ÿ��
    V_INCREASE_RATE     NUMBER(3,2);
BEGIN
    --�Ű������� ���޹��� �������̵�� ������ �޿��� ��ȸ�ϰ�, ������ �����ϱ�
    SELECT SALARY
    INTO V_EMP_SALARY              --SELECT �Ѱ� INTO�� ��´�.
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = I_EMP_ID;
    
    --������ �޿��� ���� �λ�� �����ϰ� ������ �����ϱ�
    IF V_EMP_SALARY >= 20000    THEN V_INCREASE_RATE := 0.1;
    ELSIF V_EMP_SALARY >= 10000 THEN V_INCREASE_RATE := 0.15;
    ELSE V_INCREASE_RATE := 0.2;
    END IF;
    
    -- �޿��� �λ� ��Ű��
    UPDATE EMPLOYEES
    SET 
        SALARY = SALARY + TRUNC(SALARY*V_INCREASE_RATE)
    WHERE 
        EMPLOYEE_ID = I_EMP_ID;
    
    --������ ���̽��� ���������� �ݿ���Ű��
    COMMIT;
    
        
    
END;

EXECUTE UPDATE_SALARY(101);











