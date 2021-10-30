  SELECT pdt.name,
         pvd.name,
		 pdt.price
    FROM products AS pdt
	     INNER JOIN providers AS pvd
		 ON pdt.id_providers = pvd.id
		 
		 INNER JOIN categories AS cat
		 ON pdt.id_categories = cat.id
		    AND cat.name = 'Super Luxury'
   WHERE pdt.price > 1000