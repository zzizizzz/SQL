-- 60번 부서에 소속된 직원들의 아이디, 이름, 관리자의 아이디, 관리자의 이름을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;
-- 60번 부서에 소속된 직원들의 아이디, 이름, 급여, 급여등급을 조회하기
--    E                   E       E   E    G
SELECT E.DEPARTMENT_ID, 
        E.EMPLOYEE_ID, 
        E.FIRST_NAME, 
        G.GRADE
FROM EMPLOYEES E, SALARY_GRADES G
WHERE E.DEPARTMENT_ID = 60;


-- 직원들 중에서 자신의 상사보다 먼저 입사한 직원들의 아이디, 이름, 입사일, 관리자의 이름, 관리자의 입사일을 조회하기
SELECT EM.EMPLOYEE_ID AS EM_ID,
       EM.HIRE_DATE AS EM_DATE,
       EM.FIRST_NAME  AS EM_NAME,
       MG.EMPLOYEE_ID  AS MG_ID,
       MG.HIRE_DATE    AS MG_DATE,
       MG.FIRST_NAME   AS MG_NAME
FROM EMPLOYEES EM, EMPLOYEES MG
WHERE EM.HIRE_DATE > MG.HIRE_DATE; 

-- 직원들의 직종아이디별 평균급여를 조회해서 직종아이디, 평균급여로 조회하기
--        E          E
SELECT AVG(SALARY), JOB_ID
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 평균급여의 소수점부분은 전부 버린다.
-- 관리자별(상사)로 담당자는 직원수를 조회해서 관리자 아이디, 직원수를 출력하기
SELECT MANAGER_ID, COUNT(*)
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID;
-- 직원들의 전체 평균급여보다 급여를 적게 받는 직원들의 아이디, 이름, 급여를 출력하기
--                       
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY)
                FROM EMPLOYEES);
    
-- 전체 직원의 평균급여보다 2배 이상의 급여를 받는 직원들의 아이디, 이름, 직종아이디, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY < 2*(SELECT AVG(SALARY)
                FROM EMPLOYEES);

-- 80번 부서에 근무하고, 80번 부서의 최저급여와 동일한 급여를 받는 직원의 아이디, 이름, 직종, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY,DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
OR SALARY = (SELECT MIN(SALARY)
             FROM EMPLOYEES);

-- 직원들의 급여등급을 계산해서 급여등급별 직원수를 조회해서 급여등급, 직원수를 출력하기
SELECT GRADE, COUNT(*)
FROM SALARY_GRADES
GROUP BY GRADE;
-- 'Neena'와 같은 해에 입사한 직원들의 아이디, 이름, 입사일을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE = 

