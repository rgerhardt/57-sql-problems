SELECT
  c.customerid,
  c.companyname,
  c.region
FROM
  customers c
ORDER BY
  c.region, c.customerid