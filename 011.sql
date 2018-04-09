SELECT
  firstname,
  lastname,
  title,
  birthdate::date
FROM
  employees
ORDER BY
  birthdate