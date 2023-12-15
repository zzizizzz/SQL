-- 모든 직원의 아이디, 이름, 부서번호, 부서명을 조회하기
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);

-- 커미션을 받는 직원의 아이디, 이름, 직종아이디, 급여, 커미션을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- 커미션을 받는 직원의 아이디, 이름, 급여, 커미션, 급여등급을 조회하기
--              E           E   E       E       G      
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, G.GRADE, E.COMMISSION_PCT
FROM EMPLOYEES E, SALARY_GRADES G
WHERE COMMISSION_PCT IS NOT NULL --검색조건
AND E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY;

[100, 홍길동 , 2000] [A,0,2499]
-- 80번 부서에 소속된 직원들의 평균급여, 최저급여, 최고급여를 조회하기
SELECT TRUNC(AVG(SALARY)), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;


-- 80번 부서에 소속된 직원들의 직원아이디, 이름, 직종제목, 급여, 직종 최고급여와 급여간의 차이를 조회하기
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, J.JOB_TITLE, E.SALARY, J.MAX_SALARY - E.SALARY AS SALARY_GAP
FROM  EMPLOYEES E, JOBS J 
WHERE E.DEPARTMENT_ID = 80 -- 조회조건
AND E.JOB_ID = J.JOB_ID; -- 조인조건


-- 각 부서별 최고급여, 최저급여, 최고급여와 최저급여의 차이를 조회하기
SELECT DEPARTMENT_ID, MAX(SALARY), MIN(SALARY), MAX(SALARY) - MIN(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, MAX_SALARY, MIN_SALARY, MAX_SALARY - MIN_SALARY
FROM (SELECT DEPARTMENT_ID, MIN(SALARY) MAX_SALARY , MIN(SALARY) MIN_SALARY
       FROM EMPLOYEES
       WHERE DEPARTMENT_ID IS NOT NULL
       GROUP BY DEPARTMENT_ID);

-- 'Executive' 부서의 모든 직원아이디, 이름, 직종아이디를 조회하기
SELECT D.DEPARTMENT_NAME,E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE DEPARTMENT_NAME = 'Executive'    -- 검색조건
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID; -- 조인조건

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Executive');

-- 전체 직원의 평균급여보다 급여를 적게 받는 직원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY< (SELECT AVG(SALARY)
                FROM EMPLOYEES);

-- 'Ismael'과 같은 해에 입사했고, 같은 부서에 근무하고 있는 직원의 아이디, 이름, 입사일을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') IN (SELECT TO_CHAR(HIRE_DATE, 'YYYY')
                                    FROM EMPLOYEES
                                    WHERE FIRST_NAME = 'Ismael')
AND DEPARTMENT_ID  = (SELECT DEPARTMENT_ID
                      FROM EMPLOYEES
                      WHERE FIRST_NAME = 'Ismael');
                      

-- 부서별 최고급여를 조회했을 때 최고급여가 15000을 넘는 부서의 아이디와 최고급여를 조회하기
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) > 15000;
-- 'Neena'보다 급여을 많이 받는 직원의 아이디, 이름, 직종아이디, 급여를 조회하기
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, JOB_ID
FROM EMPLOYEES E
WHERE SALARY > (SELECT SALARY
                FROM EMPLOYEES
                WHERE FIRST_NAME = 'Neena');

-- 급여등급별로 직원수를 조회하기
SELECT G.GRADE, COUNT(*)
FROM EMPLOYEES E, SALARY_GRADES G
WHERE E.SALARY >= G.MIN_SALARY AND E.SALARY<=G.MAX_SALARY
GROUP BY G.GRADE;


-- 부서별 평균급여를 계산했을 그 부서의 평균급여보다 급여를 적게 받는 직원의 아이디, 이름, 급여, 부서명을 조회하기
SELECT A.DEPARTMENT_ID, A.AVG_SALARY, B.EMPLOYEE_ID, B.FIRST_NAME, B.SALARY, C.DEPARTMENT_NAME
FROM (SELECT DEPARTMENT_ID, AVG(SALARY) AS AVG_SALARY
       FROM EMPLOYEES
    WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID) A, EMPLOYEES B, DEPARTMENTS C
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND A.AVG_SALARY > B.SALARY
AND B.DEPARTMENT_ID = C.DEPARTMENT_ID;

--'Ismael' 직원이 근무하는 부서의 아이디와 이름을 조회하기
-- 조인방식
SELECT B.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.FIRST_NAME = 'Ismael'
AND A.DEPARTMENT_ID = B.DEPARTMENT_ID;

-- 서브 쿼리 방식
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM EMPLOYEES
                        WHERE FIRST_NAME ='Ismael');
                        
                        
                        
-- 'Neena'에게 보고하는 직원의 아이디와 이름을 조회하기
SELECT EMPLOYEE_ID , FIRST_NAME
FROM  EMPLOYEES
WHERE MANAGER_ID = (SELECT EMPLOYEE_ID
                    FROM EMPLOYEES
                    WHERE FIRST_NAME = 'Neena' );
-- 부서별 평균급여를 계산했을때 'Ismael'이 근무하는 평균급여보다 급여를 많이 받는 부서의
-- 부서 아이디와 평균급여를 조회하기
SELECT DEPARTMENT_ID, AVG(SALARY) AVG_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >  (SELECT AVG(SALARY)
                       FROM EMPLOYEES
                       WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                                              FROM EMPLOYEES
                                              WHERE FIRST_NAME = 'Ismael'));
                    
                    



