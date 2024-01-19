SELECT Prices.product_id, 
COALESCE(ROUND(SUM(units * price) / SUM(units),2),0) AS average_price
FROM Prices
LEFT JOIN UnitsSold
ON Prices.product_id = UnitsSold.product_id
WHERE units IS NULL OR purchase_date BETWEEN start_date AND end_date
GROUP BY Prices.product_id