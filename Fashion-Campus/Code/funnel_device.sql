SELECT DATE_TRUNC(DATE(event_time), MONTH) AS month,
       traffic_source,
       COUNT(CASE WHEN event_name = 'HOMEPAGE' THEN session_id END) AS homepage_count,
       COUNT(CASE WHEN event_name = 'ITEM_DETAIL' THEN session_id END) AS pageview_count,
       COUNT(CASE WHEN event_name = 'ADD_TO_CART' THEN session_id END) AS addtocart_count,
       COUNT(CASE WHEN event_name = 'BOOKING' THEN session_id END) AS purchase_count
  FROM `click_stream`
  GROUP BY month, traffic_source
