SELECT  DATE_TRUNC(DATE(first_join_date), MONTH) AS month,
       COUNT(DISTINCT c.customer_id) AS signup_users,
       COUNT(DISTINCT t.customer_id) AS purchase_users
FROM `customers` AS c
LEFT JOIN `transaction` AS t ON c.customer_id = t.customer_id
GROUP BY month
ORDER BY month
