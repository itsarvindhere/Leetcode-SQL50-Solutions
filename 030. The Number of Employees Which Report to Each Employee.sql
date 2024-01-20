SELECT 
   A.employee_id, 
   A.name,
   COUNT(*) AS reports_count,
   ROUND(AVG(B.age),0) AS average_age
FROM Employees AS A
JOIN Employees AS B
ON A.employee_id = B.reports_to
GROUP BY A.employee_id
ORDER BY A.employee_id