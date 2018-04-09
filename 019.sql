SELECT
  o.orderid,
  o.orderdate,
  s.companyname
FROM
  orders o
INNER JOIN shippers s on o.shipvia = s.shipperid
