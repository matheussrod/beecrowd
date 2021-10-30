 (SELECT law.name,
         law.customers_number
    FROM lawyers AS law
   WHERE law.customers_number = (SELECT MAX(customers_number) FROM lawyers)
      OR law.customers_number = (SELECT MIN(customers_number) FROM lawyers)
ORDER BY law.customers_number DESC)
   UNION ALL
  SELECT 'Average' AS "name",
         CAST(AVG(law_avg.customers_number) AS INTEGER) AS "customers_number"
    FROM lawyers AS law_avg