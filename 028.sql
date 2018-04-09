SELECT
  shipcountry,
  avg(freight) as mean_freight
FROM
  orders
WHERE
  orderdate >= (select max(orderdate) - interval '12 month' from orders)
GROUP BY
  shipcountry
ORDER BY
  mean_freight DESC
LIMIT
  3