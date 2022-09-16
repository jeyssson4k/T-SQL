USE [dbo]

--ASC MIN TO MAX, DESC MAX TO MIN
SELECT * 
FROM dbo 
ORDER BY id DESC 

--TOP: AMOUNT OF RESULTS 
SELECT TOP N * 
FROM dbo 
ORDER BY id DESC

--PERCENT: PERCENT OF RESULTS 
SELECT TOP N PERCENT * 
FROM dbo 
ORDER BY id DESC

-WITH TIES INCLUDES DATA IN SELECT WITH SAME VALUE OF SELECTION 
SELECT TOP N PERCENT WITH TIES * 
FROM dbo 
ORDER BY id DESC

--OFFSET FETCH CREATE PAGES 
SELECT * 
FROM dbo 
ORDER BY id DESC
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY

--DISTINCT: UNIQUE VALUES IN COLUMN
SELECT DISTINCT id 
FROM dbo 
ORDER BY id

--BETWEEN: RANGE
SELECT id, serial, charge 
FROM dbo
WHERE charge BETWEEN 10 AND 20

SELECT id, serial, charge 
FROM dbo
WHERE charge
  (ter_nivel_bateria IS NOT NULL) AND 
	(ter_nivel_bateria < 20) AND 
	(ter_nivel_bateria > 10)

--IN: SPECIFIC VALUES
SELECT id, serial, charge 
FROM dbo
WHERE charge IS NOT NULL AND charge IN (10,15,52,55)

--LIKE: REGEX
SELECT apps 
FROM dbo
WHERE apps LIKE '%com.%'

--LIKE 'Mountain-[0-9][0-9][0-9] %, [0-9][0-9]'
