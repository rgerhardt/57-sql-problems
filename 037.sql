SELECT
  orderid
FROM
  orders
TABLESAMPLE bernoulli(
  2
)