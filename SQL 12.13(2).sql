/*
������
    �Ϸù�ȣ�� �����ϴ� ����Ŭ��ü��  
    
    �����ϱ�
        CREATE SEQUENCE ��������;
    �����ϱ�
        DROP SEQUENCE ��������;
    �����ϱ�
      ALTER SEQUENCE ��������;
      
    ������ ���� ����
      CREATE TABLE ��������
       *���۰� : 1, ����ġ : 1 , �ּҰ� : 1 �ִ밪:9999999999999999999 
       *ĳ�û����� : 20
       
       CREATE SEQUENCR �������� 
         START WITH 1000
         INCREMENT BY 100
         NOCACHE;
         *���۰� : 1000, ����ġ : 100, �ּҰ� : 1 �ִ밪:9999999999999999999 
         *ĳ�û������ ����
*/
-- ���ο� ������ �����ϱ�
CREATE SEQUENCE BOOKS_SEQ;

-- �� �Ϸù�ȣ ��ȸ�ϱ�
SELECT BOOKS_SEQ.NEXTVAL
FROM DUAL;

-- INSERT �������� ������ Ȱ���ϱ�
INSERT INTO SAMPLE_BOOKS
(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE)
VALUES
(BOOKS_SEQ.NEXTVAL, '������ Ȱ���ϱ�', 'ȫ�浿', 10000);












