-- ***************************
-- USING LEAD() AND LAG()
-- ***************************
SELECT DISTINCT 
     num AS ConsecutiveNums
FROM (
     SELECT 
         num,
         LAG(num) OVER() AS num_before,
         LEAD(num) OVER() AS num_after
     FROM Logs
) AS data
WHERE data.num_before = num AND data.num_after = num

-- ***************************
-- USING ONLY LEAD()
-- ***************************
SELECT DISTINCT 
    num AS ConsecutiveNums
FROM (
    SELECT 
        num,
         LEAD(num) OVER() AS num_after_1,
       LEAD(num,2) OVER() AS num_after_2
    FROM Logs
) AS data
WHERE data.num_after_1 = num AND data.num_after_2 = num

-- ***************************
-- USING ONLY LAG()
-- ***************************
SELECT DISTINCT 
    num AS ConsecutiveNums
FROM (
    SELECT 
        num,
        LAG(num) OVER() AS num_before_1,
        LAG(num,2) OVER() AS num_before_2
    FROM Logs
) AS data
WHERE data.num_before_1 = num AND data.num_before_2 = num