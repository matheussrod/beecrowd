    WITH most_frequent AS 
 (SELECT amount AS "most_frequent_value",
         COUNT(*)
    FROM value_table
GROUP BY amount
ORDER BY count DESC
   LIMIT 1)
  SELECT most_frequent_value
    FROM most_frequent