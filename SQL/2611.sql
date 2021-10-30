  SELECT mov.id,
         mov.name
    FROM movies AS mov
	     INNER JOIN genres AS gen
		 ON mov.id_genres = gen.id
		    AND gen.description = 'Action'