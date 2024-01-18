SELECT A.name
FROM Employee AS A
INNER JOIN Employee AS B
ON A.id = B.managerId
GROUP BY A.id
HAVING COUNT(A.id) > 4