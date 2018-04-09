SELECT
  contacttitle,
  count(contacttitle) as total
FROM
  customers
GROUP BY
  contacttitle
ORDER BY
  total DESC