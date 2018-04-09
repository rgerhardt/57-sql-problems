SELECT
  supplierid,
  contactname,
  contacttitle
FROM
  suppliers
WHERE
  contacttitle != 'Marketing Manager';
