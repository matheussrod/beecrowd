  SELECT prod.name AS "type",
         CASE WHEN prod.type = 'A' THEN 20.0
		      WHEN prod.type = 'B' THEN 70.0
			  WHEN prod.type = 'C' THEN 530.5
			   END AS "price"
    FROM products AS prod
ORDER BY prod.type, prod.id DESC