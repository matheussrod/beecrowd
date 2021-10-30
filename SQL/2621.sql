  SELECT pdt.name
    FROM products AS pdt
	     INNER JOIN providers AS pvd
		 ON pdt.id_providers = pvd.id
		    AND starts_with(pvd.name, 'P')
   WHERE pdt.amount BETWEEN 10 AND 20