SELECT
  firstname,
  lastname,
  firstname || ' ' || lastname as fullname
FROM
  employees
ORDER BY
  birthdate