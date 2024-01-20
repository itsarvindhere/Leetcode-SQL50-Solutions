SELECT
    visited_on,
    amount,
    ROUND(amount / 7,2) AS average_amount
FROM (
    SELECT DISTINCT
        visited_on,
        SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount
    FROM Customer
) AS A
WHERE DATE_SUB(visited_on, INTERVAL 6 DAY) >= (
    SELECT 
        MIN(visited_on)
    FROM Customer
)
