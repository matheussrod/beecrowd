  SELECT ctm.name,
         odr.id
    FROM customers AS ctm
	     INNER JOIN orders AS odr
		 ON ctm.id = odr.id_customers
            AND odr.orders_date BETWEEN '2016-01-01' AND '2016-06-30'