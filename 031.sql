SELECT
  c.customerid,
  c.companyname
FROM
  customers c
LEFT JOIN
  orders o on c.customerid = o.customerid and o.employeeid = 4
WHERE
  o.orderid is null