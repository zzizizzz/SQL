/*
자체 조인

 조인대상이 되는 테이블이 같은 테이블일때 발생하는 조인이다.
 같은 테이블끼리 조인하기 떄문에,서로 역할 나누어서 별칭을 정하고, 그 역할에 맞게 조인조건을 정의해야한다.
 같은 테이블끼리 조인하기 때문에 조회하는 컬럼명이 동일한 경우가 적절한 별칭을 붙이는 것이 좋다.
 
*/

-- 직원테이블에서 직원아이디, 직원이름, 해당직원의 상사아이디,  상사이름을 조회하기
--             E(직원)     E(직원) E(직원)-MANAGER_ID   
--                               E(상사)-EMPLOYEE_ID  E(상사)

-- 자체를 조인하는것이 아니고 직원용 매니저아이디와 관라자용 직원 아이디이다.
SELECT EMP.EMPLOYEE_ID AS EMP_ID,
       EMP.FIRST_NAME  AS EMP_NAME,
       MGR.EMPLOYEE_ID  AS MGR_ID,
       MGR.FIRST_NAME   AS MGR_NAME
FROM EMPLOYEES EMP, EMPLOYEES MGR
WHERE EMP.MANAGER_ID = MGR.EMPLOYEE_ID;

SELECT P.NAME 종류, C.NO 상품번호, C.NAME 상품명
FROM PRODUCTS C, PRODUCTS p
WHERE C.PNO IS NOT NULL
AND C.PNO = P.NO;

-- 직원아이디, 직원이름, 직원의 소속부서명, 상사의 아이디, 상사의 이름, 상사의 소속부서명
--   E        E                       E
--                     D1
--                                    M              M          
--                                                               D2                                                       
--직원                                  직원의 소속부서        상사                          상사의 소속부서
--[102 홍길동 100 60]                -   [  60-IT]        [100 김유신 NULL  90]           [90-EXECUTIVE]

SELECT E.EMPLOYEE_ID        AS EMP_ID,
       E.FIRST_NAME         AS EMP_NAME,
       ED.DEPARTMENT_NAME   AS EMP_DEPT_NAME,
       M.EMPLOYEE_ID        AS MGR_ID,
       M.FIRST_NAME         AS MGR_NAME,
       MD.DEPARTMENT_NAME   AS MGR_DEPT_NAME
FROM EMPLOYEES E,       --직원 
     EMPLOYEES M,       -- 관리자
     DEPARTMENTS ED,    --직원의 소속부서
     DEPARTMENTS MD     -- 관리자 소속부서
WHERE E.DEPARTMENT_ID = ED.DEPARTMENT_ID(+)  --직원과 직원의 소속부서 조인
AND E.MANAGER_ID = M.EMPLOYEE_ID(+)           --직원과 매니저 조인
AND M.DEPARTMENT_ID = MD.DEPARTMENT_ID(+);      -- 매니저와 매니저의 소속부서 조인










