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
), customer_groups AS (
  SELECT
    CASE
      WHEN o.total < 1000 THEN 'Low'
      WHEN o.total BETWEEN 1000 AND 5000 THEN 'Medium'
      WHEN o.total BETWEEN 5000 AND 10000 THEN 'High'
      WHEN o.total >= 10000 THEN 'Very High'
    END as group
  FROM
    orders_1998 o
), groups_count AS (
  SELECT
    cg.group,
    count(cg.group) as group_total
  FROM
    customer_groups cg
  GROUP BY
    cg.group
)
SELECT
  gc.group,
  gc.group_total,
  (100*gc.group_total/(SELECT sum(group_total) FROM groups_count)) as percentage
FROM
  groups_count gc
ORDER BY
  gc.group_total DESC