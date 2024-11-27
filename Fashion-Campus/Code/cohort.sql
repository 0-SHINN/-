-- 가입일자 별 코호트 & 리텐션
WITH first_join AS(
  SELECT c.first_join_date,
         c.customer_id
  FROM `customers` AS c
  LEFT JOIN `transaction` AS t ON c.customer_id = t.customer_id
  GROUP BY c.customer_id, first_join_date
  ORDER BY c.customer_id
 ),
 cohort AS(
  SELECT t.customer_id,
         first_join_date,
         DATE_DIFF(DATE(created_at), first_join_date, MONTH) AS month_diff,
         DATE_TRUNC(first_join_date, MONTH) AS first_join_month
  FROM `transaction` AS t
  LEFT JOIN first_join AS f ON t.customer_id = f.customer_id
 )
SELECT first_join_month,
       month_diff,
       COUNT(DISTINCT customer_id) / FIRST_VALUE(COUNT(DISTINCT(customer_id))) 
       OVER (PARTITION BY first_join_month ORDER BY month_diff 
       ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) * 100 AS retention
FROM cohort
GROUP BY first_join_month, month_diff
ORDER BY first_join_month, month_diff
