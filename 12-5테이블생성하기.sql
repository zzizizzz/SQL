/*
    테이블 생성하기
    
    CREATE TABLE 테이블명(
        컬럼명 데이터타입 제약조건,
        컬럼명 데이터타입,
        컬럼명 데이터타입(사이즈),
        컬럼명 데이터타입 DEFAULT 기본값
    
    );
*/

/*
        CREATE TABLE
            테이블을 생성시키는 SQL명령어다.
            SAMPLE_BOOKS
             새로 생성한 테이블의 이름이다.
             BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE,
             BOOK_STOCK, BOOK_REG_DATE
             새로 생성한 테이블의 컬럼이름이다.
            NUMBER 
                해당 컬럼의 데이터타입을 숫자형으로 저장한다.
            VARCHAR2
                해당 컬럼의 데이터 타입을 가변 길이문자형으로 저장한다.
            DATE
                해당 컬럼의 데이터 타입을 날짜형으로 저장한다. 
            PRIMARY KEY 
                해당 컬럼은 테이블에서 행의 식별하기 위한 값을 가지는 기본키 컬럼으로 저장한다.
                해당 컬럼은 NULL을 허용하지 않으며, 값은 테이블 전체에서 고유하다.
            NOTNULL
                해당 컬럼의 NULL인 상태를 가질 수 없다.
            DEFAULT10
                새로운 행을 추가할때 해당 컬럼에 값을 지정하지 않으면 10이 기본값으로 저장된다,
            DEFAULT SYSDATE
                새로운 행을 추가 할때 해당칼럼에 지정하지 않으면 시스템의 현재 날짜가 저장된다.

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
        테이블 신규 행 추가하기
        
        INSERT INTO 테이블명(컬럼명, 컬럼명, 컬럼명)
        VALUES              (값,    값,     값);
        * 신규 행을 추가 할 때 값이 저장될 컬럼을 직접 나열하는 방식이다.
        * 생략된 컬럼에는 NULL 값이 저장되거나,기본값이 저장된다.
        * 테이블의 컬럼 순서와 상관없이 지정된 컬럼과 같은 순서로 값을 지정한다.
        * 실제 개발환경에서는 이방식을 사용한다.
        
        INSERT INTO 테이블명
        VALUES (값, 값, 값, 값, 값,);
        * 신규 행을 추가 할때 컬럼명을 생략하는 방식이다.
        * 신규행의 모든 컬럼에 대해서 값을 지정해야한다.
          (저장할 값이 없으면 NULL을 명시적으로 적는다.)
        * 테이블의 컬럼순서와 동일한 순서로 값을 지정해야한다.
    */
    
    --신규 책정보 추가하기
    INSERT INTO SAMPLE_BOOKS
    (BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE)
    VALUES
    (10,'자바의 정석', '남궁성', 32000);
    
    INSERT INTO SAMPLE_BOOKS
    (BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE, BOOK_STOCK)
    VALUES
    (12, '이것이 자바다', '신용균',35000, 25);
    
    INSERT INTO SAMPLE_BOOKS
    VALUES(14, '이펙티브 자바', '심재철', 18000, 10, SYSDATE);
    
    INSERT INTO SAMPLE_BOOKS
    VALUES(20, '자바의 꿈', '이태복', 32000,11,SYSDATE);
    
    select book_title from sample_books;
-- INSERT 구문의 실행결과를 데이터베이스에 영구적으로 저장시킨다.
    COMMIT;
    
/*
    데이터 수정하기
    
    UPDATE 테이블명
    SET
        컬럼명 = 변경값;
        컬럼명 = 변경값;
        ....
        [WHERE 조건식]
        * 테이블에서 지정된 컬럼의 값을 변경값으로 변경시킨다.
        * WHERE절을 생략하면 테이블의 모든 행에 대해서 지정된 컬럼의 값이 변경된다.
        * WHERE절이 있는 경우 조건식을 만족하는 행에 대해서만 지정된 컬럼의 값이 변경된다.
*/

-- 도서 테이블에서 책번호가 10인 책의 재고수량을 9권으로 변경하기
UPDATE SAMPLE_BOOKS
SET
    BOOK_STOCK = 9
WHERE BOOK_NO = 10;

-- 도서테이블에서 책번호가 12이 책의 가격을 10%할인하고, 재고수량을 1감소시킨다.
UPDATE SAMPLE_BOOKS
SET
    BOOK_PRICE = BOOK_PRICE*0.9,
    BOOK_STOCK = BOOK_STOCK - 1
