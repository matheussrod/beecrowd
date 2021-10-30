  SELECT pdt.name,
         pvd.name,
		 cat.name
    FROM products AS pdt
	     INNER JOIN providers AS pvd
		 ON pdt.id_providers = pvd.id
		    AND pvd.name = 'Sansul SA'
		 
		 INNER JOIN categories AS cat
		 ON pdt.id_categories = cat.id
		    AND cat.name = 'Imported'