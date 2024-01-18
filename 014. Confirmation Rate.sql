SELECT Signups.user_id, 
COALESCE(
    ROUND(
        COUNT(
            CASE 
            WHEN Confirmations.action = "confirmed" THEN 1
            END
        ) / COUNT(Confirmations.action),2), 0) AS confirmation_rate
FROM Signups
LEFT JOIN Confirmations
ON Confirmations.user_id = Signups.user_id
GROUP BY Signups.user_id