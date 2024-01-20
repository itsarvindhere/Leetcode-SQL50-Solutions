SELECT 
    id,
    COALESCE(
        IF(id % 2 = 0, LAG(student) OVER(), LEAD(student) OVER()), 
        student
    ) AS student
FROM Seat