SELECT
  employeeid,
  orderid,
  orderdate
FROM
  orders
WHERE
  orderdate = ((date_trunc('MONTH', orderdate) + INTERVAL '1 MONTH - 1 day')::date)
ORDER BY
  employeeid, orderdate




