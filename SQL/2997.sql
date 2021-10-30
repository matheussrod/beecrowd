    WITH salario AS 
 (SELECT epd.nome,
         epd.lotacao_div,
		 CASE WHEN SUM(venc.valor) IS NULL THEN 0
              ELSE COALESCE(SUM(venc.valor), 0) END AS "valor"
    FROM empregado AS epd
	     LEFT JOIN emp_venc AS ev
		 ON epd.matr = ev.matr
		 
         LEFT JOIN vencimento AS venc
 		 ON ev.cod_venc = venc.cod_venc
GROUP BY epd.nome, epd.lotacao_div),

         salario_desconto AS
 (SELECT epd.nome,
		 ROUND(SUM(dct.valor), 2) AS "valor"
    FROM empregado AS epd 
	     INNER JOIN emp_desc AS ed 
		 ON epd.matr = ed.matr
		 
		 INNER JOIN desconto AS dct
		 ON ed.cod_desc = dct.cod_desc
GROUP BY epd.nome),

         salario_join AS 
 (SELECT sal.nome,
         sal.lotacao_div,
         CASE WHEN sal.valor = 0 THEN 0 ELSE ROUND(sal.valor, 2) END AS "valor",
         CASE WHEN sd.valor IS NULL THEN 0
              ELSE ROUND(sd.valor, 2) END AS "tot_desconto",
         sal.valor - COALESCE(sd.valor, 0) AS "sal_liquido"
    FROM salario AS sal
         LEFT JOIN salario_desconto AS sd
         ON sal.nome = sd.nome) --SELECT * FROM salario_join
		 
  SELECT dep.nome AS "Departamento",
         sj.nome AS "Empregado",
		 sj.valor AS "Salario Bruto",
		 COALESCE(sj.tot_desconto, 0) AS "Total Desconto",
		 sj.sal_liquido AS "Salario Liquidoaws"
    FROM salario_join AS sj
	     INNER JOIN divisao AS div
		 ON sj.lotacao_div = div.cod_divisao
		 
		 INNER JOIN departamento AS dep
		 ON div.cod_dep = dep.cod_dep
ORDER BY sj.sal_liquido DESC, sj.nome DESC;