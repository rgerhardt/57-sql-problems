SELECT
  orderid,
  count(orderid) as total_items
FROM
  order_details
GROUP BY
  orderid
ORDER BY
  total_items DESC
LIMIT
  10