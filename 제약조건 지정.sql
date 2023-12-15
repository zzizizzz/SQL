/*
�������� �����ϱ�
*/


/*
    �������� �����ϴ� ���̺� �����ϱ�
    
    �÷����� 
        ����ȣ        PRIMARY KEY
        �����̵�       NOT NULL, UNIQUE
        ���̸�        NOT NULL
        ����й�ȣ      NOT NULL
        ���̸���       UNIQUE
        ������ó       NOT NULL
        ������        CHECK
        �����ȣ
        �ּ�1
        �ּ�2
        Ż�𿩺�        CHECK
        �����
        ����������        
*/
CREATE TABLE SAMPLE_CUSTOMERS(
    NO          NUMBER(4),
    ID          VARCHAR2(100)   CONSTRAINT CUST_ID_NN NOT NULL,
    NAME        VARCHAR2(100)   CONSTRAINT CUST_NAME_NN NOT NULL,
    PASSWORD    VARCHAR2(100)   CONSTRAINT CUST_PWD_NN NOT NULL,
    EMAIL       VARCHAR2(255),
    TEL         VARCHAR2(100)   CONSTRAINT CUST_TEL_NNO NOT NULL,
    GENDER      CHAR(1),
    POSTAL_CODE VARCHAR2(20),
    ADDRESS1    VARCHAR2(255),
    ADDRESS2    VARCHAR2(255),
    DELETED     CHAR(1)         DEFAULT 'N',
    REG_DATE    DATE            DEFAULT SYSDATE,
    UPDATE_DATE DATE            DEFAULT SYSDATE,
    
    CONSTRAINT CUST_NO_PK PRIMARY KEY(NO),
    CONSTRAINT CUST_ID_UK UNIQUE (ID),
    CONSTRAINT CUST_EMAIL_UK UNIQUE (EMAIL),
    CONSTRAINT CUST_GENDER_CK CHECK (GENDER IN ('F', 'M')),
    CONSTRAINT CUST_DELETED_CK CHECK (DELETED IN ('Y','N'))
);

CREATE SEQUENCE CUSTOMERS_SEQ
START WITH 1000
NOCACHE;
-- ���� �̼���(101)�� �� ����ϸ� �����ʹ� ������� ������ �������� ������ �ȴ�.
-- ���� ȫ�浿�� �����ϸ� 103������ ����̵ȴ�.
INSERT INTO SAMPLE_CUSTOMERS
(NO, ID, NAME, PASSWORD, TEL, GENDER)
VALUES
(CUSTOMERS_SEQ.NEXTVAL, 'LEE', '�̼���', 'zxcv1234','010-3333-5555','M');




