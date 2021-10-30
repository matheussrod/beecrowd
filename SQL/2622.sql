  SELECT ctm.name
    FROM customers AS ctm
	     INNER JOIN legal_person AS lp
		 ON ctm.id = lp.id_customers