SELECT
  initial_order.customerid,
  initial_order.orderid as initial_order_id,
  initial_order.orderdate as initial_order_date,
  next_order.orderid as nextorderid,
  next_order.orderdate as nextorderdate,
  (next_order.orderdate - initial_order.orderdate) as daysbetween
FROM
  orders initial_order
INNER JOIN
  orders next_order on initial_order.customerid = next_order.customerid
WHERE
  initial_order.orderid < next_order.orderid
  AND (next_order.orderdate - initial_order.orderdate) <= 5
