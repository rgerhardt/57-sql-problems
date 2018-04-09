with late_orders AS (
  SELECT
    employeeid,
    count(employeeid) as total
  FROM
    orders
  WHERE
    requireddate <= shippeddate
  GROUP BY
    employeeid
), orders_summary AS (
   SELECT
    employeeid,
    count(employeeid) as total
  FROM
    orders
  GROUP BY
    employeeid
)
SELECT
  os.employeeid,
  e.lastname,
  os.total,
  coalesce(lo.total,0) as late_orders,
  coalesce((lo.total::decimal/os.total), 0) as percentage
FROM
  orders_summary os
INNER JOIN
  employees e on os.employeeid = e.employeeid
LEFT JOIN
  late_orders lo on os.employeeid = lo.employeeid
ORDER BY
  percentage DESC