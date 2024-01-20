SELECT
    IF(COUNT(*) = 0, null, salary) AS SecondHighestSalary 
FROM Employee
WHERE salary IN (
    SELECT
        NTH_VALUE(salary,2) OVER(ORDER BY salary DESC)
    FROM (
        SELECT DISTINCT
            salary
        FROM Employee
    ) AS distinct_salary
)
