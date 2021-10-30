    WITH doc_salary AS
 (SELECT doc.name,
		 (150 * hours) + (150 * hours) * bonus/100  AS "salary"
    FROM doctors AS doc
         INNER JOIN attendances AS att
		 ON doc.id = att.id_doctor
		 
		 INNER JOIN work_shifts AS ws
		 ON att.id_work_shift = ws.id)
  SELECT ds.name,
         ROUND(SUM(ds.salary), 1) AS "salary"
    FROM doc_salary AS ds
GROUP BY ds.name
ORDER BY salary DESC