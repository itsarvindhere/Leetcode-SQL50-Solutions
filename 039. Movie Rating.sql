(
    SELECT
        name AS results
    FROM MovieRating AS A
    JOIN Users AS B
    ON A.user_id = B.user_id
    GROUP BY A.user_id
    ORDER BY COUNT(rating) DESC, name ASC
    LIMIT 1
)

UNION ALL

(
    SELECT 
        title AS results
    FROM MovieRating AS A
    JOIN Movies as B
    ON A.movie_id = B.movie_id
    WHERE created_at BETWEEN "2020-02-01" AND "2020-02-29"
    GROUP BY A.movie_id
    ORDER BY AVG(rating) DESC, B.title ASC
    LIMIT 1
)
