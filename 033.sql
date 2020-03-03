SELECT
  c.customerid,
  c.companyname,
  round(sum(od.unitprice * od.quantity)::numeric, 2) as total_amount
FROM
  customers c
INNER JOIN
  orders o on c.customerid = o.customerid
INNER JOIN
  order_details od on o.orderid = od.orderid
WHERE
  date_part('year', o.orderdate) = 2016
GROUP BY
  c.customerid, c.companyname
HAVING
  sum(od.unitprice * od.quantity) >= 15000
ORDER BY
  total_amount DESC
