SELECT
  od.orderid
FROM
  order_details od
INNER JOIN
  orders o on od.orderid = o.orderid
WHERE
  od.quantity >= 60
GROUP BY
  od.orderid, od.quantity
HAVING
  count(od.quantity) > 1
ORDER BY
  od.orderid