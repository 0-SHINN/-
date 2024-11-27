-- 월별 매출
SELECT DATE_TRUNC(DATE(created_at), MONTH) AS month,
			 SUM(item_price * quantity) AS revenue,
FROM `transaction`
GROUP BY month
ORDER BY month