WHERE BOOK_NO = 12;

-- 도서 테이블에 대한 수정사항이 데이터 베이스에 영구적으로 반영된다.
COMMIT;

/*
    테이블의 행 삭제하기
    
    DELETE FROM 테이블명
    [WHERE 조건식]
    
    * WHERE절을 생략하면 테이블의 모든 행이 삭제된다.
    * WHERE절이 있으면 조건식을 만족하는 행만 삭제된다.
    * WHERE절의 조건식은 언제나 특정 행 하나만 삭제되도록 조건식을 작성하자.
        (특정 행 하나만 삭제되도록 하기 위해서는 조건식은 해당 테이블에서 
         기본키 제약조건이 적용된 컬럼이 검색조건으로 사용되어야 한다.)
    테이블 절단하기 - 최초 테이블 상태로 되돌리는거
    TRUNCATE TABLE 테이블명;
    
    * 테이블의 데이터를 전부 삭제하고, 사용하고 있던 공간을 반납한다.
    * 최초 테이블 생성시점과 동일한 상태가 된다.
    
*/

-- 도서 테이블에서 책번호가 10인 책정보(행)을 삭제하기
DELETE FROM SAMPLE_BOOKS
WHERE BOOK_NO = 10;

-- 도서 테이블 모든 데이터 절단하기
TRUNCATE TABLE SAMPLE_BOOKS;
-------------------------------------------------------------------
-- 직원들이 수행하는 직종 아이디를 중복없이 전부 조회하기
SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

-- 다른 직원들에게 보고 받는 매니저들의 아이디를 중복없이 전부 조회하기
SELECT DISTINCT MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL;

-- 보고할 상사없는 직원의 아이디, 이름, 직종를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 커미션을 받는 직원들 중에서 급여를 10000달러 이상 받는 직원의 아이디, 이름, 급여, 커미션을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
AND SALARY >= 10000;

-- 2004년도에 직종이 변경된 직원의 아이디, 해당 직종의 업무 시작일, 종료일, 직종아이디를 조회하기
SELECT EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID
FROM JOB_HISTORY
WHERE START_DATE BETWEEN '2004/01/01' AND '2004/12/31';


-- 한번이라도 직종이 변경된 적이 있는 직원들의 직원 아이디를 중복없이 조회하기
SELECT DISTINCT EMPLOYEE_ID
FROM JOB_HISTORY;

-- 직원 중에서 100번 상사에게 보고하고, 커미션을 받으며, 급여를 10000달러 이상 받는 직원의 아이디, 이름, 직종아이디, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE MANAGER_ID = 100
AND COMMISSION_PCT IS NOT NULL
AND  SALARY >= 10000;

-- 직원 중에서 2006년 상반기에 입사한 직원의 아이디, 이름, 입사일을 조회하고, 입사일 순으로 오름차순 정렬하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM employees
WHERE HIRE_DATE >= '2006-01-01' AND HIRE_DATE <'2006/07/01'
ORDER BY HIRE_DATE ASC;

-- 직원 중에서 소속부서가 50, 60, 80번 부서 중의 하나에 속하고, 100번 직원에게 보고하는 직원의 아이디, 이름, 직종아이디, 부서아이디를 조회하기
 SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID
 FROM EMPLOYEES
 WHERE MANAGER_ID = 100
 AND DEPARTMENT_ID IN (50,60,80);

-- 직원 중에서 직종아이디가  'CLERK'로 끝나고, 급여를 2000불 이상 받는 직원의 아이디, 이름, 급여, 직종아이디를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE '%CLERK'
AND SALARY > 2000;

-- 부서 소재지 정보에서 일본에 위치하고 있는 소재지의 아이디, 주소, 우편번호, 도시명을 조회하기
SELECT LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY
FROM LOCATIONS
WHERE COUNTRY_ID = 'JP';

-- 부서 소재지 정보에서 우편번호라 누락된 소재지의 아이디, 주소, 도시명을 조회하기
SELECT LOCATION_ID , STREET_ADDRESS, CITY
FROM LOCATIONS
WHERE POSTAL_CODE IS NULL;

-- 직원 중에서 이름이 'S'로 시작하는 직원의 아이디, 이름을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%';

-- 50번 부서의 소속된 직원들의 직원아이디, 이름, 급여를 조회하고 급여순으로 오름차순 정렬하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
ORDER BY SALARY ASC;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    