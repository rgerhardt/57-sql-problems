SELECT
  o.employeeid,
  e.lastname,
  o.orderid,
  p.productname,
  od.quantity
FROM
  orders o
INNER JOIN
  employees e on o.employeeid = e.employeeid
INNER JOIN
  order_details od on o.orderid = od.orderid
INNER JOIN
  products p on od.productid = p.productid
ORDER BY
  o.orderid, od.productid