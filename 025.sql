SELECT
  shipcountry,
  avg(freight) as mean_freight
FROM
  orders
GROUP BY
  shipcountry
ORDER BY
  mean_freight DESC
LIMIT
  3