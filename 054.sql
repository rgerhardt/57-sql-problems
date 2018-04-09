with countries AS (
  SELECT country FROM suppliers
  UNION
  SELECT country FROM customers
)
SELECT
  c.country,
  coalesce(count(sp.country),0) as totalsupliers,
  coalesce(count(cp.country),0) as totalcustomers
FROM
  countries c
LEFT JOIN
  suppliers sp ON c.country = sp.country
LEFT JOIN
  customers cp ON c.country = cp.country
GROUP BY
  c.country