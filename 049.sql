with orders_1998 AS (
  SELECT
    o.customerid,
    coalesce(sum(od.unitprice * od.quantity),0) as total
  FROM
    orders o
  INNER JOIN
    order_details od on o.orderid = od.orderid
  WHERE
    EXTRACT(YEAR FROM o.orderdate) = 1998
  GROUP BY
    o.customerid
)
SELECT
  c.customerid,
  c.companyname,
  o.total,
  CASE
    WHEN o.total < 1000 THEN 'Low'
    WHEN o.total BETWEEN 1000 AND 5000 THEN 'Medium'
    WHEN o.total BETWEEN 5000 AND 10000 THEN 'High'
    WHEN o.total >= 10000 THEN 'Very High'
  END as group
FROM
  customers c
INNER JOIN
  orders_1998 o on c.customerid = o.customerid
ORDER BY
  c.customerid