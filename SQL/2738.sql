  SELECT cdd.name,
         ROUND((scr.math * 2 + scr.specific * 3 + scr.project_plan * 5)/10, 2) AS "avg"
    FROM candidate AS cdd
	     INNER JOIN score AS scr
		 ON cdd.id = scr.candidate_id
   ORDER BY avg DESC