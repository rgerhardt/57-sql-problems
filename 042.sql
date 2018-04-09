SELECT
  o.employeeid,
  e.lastname,
  count(o.employeeid) as total_late_orders
FROM
  orders o
INNER JOIN
  employees e on o.employeeid = e.employeeid
WHERE
  o.requireddate <= o.shippeddate
GROUP BY
  o.employeeid, e.lastname
ORDER BY
  total_late_orders DESC
