 WITH first_join AS(
  SELECT c.first_join_date,
         c.customer_id
  FROM `customers` AS c
  LEFT JOIN `transaction` AS t ON c.customer_id = t.customer_id
  GROUP BY c.customer_id, first_join_date
  ORDER BY c.customer_id
 )

SELECT FORMAT_TIMESTAMP('%Y-%m', first_join_date) AS first_join_month,
ROUND(COUNT(DISTINCT CASE WHEN DATE_DIFF(DATE(created_at), first_join_date, MONTH) = 0 THEN t.customer_id END) / COUNT(DISTINCT CASE WHEN DATE_DIFF(DATE(created_at), first_join_date, MONTH) = 0 THEN t.customer_id END) * 100, 2) AS `0`,
ROUND(COUNT(DISTINCT CASE WHEN DATE_DIFF(DATE(created_at), first_join_date, MONTH) = 1 THEN t.customer_id END) / COUNT(DISTINCT CASE WHEN DATE_DIFF(DATE(created_at), first_join_date, MONTH) = 0 THEN t.customer_id END) * 100, 2) AS `1`,
ROUND(COUNT(DISTINCT CASE WHEN DATE_DIFF(DATE(created_at), first_join_date, MONTH) = 2 THEN t.customer_id END) / COUNT(DISTINCT CASE WHEN DATE_DIFF(DATE(created_at), first_join_date, MONTH) = 0 THEN t.customer_id END) * 100, 2) AS `2`,
ROUND(COUNT(DISTINCT CASE WHEN DATE_DIFF(DATE(created_at), first_join_date, MONTH) = 3 THEN t.customer_id END) / COUNT(DISTINCT CASE WHEN DATE_DIFF(DATE(created_at), first_join_date, MONTH) = 0 THEN t.customer_id END) * 100, 2) AS `3`,
ROUND(COUNT(DISTINCT CASE WHEN DATE_DIFF(DATE(created_at), first_join_date, MONTH) = 4 THEN t.customer_id END) / COUNT(DISTINCT CASE WHEN DATE_DIFF(DATE(created_at), first_join_date, MONTH) = 0 THEN t.customer_id END) * 100, 2) AS `4`,
ROUND(COUNT(DISTINCT CASE WHEN DATE_DIFF(DATE(created_at), first_join_date, MONTH) = 5 THEN t.customer_id END) / COUNT(DISTINCT CASE WHEN DATE_DIFF(DATE(created_at), first_join_date, MONTH) = 0 THEN t.customer_id END) * 100, 2) AS `5`,
ROUND(COUNT(DISTINCT CASE WHEN DATE_DIFF(DATE(created_at), first_join_date, MONTH) = 6 THEN t.customer_id END) / COUNT(DISTINCT CASE WHEN DATE_DIFF(DATE(created_at), first_join_date, MONTH) = 0 THEN t.customer_id END) * 100, 2) AS `6`
FROM `transaction` AS t
LEFT JOIN first_join AS f ON t.customer_id = f.customer_id
GROUP BY first_join_month
ORDER BY first_join_month
