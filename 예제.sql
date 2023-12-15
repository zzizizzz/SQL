-- 급여가 12000을 넘는 직원의 아이디, 이름, 급여를 조회하기
select employee_id, first_name, salary
from employees
where salary>=12000;
-- 급여가 5000이상 12000이하인 직원의 아이디, 이름, 급여를 조회하기
select employee_id, first_name, salary
from employees
where SALARY BETWEEN 5000 AND 12000;
-- 2007년에 입사한 직원의 아이디, 이름, 입사일을 조회하기
select employee_id, first_name, hire_date
from employees
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2007';

select employee_id, first_name, hire_date
from employees
WHERE HIRE_DATE >= '2007/01/01' AND HIRE_DATE <'2008/01/01';
-- 20번 혹은 50번 부서에 소속된 직원의 이름과 부서번호를 조회하고, 이름을 알파벳순으로 정렬해서 조회하기
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID  IN(50,20)
ORDER BY FIRSt_NAME ASC;
-- 급여가 5000이상 12000이하고, 20번 혹은 50번 부서에 소속된 사원의 이름과 급여, 부서번호를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID in(50, 20)
and salary > 5000 and salary < 12000
ORDER BY SALARY ASC;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID in(50, 20)
and SALARY BETWEEN 5000 AND 12000;

-- 관리자가 없는 직원의 이름과 직종, 급여를 조회하기
SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 직종이 'SA_MAN'이거나 'ST_MAN'인 직원중에서 급여를 8000이상 받는 직원의 아이디, 이름, 직종, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN ('SA_MAN', 'ST_MAN')
AND SALARY >= 8000;

-- 모든 직원의 이름, 직종아이디, 급여, 소속부서명을 조회하기
--      E          E         E      
--                                  D
SELECT E.FIRST_NAME, E.JOB_ID, E.SALARY, D.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT  E.FIRST_NAME,E.JOB_ID,E.SALARY, D.DEPARTMENT_NAME
FROM  EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);

-- 모든 직원의 이름, 직종아이디, 직종제목, 급여, 최소급여, 최대급여를 조회하기
--       E         E                 E
--                 J           J             J       J
SELECT  E.EMPLOYEE_ID,
        E.FIRST_NAME,
        E.JOB_ID,
        J.JOB_TITLE,
        J.MIN_SALARY,
        J.MAX_SALARY,
        E.SALARY
FROM  EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID;
-- 모든 직원의 이름, 직종아이디, 직종제목, 급여, 최소급여조회하기
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, J.MIN_SALARY
FROM EMPLOYEES E , JOBS J
WHERE E.JOB_ID = J.JOB_ID;

-- 커미션을 받는 모든 직원의 아이디, 부서이름, 소속부서의 소재지(도시명)을 조회하기
--  E                E                    
--                                D  
--                                       L 
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E , DEPARTMENTS D, LOCATIONS L
WHERE E.COMMISSION_PCT IS NOT NULL
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND D.LOCATION_ID = L.LOCATION_ID(+);

