with countries AS (
  SELECT
    country
  FROM
    suppliers
  UNION
  SELECT
    country
  FROM
    customers
), suppliercountry AS (
  SELECT
    distinct country
  FROM
    suppliers
), customercountry AS (
  SELECT
    distinct country
  FROM
    customers
)
SELECT
  sp.country as suplier_country,
  cp.country as customer_country
FROM
  countries c
LEFT JOIN
  suppliercountry sp on c.country = sp.country
LEFT JOIN
  customercountry cp on c.country = cp.country
