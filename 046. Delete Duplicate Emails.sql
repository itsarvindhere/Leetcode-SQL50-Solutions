DELETE FROM Person
WHERE id NOT IN (
SELECT id FROM
    (
        SELECT
            id,
            DENSE_RANK() OVER(PARTITION BY email ORDER BY id) AS rnk
        FROM Person
    ) AS A
    WHERE A.rnk = 1
)