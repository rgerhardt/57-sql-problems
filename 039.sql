with repeated_quantities AS (
    SELECT
      od.orderid
    FROM
      order_details od
      INNER JOIN
      orders o on od.orderid = o.orderid
    WHERE
      od.quantity >= 60
    GROUP BY
      od.orderid, od.quantity
    HAVING
      count(od.quantity) > 1
    ORDER BY
      od.orderid
)
SELECT
  od.orderid,
  od.productid,
  od.unitprice,
  od.quantity,
  od.discount
FROM
  order_details od
WHERE
  od.orderid in (SELECT orderid FROM repeated_quantities)