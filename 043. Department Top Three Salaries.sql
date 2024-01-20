SELECT 
    Department.name AS "Department",
    Employee.name AS "Employee",
    salary AS "Salary"
FROM Employee
JOIN Department 
ON Employee.departmentId = Department.id
WHERE (Employee.departmentId,salary) IN (
    
    SELECT 
        departmentId, salary
    FROM
    (
        SELECT
            departmentId,
            salary,
            DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rnk
        FROM Employee
    ) AS A
    WHERE A.rnk < 4
)
