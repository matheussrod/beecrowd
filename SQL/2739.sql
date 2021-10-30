  SELECT la.name,
         CAST(EXTRACT(DAY FROM la.payday) AS INT) AS "day"
    FROM loan AS la