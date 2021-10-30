  SELECT lr.name,
         ROUND(lr.omega * 1.618, 3) AS "The N Factor"
    FROM life_registry AS lr
	     INNER JOIN dimensions AS dms
		 ON lr.dimensions_id = dms.id
		    AND dms.name IN ('C875', 'C774')
   WHERE starts_with(lr.name, 'Richard')
ORDER BY lr.omega