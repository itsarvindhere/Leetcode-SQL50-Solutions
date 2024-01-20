-- *****************
-- WITHOUT JOIN
-- *****************
SELECT
    employee_id
FROM Employees
WHERE salary < 30000 AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id


-- *****************
-- USING JOIN
-- *****************
SELECT
    A.employee_id
FROM Employees AS A
LEFT JOIN Employees AS B
ON A.manager_id = B.employee_id
WHERE A.salary < 30000 AND A.manager_id IS NOT NULL AND B.employee_id IS NULL
ORDER BY A.employee_id