SELECT FORMAT_DATE('%Y',created_at) AS year,
       FORMAT_DATE('%m', created_at) AS month,
       COUNT(DISTINCT customer_id) AS purchase_users
FROM `transaction`
GROUP BY year,month
ORDER BY year,month
