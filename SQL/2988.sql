    WITH matches_all AS
 (SELECT tm.name, 
		 CASE WHEN mt1.team_1_goals > mt1.team_2_goals THEN 1 ELSE 0 END AS "victories",
		 CASE WHEN mt1.team_1_goals < mt1.team_2_goals THEN 1 ELSE 0 END AS "defeats",
		 CASE WHEN mt1.team_1_goals = mt1.team_2_goals THEN 1 ELSE 0 END AS "draws"
    FROM teams AS tm
	     INNER JOIN matches AS mt1
		 ON tm.id = mt1.team_1
   UNION ALL
  SELECT tm.name,
		 CASE WHEN mt2.team_2_goals > mt2.team_1_goals THEN 1 ELSE 0 END AS "victories",
		 CASE WHEN mt2.team_2_goals < mt2.team_1_goals THEN 1 ELSE 0 END AS "defeats",
		 CASE WHEN mt2.team_2_goals = mt2.team_1_goals THEN 1 ELSE 0 END AS "draws"
    FROM teams AS tm
	     INNER JOIN matches AS mt2
		 ON tm.id = mt2.team_2)
  SELECT mta.name,
         COUNT(mta.name) AS "matches",
		 SUM(mta.victories) AS "victories",
		 SUM(mta.defeats) AS "defeats",
		 SUM(mta.draws) AS "draws",
		 (SUM(mta.victories) * 3 + SUM(mta.draws)) AS "score"
    FROM matches_all AS mta
GROUP BY mta.name
ORDER BY score DESC	
