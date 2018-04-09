SELECT
  od.orderid,
  od.productid,
  od.unitprice,
  od.quantity,
  od.discount
FROM
  order_details od
INNER JOIN (
  SELECT
    distinct orderid
  FROM
    order_details
  WHERE
    quantity >= 60
  GROUP BY
    orderid, quantity
  HAVING
    count(*) > 1
  ) potential_problem on potential_problem.orderid = od.orderid
ORDER BY
  od.orderid, od.productid