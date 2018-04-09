SELECT
  c.customerid,
  c.companyname
FROM
  customers c
LEFT JOIN
  orders o on c.customerid = o.customerid
WHERE
  o.orderid is null