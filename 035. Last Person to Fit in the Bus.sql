SELECT DISTINCT
    LAST_VALUE(person_name) OVER() AS person_name
FROM 
(
    SELECT  
        person_name,
        SUM(weight) OVER(ORDER BY turn) AS weight_sum
    FROM Queue
) AS running_sum
WHERE running_sum.weight_sum <= 1000