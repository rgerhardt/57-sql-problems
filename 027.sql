SELECT
  shipcountry,
  avg(freight) as mean_freight
FROM
  orders
WHERE
  orderdate between '1997-01-01' and '1998-01-01'
GROUP BY
  shipcountry
ORDER BY
  mean_freight DESC
LIMIT
  3