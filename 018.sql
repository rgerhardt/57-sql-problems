SELECT
  p.productid,
  p.productname,
  s.companyname
FROM
  products p
INNER JOIN suppliers s ON p.supplierid = s.supplierid
