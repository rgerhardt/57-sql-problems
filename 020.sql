SELECT
  c.categoryname,
  count(p.productid) as nb_products
FROM
  categories c
INNER JOIN
  products p on c.categoryid = p.categoryid
GROUP BY
  c.categoryname
ORDER BY
  nb_products DESC
