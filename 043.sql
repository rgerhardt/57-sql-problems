with late_orders AS (
  SELECT
    o.employeeid,
    count(o.employeeid) as total
  FROM
    orders o
  WHERE
    o.requireddate <= o.shippeddate
  GROUP BY
    o.employeeid
), orders_summary AS (
   SELECT
    o.employeeid,
    count(o.employeeid) as total
  FROM
    orders o
  GROUP BY
    o.employeeid
)
SELECT
  os.employeeid,
  e.lastname,
  os.total,
  lo.total as late_orders
FROM
  orders_summary os
INNER JOIN
  employees e on os.employeeid = e.employeeid
INNER JOIN
  late_orders lo on os.employeeid = lo.employeeid
ORDER BY
  os.total DESC
