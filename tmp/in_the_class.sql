-- edit 시도
--INSERT into Student values (111, 'jiho',4.9,1000);
--UPDATE Student set sid=100 where sid=123
-- set to valuse from Where value

-- get GPA > 3.6인 id, name, gpa
-- SELECT sID, sName, GPA
-- FROM Student
-- WHERE GPA>3.6

-- cs에 합격한 학생의 id
-- SELECT sID
-- from Apply
-- where decision='Y' AND major='CS'

-- JOIN
-- SELECT *
-- from Student, Apply
-- WHERE Student.sID = Apply.sID

-- 지원한 학생의 sid, name, gpa, uni name, uni's enrollment
-- SELECT Student.sID, Student.sName, Student.GPA, College.cName, College.enrollment
-- from Student, Apply, College
-- WHERE Student.sID = Apply.sID AND Apply.cName = College.cName

-- str  patten
-- 거주 도시가 휴스턴, 텍사스인 모든 종업원
--WHERE ADDRESS LIKE '%휴스턴, 텍사스%'

-- bio 관련 학과에 지원한 학생의 id, major
-- 해당 자리에 제시한 char가 있는지 검색
-- SELECT sID, major
-- FROM Apply
-- WHERE major like 'C_'

-- QUERY 결과의 sort
-- DESC : descending (Z - A)
-- ASC : Ascending (A- Z)
-- ex) ORDER BY DNAME, LNAME ASC, FNAME ASC
-- SELECT 
-- FROM
-- WHERE
-- ORDER BY 

-- alias : sub name
-- rename 2번 쓴 것. can't replacable
-- FROM EMPLOYEE E, EMPLOYEE S
-- FROM EMPLOYEE AS E(FN, MI, LN, ~~~~~~~~~~~~~)

-- scaledGPA를 구하시오
-- SELECT sID, sName, GPA, sizeHS, GPA*(sizeHS/1000) as scaledGPA
-- FROM Student

-- rename 써서 3개의 조인 출력
-- SELECT S.sID, S.GPA, A.cName, C. enrollment
-- FROM Student AS S, Apply AS A, College AS C
-- WHERE S.sID = A.sID AND A.cName = C.cName

-- gpa가 같은 학생의 쌍
 -- 학생1의 id, name, 학생2의 id, name, GPA
--  SELECT s1.sID, s1.sName, s2.sID, s2.sName, s1.GPA
--  FROM Student AS S1, Student AS S2
--  WHERE S1.GPA = S2.GPA AND S1.sID < S2.sID
--  ORDER BY S1.sID ASC;

-- 집합
-- (____) UNION (_____)
-- 자동으로 중복 제거함.
-- SELECT sName AS NAME FROM Student
-- UNION
-- SELECT cName AS NAME FROM College
-- ORDER BY NAME;

-- CS, EE에 모두 지원한 학생 id
-- SELECT sID AS NAME
-- FROM Apply
-- WHERE major='CS'
-- UNION
-- SELECT sID AS NAME
-- FROM Apply
-- WHERE major='EE'

-- SELECT DISTINCT A1.sID
-- FROM Apply AS A1, Apply AS A2
-- WHERE A1.sID = A2.sID AND A1.major='CS' AND A2.major='EE' 


-- cs에는 지원하고 ee에는 지원하지 않은 학생들
-- SELECT sID AS NAME
-- FROM Apply
-- WHERE major='CS'
-- EXCEPT
-- SELECT sID AS NAME
-- FROM Apply
-- WHERE major='EE'

-- Thu Nov 16
-- CS에 지원한 학생의 ID, name을 구하시오 WITH JOIN
-- SELECT DISTINCT Student.sID,Student. sName
-- FROM Apply, Student
-- WHERE Apply.sID = Student.sID

-- CS에 지원한 학생의 ID, name을 구하시오 WITHOUT JOIN
-- 중첩질의
-- SELECT sID, sName
-- FROM Student
-- WHERE	sID IN (SELECT sID FROM Apply WHERE major='CS')

-- CS에 지원한 학생의 GPA WITH JOIN -- 7개 출력, DISTINCT하면 오히려 4개가 되어버림 ; sID가 아니라 GPA같은 경우를 지워버림
-- SELECT Student.GPA
-- FROM Student, Apply
-- WHERE Student.sID = Apply.sID AND Apply.major = 'CS'


-- CS에 지원한 학생의 GPA WITHOUT JOIN -- 5개 출력; DISTINCT 이후 4개. 
-- SELECT DISTINCT GPA
-- FROM Student
-- WHERE sID IN (SELECT sID FROM Apply WHERE major = 'CS')

-- CS에는 지원하고, EE에는 지원하지 않은 학생의 sID, sName with EXCEPT
-- SELECT Student.sID, Student.sName
-- FROM Student, Apply
-- WHERE Apply.major='CS'  AND Student.sID = Apply.sID
-- EXCEPT -- 자동으로 중복 제거됨
-- SELECT Student.sID, Student.sName
-- FROM Student, Apply
-- WHERE Apply.major='EE'  AND Student.sID = Apply.sID

-- CS에는 지원하고, EE에는 지원하지 않은 학생의 sID, sName with in or not in
-- SELECT sID, sName
-- FROM Student
-- WHERE sID 
-- IN (SELECT sID FROM Apply WHERE major='CS') AND
-- sID NOT IN (SELECT sID FROM Apply WHERE major='EE')

-- same state에 다른 대학이 있는 대학의 이름과 state
-- SELECT cName, state
-- FROM College C1
-- WHERE EXISTS (
-- 	SELECT * 
-- 	FROM College	C2
-- 	WHERE C1.state = C2.state AND C1.cName <> C2.cName
-- 	-- <> : not equal
-- 	)
-- 	-- not EXISTS 하면, 반대 쌍인 대학이 나옴

-- College's enrollment가 가장많은 대학의 이름
-- SELECT cName
-- FROM College as c1
-- WHERE NOT EXISTS (
-- 	SELECT *
-- 	FROM College as c2
-- 	WHERE c1.enrollment < c2.enrollment
-- 	)

--- GPA가 가장 높은 학생의 이름과 GPA
-- SELECT  sName, GPA, sID
-- FROM Student as s1
-- WHERE NOT EXISTS(
-- 	SELECT *
-- 	FROM Student as s2
-- 	WHERE s1.GPA < s2.GPA
-- 	)

-- 모든 학생의 gpa의 평균을 구하시오
-- SELECT avg(GPA), max(GPA), min(GPA), sum(GPA)
-- FROM Student

-- CS지원자 중 성적 제일 낮은 GPA
SELECT min(Student.GPA)
FROM Apply, Student
WHERE Apply.sID = Student.sID AND Apply.major = 'CS'