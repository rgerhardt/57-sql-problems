SELECT
  country,
  city,
  count(city) AS totalcustomer
FROM
  customers
GROUP BY
  country, city
ORDER BY
  totalcustomer DESC