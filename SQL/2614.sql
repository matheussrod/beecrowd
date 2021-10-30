  SELECT ctm.name,
         rtl.rentals_date
    FROM rentals AS rtl
	     INNER JOIN customers AS ctm
		 ON rtl.id_customers = ctm.id
   WHERE rtl.rentals_date BETWEEN '2016-09-01' AND '2016-09-30'