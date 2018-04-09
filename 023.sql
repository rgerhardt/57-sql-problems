SELECT
  productid,
  productname,
  unitsinstock,
  unitsonorder,
  reorderlevel
FROM
  products
WHERE
  (unitsinstock + unitsonorder) <= reorderlevel
  AND discontinued = 0
ORDER BY
  productid