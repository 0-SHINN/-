-- 월별 ARPPU
SELECT DATE_TRUNC(DATE(created_at), MONTH) AS month,
       CAST(SUM(total_amount) / COUNT(DISTINCT customer_id) AS INTEGER) AS ARPPU,
       COUNT(DISTINCT customer_id) AS Paying_user,
       SUM(item_price * quantity) AS revenue
FROM `transaction`
GROUP BY month
ORDER BY month