-- 이름이 A나 a로 시작하는 모든 직원의 이름과 직종아이디, 직종제목, 급여, 소속부서명을 조회하기
--   E                        E         E                E
--                                                              D
--                                      J         J  
SELECT E.FIRST_NAME, E,JOB_ID, J.JOB_TITLE, E.SALARY, D.DEPARTMENT_NAME
FROM EMPLOYEES E,DEPARTMENT D, JOBS J
WHERE LOWER(FIRST_NAME) LIKE 'a%'
-- WHERE SUBSTR(E.FIRST_NAME, 1,1) IN ('a', 'A')
-- WHERE (E.FIRST_NAME LIKE 'a%' OR E.FIRST_NAME LIKE'A%')
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.JOB_ID = J.JOB_ID;
-- 30, 60, 90번 부서에 소속되어 있는 직원들 중에서 100에게 보고하는 직원들의 이름, 직종아이디, 급여, 급여등급을 조회하기
-- E                                         E                   E       E      E      
--                                                                                      G(최소/ 최대급여)
SELECT E.FIRST_NAME, E.JOB_ID, E.SALARY, G.GRADE
FROM EMPLOYEES E, SALARY_GRADES G
WHERE E.DEPARTMENT_ID IN(30,60,90)
AND E.MANAGER_ID = 100
AND E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY;
-- 80번 부서에 소속된 직원들의 이름, 직종아이디, 직종제목, 급여, 급여등급, 소속부서명을 조회하기
-- E                     E       E                E
--                               J          J
--                                                G     G        
--                                                               D
SELECT D.EMPLOYEE_ID, E.JOB_ID, J.JOB_TITLE, E.SALARY, G.GRADE, D.DEPLARTMENT_ID
FROM EMPLOYEES E, JOBS J, SALARY_GRADES G, DEPARTMENTS D
WHERE E.DEPARTMMENT_ID = 80 
AND E.JOB_ID = J.JOB_ID 
AND E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);
-- 'ST_CLERK'로 근무하다가 다른 직종으로 변경한 직원의 아이디, 이름, 변경전 부서명, 현재 직종아이디, 현재 근무부서명을 조회하기
SELECT E.EMPLOYEE_ID,
           E.FIRST_NAME,
           H.JOB_ID   AS 이전직종,
           E.JOB_ID    AS 현재직종,
           D1.DEPARTMENT_NAME  AS 이전부서명,
           D2.DEPARTMENT_NAME  AS 현재부서명
FROM JOB_HISTORY H,     -- 직종변경이력정보(예전직종, 이전소속부서아이디)
     EMPLOYEES E,       -- 직원정보(현재직종, 현재소속부서아이디)
     DEPARTMENTS D1,    -- 예전소속부서정보
     DEPARTMENTS D2     -- 현재소속부서정보
WHERE H.JOB_ID = 'ST_CLERK'
AND H.EMPLOYEE_ID = E.EMPLOYEE_ID
AND H.DEPARTMENT_ID = D1.DEPARTMENT_ID
AND E.DEPARTMENT_ID = D2.DEPARTMENT_ID;   
-- 'IT' 부서에서 근무하는 직원의 아이디, 이름을 조회하기
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.DEPARTMENT_ID
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.DEPARTMENT_NAME = 'IT'
AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;
-- 직원들이 근무 중인 도시명을 중복없이 조회하기
SELECT DISTINCT L.CITY --E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.LOCATION_ID, L.LOCATION_ID, L.CITY 
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID;
-- 급여로 급여등급을 산정했을 때 'A' 등급에 해당되는 직원들의 아이디, 이름, 급여, 직종아이디을 조회하기
--  E        G               G                    E        E    E     E  
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, E.JOB_ID
FROM SALARY_GRADES G, EMPLOYEES E
WHERE E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY
AND G.GRADE = 'A';
-- 200번 직원이 관리하는 부서에서 근무하는 직원의 아이디, 이름, 직종을 조회하기
--  D                                   E        E     E
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID = 200
AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;
-- 모든 직원의 아이디, 이름, 급여, 커미션이 고려한 급여, 급여등급, 직종아이디, 소속부서아이디, 소속부서명, 근무지 도시명을 조회하기 
--           E      E    E     E          E                   E          E                                     
--                                        G       G                   
--                                                                        D       D
--                                                                                             L

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY,
       E.SALARY + E.SALARY*NVL(COMMISSION_PCT, 0) REAL_SALARY,
       G.GRADE,
       E.JOB_ID,
       D.DEPARTMENT_ID, 
       D.DEPARTMENT_NAME, 
       L.CITY
FROM EMPLOYEES E, SALARY_GRADES G, DEPARTMENTS D, LOCATIONS L
WHERE E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND D.LOCATION_ID = L.LOCATION_ID(+);





