-- 신규 가입 유저
SELECT DATE_TRUNC(first_join_date, MONTH) AS month,
       COUNT(customer_id) AS join_users
FROM `customers`
GROUP BY month
ORDER BY month
