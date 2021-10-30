  SELECT pack.year,
         us1.name AS "sender",
		 us2.name AS "receiver"
    FROM packages AS pack
	     INNER JOIN users AS us1
		 ON pack.id_user_sender = us1.id
		    AND us1.address != 'Taiwan'
		 
		 INNER JOIN users AS us2
		 ON pack.id_user_receiver = us2.id
		    AND us2.address != 'Taiwan'
   WHERE pack.color = 'blue' OR pack.year = 2015
ORDER BY pack.year DESC