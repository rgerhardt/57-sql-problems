with ranked_orders AS (
  SELECT
    shipcountry,
    customerid,
    orderid,
    orderdate,
    rank() OVER (PARTITION BY shipcountry ORDER BY orderdate) as ranking
  FROM
    orders
)
SELECT
  shipcountry,
  customerid,
  orderid,
  orderdate
FROM
  ranked_orders
WHERE
  ranking = 1
ORDER BY
  shipcountry