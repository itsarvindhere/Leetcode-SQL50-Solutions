SELECT unique_id, name 
FROM EmployeeUNI
RIGHT JOIN Employees 
ON Employees.id = EmployeeUNI.id