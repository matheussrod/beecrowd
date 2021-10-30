    WITH salario AS 
 (SELECT epd.nome,
         epd.lotacao_div,
		 CASE WHEN SUM(venc.valor) IS NULL THEN 0 ELSE SUM(venc.valor) END AS "valor"
    FROM empregado AS epd
	     LEFT JOIN emp_venc AS ev
		 ON epd.matr = ev.matr
		 
         LEFT JOIN vencimento AS venc
 		 ON ev.cod_venc = venc.cod_venc
GROUP BY epd.nome, epd.lotacao_div
   UNION ALL
  SELECT epd.nome,
         epd.lotacao_div,
		 - SUM(dct.valor) AS "valor"
    FROM empregado AS epd 
	     INNER JOIN emp_desc AS ed 
		 ON epd.matr = ed.matr
		 
		 INNER JOIN desconto AS dct
		 ON ed.cod_desc = dct.cod_desc
GROUP BY epd.nome, epd.lotacao_div),

         salario_desconto AS 
 (SELECT sal.nome, 
         sal.lotacao_div,
         SUM(sal.valor) AS "valor"
    FROM salario AS sal
GROUP BY sal.nome, sal.lotacao_div),

         salario_avg AS
 (SELECT div.cod_divisao,
		 ROUND(AVG(sd.valor), 2) AS "media"
    FROM salario_desconto AS sd
	     INNER JOIN divisao AS div
		 ON sd.lotacao_div = div.cod_divisao
		 
		 INNER JOIN departamento AS dep
		 ON div.cod_dep = dep.cod_dep
GROUP BY div.cod_divisao)

  SELECT sd.nome, 
         sd.valor
    FROM salario_avg AS sa
	     INNER JOIN salario_desconto AS sd
		 ON sa.cod_divisao = sd.lotacao_div
		    AND sd.valor > sa.media
			AND sd.valor > 8000
ORDER BY sa.cod_divisao, valor DESC