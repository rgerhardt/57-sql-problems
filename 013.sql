SELECT
  orderid,
  productid,
  unitprice,
  quantity, (unitprice * quantity) as totalprice
FROM
  order_details
ORDER BY
  orderid, productid
