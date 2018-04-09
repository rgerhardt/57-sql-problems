SELECT
  orderid,
  customerid,
  shipcountry
FROM
  orders
WHERE
  shipcountry in ('Brazil', 'Mexico', 'Argentina', 'Venezuela')