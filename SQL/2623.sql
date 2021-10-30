  SELECT pdt.name,
         cat.name
    FROM products AS pdt
	     INNER JOIN categories AS cat
		 ON pdt.id_categories = cat.id
		    AND cat.id IN (1, 2, 3, 6, 9)
   WHERE pdt.amount > 100
ORDER BY cat.id