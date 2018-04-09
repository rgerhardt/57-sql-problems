SELECT
  orderid,
  customerid,
  shipcountry
FROM
  orders
WHERE
  shipcountry = 'France'
  OR shipcountry = 'Belgium'