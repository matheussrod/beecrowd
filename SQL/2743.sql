  SELECT pp.name,
         CHAR_LENGTH(pp.name) AS "length"
    FROM people AS pp
ORDER BY length DESC