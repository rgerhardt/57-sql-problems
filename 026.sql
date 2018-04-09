SELECT
  shipcountry,
  avg(freight) as mean_freight
FROM
  orders
WHERE
  date_part('year', orderdate) = 1997
GROUP BY
  shipcountry
ORDER BY
  mean_freight DESC
LIMIT
  3