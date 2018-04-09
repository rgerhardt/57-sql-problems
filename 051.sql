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
    cgt.groupname as group
  FROM
    orders_1998 o
  INNER JOIN
    customergroupthreshold cgt ON o.total between cgt.rangebottom AND cgt.rangetop
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