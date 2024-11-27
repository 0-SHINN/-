-- 월간 활성 유저 (구매를 활성으로 정의)
SELECT DATE_TRUNC(created_at, MONTH) AS month,
       COUNT(DISTINCT customer_id) AS active_users
FROM `transaction`
GROUP BY month
ORDER BY month
