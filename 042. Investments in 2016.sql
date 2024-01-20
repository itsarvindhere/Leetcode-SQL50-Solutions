SELECT
    ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM (
SELECT DISTINCT
    A.pid,
    A.tiv_2016
FROM Insurance AS A
JOIN Insurance AS B
ON A.tiv_2015 = B.tiv_2015 AND A.pid != B.pid AND (A.lat, A.lon) NOT IN (
    
    SELECT lat,lon
    FROM Insurance
    WHERE pid != A.pid

)
) AS C