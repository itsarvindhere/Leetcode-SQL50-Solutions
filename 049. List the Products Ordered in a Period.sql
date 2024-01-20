SELECT
    product_name,
    SUM(unit) AS unit
FROM Orders
JOIN Products ON Products.product_id = Orders.product_id
WHERE order_date LIKE "2020-02%"
GROUP BY product_name
HAVING unit >= 100