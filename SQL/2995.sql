  SELECT MAX(rec.temperature) AS "temperature",
         COUNT(rec.id)
    FROM records AS rec
GROUP BY rec.mark
ORDER BY rec.mark