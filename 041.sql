SELECT
  orderid,
  orderdate,
  requireddate,
  shippeddate
FROM
  orders
WHERE
  requireddate <= shippeddate