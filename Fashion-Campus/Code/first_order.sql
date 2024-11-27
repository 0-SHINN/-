-- 첫 구매 유저
WITH first_order_table AS(
  SELECT DATE_TRUNC(DATE(MIN(created_at) 
			   OVER (PARTITION BY customer_id)), MONTH)
			   AS first_order_month,
         customer_id
  FROM `transaction`
)

SELECT first_order_month,
       COUNT(DISTINCT customer_id)
       AS first_purchaser
FROM first_order_table
GROUP BY first_order_month
ORDER BY first_order_month
