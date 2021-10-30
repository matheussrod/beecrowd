  SELECT pp.name,
         ROUND(pp.salary * 0.10, 2) AS "tax"
    FROM people AS pp
   WHERE pp.salary > 3000