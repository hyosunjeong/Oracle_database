-- 여기는 관리자 화면입니다.

-- 주석문 
-- Ctrl + / : 주석설정 및 해제
-- Ctrl + s : 저장
-- Ctrl + Enter: 콘솔창에 결과보기

SELECT 30+30 FROM DUAL;
SELECT '대한민국' FROM DUAL;
select 30 * 30 from dual;

-- SELECT
-- 데이터를 조회(읽기)를 수행하는 Keyword
-- 간단한 연산(사칙연산) 등을 수행 할 때도 사용할 수 있다.
-- 간단한 연산을 수행할때 표준(보편적인)DBMS에서는
-- SELECT 30*40;이라고 입력하면 수행이 되나
-- 오라클에서는 SELECT 30*40 FROM DUAL; 이라고
-- 입력을 해야 수행이 완료된다.
SELECT 30+40 FROM DUAL;



