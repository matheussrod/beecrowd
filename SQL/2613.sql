  SELECT mov.id,
         mov.name
    FROM movies AS mov
	     INNER JOIN prices AS pr
		 ON mov.id_prices = pr.id
		    AND pr.value < 2