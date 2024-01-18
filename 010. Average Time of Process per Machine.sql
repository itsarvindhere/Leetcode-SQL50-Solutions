SELECT 
    a.machine_id, 
    ROUND(SUM(b.timestamp - a.timestamp) / COUNT(DISTINCT a.process_id),3) AS processing_time
FROM Activity AS a
INNER JOIN Activity AS b
ON 
    a.machine_id = b.machine_id 
    AND a.process_id = b.process_id 
    AND b.activity_type = 'end'
GROUP BY a.machine_id