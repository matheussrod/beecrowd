    WITH investment AS 
 (SELECT cli.name,
         op.month,
		 SUM(op.profit) OVER(PARTITION BY op.client_id ORDER BY op.month) AS "profit",
		 cli.investment
    FROM operations AS op
	     INNER JOIN clients AS cli
		 ON op.client_id = cli.id)
  SELECT inv.name,
         MIN(inv.investment) AS "investment",
         MIN(inv.month) AS "month_of_payback",
		 MIN(inv.profit) - MIN(inv.investment) AS "return"
    FROM investment AS inv
   WHERE inv.investment <= inv.profit
GROUP BY inv.name
ORDER BY return DESC