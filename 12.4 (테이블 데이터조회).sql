
/*
    테이블의 데이터 조회
    
    1. 지정된 테이블의 모든 행, 모든 열을 조회한다.
    SELECT *
    FROM테이블명;
    
    2. 지정된 테이블의 모든행, 지정된 열을 조회하기
    SELECT 컬럼명, 컬럼명, 컬럼명 ........
    FROM 테이블명
    
    3. SELECT절에서 사칙연산을 수행할 수 있다.
    SELECT 컬럼명*숫자, 컬럼명*컬럼명,.......
    FROM 테이블명;
    *사칙연산에 사용되는 컴럼은 해당커럼의 값이 숫자값이어야한다.
    
    4. 컬럼에 별칭(ALIAS)부여하기
    SELECT 컬럼명 AS 별칭, 컬럼명AS별칭, ....
    FROM 테이블명;
    
    SELECT 컬럼명 별칭, 컬럼명 별칭, 컬럼명 별칭,....
    FROM 테이블명;
*/

-- 지역 테이블의 모든 행, 모든 열 조회하기
SELECT*
FROM REGIONS;

-- 국가 테이블의 모든 행, 모든 열 조회하기
SELECT *
FROM COUNTRIES;

-- 직종 테이블의 모든 행, 모든 열 조회하기
SELECT *
FROM JOBS;

-- 부서 테이블의 모든 행, 모든열 조회하기
SELECT *
FROM departments;

-- 직원테블의 모든 행, 모든열 조회하기
SELECT *
FROM EMPLOYEES;

-- 직종 테이블에서 직종 아이디, 최소급여, 최대급여 조회하기
SELECT JOB_ID, MIN_SALARY, MAX_SALARY
FROM JOBS;


-- 직원 테이블에서 직원아이디, 직원이름(FIRST_NAME),급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES;

-- 소재지 테이블에서 소재지 아이디 , 주소, 도시명을 조회하기
SELECT LOCATION_ID, STREET_ADDRESS, CITY
FROM LOCATIONS;

-- 직원 테이블에서 직원아이디, 직원이름, 급여, 연봉조회하기
-- 연봉은 급여*12로 계산한다.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY*12
FROM EMPLOYEES;

-- 직원테이블에서 직원아이디, 직원이름, 급여, 연봉조회하기
-- 연봉은 급여 *12로 계산한다.
-- 연봉의 별칭은 ANNUAL_SALARY다.
SELECT EMPLOYEE_ID, FIRST_NAME , SALARY , SALARY*12 AS ANNUAL_SALART
FROM EMPLOYEES;

-- 직종 테이블에서 직종아이디, 최고급여, 최저급여, 최고급여와 최저급여의 차이를 조회하기
-- 최고급여와 최저급여의 차이는 SALARY_GAP 별칭을 부여한다.
SELECT JOB_ID, MAX_SALARY, MIN_SALARY, MAX_SALARY - MIN_SALARY AS SALARY_GRP
FROM JOBS;

/*
    데이터 필터링하기
    
    1. WHERE절에 조건식을 작성해서 해당 조건식을 만족시키는 행만 조회하기
    SELECT 컬럼명, 컬럼명, 컬럼명,.....
    FROM 테이블명
    WHERE 조건식;
    
    2.WHERE절에서 2개이상의 조건식으로 데이터를 필터링할 수 있다.
      2개이상의 조건식을 작성할 떄는 AND, OR, NOT 논리 연산자를 사용한다.
    SELECT 컬럼명, 컬럼명, 컬럼명,....
    FROM 테이블명
    WHERE 조건식 AND 조건식;
    *조건식 1과 조건식2가 모두 TRUE로 판정되는 행만 조회된다.
    
    SELECT 컬러명, 컬럼명, 컬럼며...
    FORM 테이블명
    WHERE 조건식1 OR  조건식2;
    *조건식1과 조건식2 중에서 하나라도 TRUE로 판정되는 행만 조회된다.
    
    SELECT 컬럼명, 컬럼명, 컬럼명,....
    FROM 테이블명
    WHERE 조건식1 AND (조건식2 OR 조건식3);
    * AND 연산자와 OR 연산자를 같이 사용할떄는 OR 연산식을 괄호로 묶는다.    
*/
 -- 직원 테이블에서 소속부서 아이디가 60번이 직원아이디, 직종아이디를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

--직원 테이블에서 급여를 10000달러 이상 받는 직원의 아이디, 이름, 직종아이디, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000;

-- 직원 테이블에서 직종아이디가 'SA_MAN'인 직원의 아이디, 이름, 급여, 소속부서 아이디를 저회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'SA_MAN';

-- 직원 테이블에서 급여가 5000 ~ 10000 범위에 속하는 직원 아이디, 이름, 직종아이디, 급여를 조회하기
-- 급여가 5000이상 10000이하로 받은 직원을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000 AND SALARY <= 10000;

-- 직원 테이블에서 10번 부서, 20번 부서, 30번 부서에서 근무하는 직원 아이디, 이름, 부서 아이디를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20 OR DEPARTMENT_ID =30;
-------------------------------------------------------------------------------------

--부서테이블의 모든 부서 정보를 조회하기
SELECT *
FROM departments;

-- 부서테이블에서 소재지아이디가 1700번인 부서 정보 조회하기
SELECT department_id
FROM DEPATMENTS
WHERE DEPARTMENT_ID = 1700;

-- 100번직원이 관리하는 부서정보 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 100; 

--부서명이 'IT'인 부서의 정보 조회하기
SELECT DEPARTMENT_NAME, DEPARTMENT_ID, MANAGER_ID, LOCATION_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT';

--소재지아이디가 1700번인 지역의 주소, 우편번호, 도시명, 국가코드를 조회하기
SELECT STREET_ADDRESS, POSTAL_CODE, CITY, COUNTRY_ID
FROM LOCATIONS
WHERE LOCATION_ID = '1700';

--최소급여가 2000이상 5000이하인 직종의 직종아이디, 직종제목, 최소급여, 최대급여 조회하기
SELECT JOB_ID,JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM JOBS
WHERE 2000<=MIN_SALARY AND 5000>=MAX_SALARY; 

--최대급여가 20000불을 초과하는 직종의 아이디, 직종제목, 최소급여, 최대급여 조회하기
SELECT JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM JOBS
WHERE MAX_SALARY >20000;

--100직원에게 보고하는 직원의 아이디, 이름, 부서아이디을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE MANAGER_ID = 100;

--80번 부서에서 근무하고 급여를 8000불 이상 받는 직원의 아이디, 이름, 급여, 커미션포인트 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80 AND SALARY >= 8000;

--직종아이디가 SA_REP이고, 커미션포인트가 0.25이상인 직원의 아이디, 이름, 급여, 커미션포인트를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP' AND COMMISSION_PCT >= 0.25;

--80번 부서에 근무하고, 급여가 10000불 이상인 직원의 아이디, 이름, 급여, 연봉을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID =80 AND SALARY >= 10000;

--연봉 = (급여 + 급여x커미션)x12다
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, (SALARY + SALARY*COMMISSION_PCT)*12 ANNUAL_SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80 AND SALARY >= 10000;

--80번 부서에 근무하고, 147번 직원에게 보고하는 사원 중에서 커미션이 0.1인 직원의 아이디, 이름, 직종, 급여, 커미션포인트를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, COMMISSION_PCT, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80 
AND MANAGER_ID = 147 
AND COMMISSION_PCT = 0.1;



