  SELECT cat.name,
         SUM(pdt.amount) AS "sum"
    FROM products AS pdt
	     INNER JOIN categories AS cat
		 ON pdt.id_categories = cat.id
GROUP BY cat.name