 (SELECT CONCAT('Podium: ', lg.team) AS "name"
    FROM league AS lg
ORDER BY lg.position
   LIMIT 3)
   UNION ALL   
 (SELECT CONCAT('Demoted: ', lg.team) AS "name"
    FROM league AS lg
   WHERE lg.position >= (SELECT MAX(position) - 1 FROM league)
ORDER BY lg.position)