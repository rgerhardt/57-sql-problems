WITH customer_orders AS (
  SELECT
    customerid,
    orderid as initial_order_id,
    orderdate as initial_order_date,
    LEAD (o.orderdate, 1) OVER ( PARTITION BY customerid ORDER BY orderdate) AS next_order_date
  FROM
    orders o
  ORDER BY
    o.customerid, o.orderdate
)
SELECT
  *,
  (co.next_order_date - co.initial_order_date) as daysbetween
FROM
  customer_orders co
WHERE
  (co.next_order_date - co.initial_order_date) <= 5