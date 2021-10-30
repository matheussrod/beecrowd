    WITH salario ("matr", "lotacao_div", "valor") AS 
 (SELECT epd.matr,
         epd.lotacao_div,
		 CASE WHEN SUM(venc.valor) IS NULL THEN 0 ELSE SUM(venc.valor) END AS "valor"
    FROM empregado AS epd
	     LEFT JOIN emp_venc AS ev
		 ON epd.matr = ev.matr
		 
         LEFT JOIN vencimento AS venc
 		 ON ev.cod_venc = venc.cod_venc
GROUP BY epd.matr, epd.lotacao_div
   UNION ALL
  SELECT epd.matr,
         epd.lotacao_div,
		 - SUM(dct.valor) AS "valor"
    FROM empregado AS epd 
	     INNER JOIN emp_desc AS ed 
		 ON epd.matr = ed.matr
		 
         INNER JOIN desconto AS dct
		 ON ed.cod_desc = dct.cod_desc
GROUP BY epd.matr, epd.lotacao_div),

         salario_desconto ("matr", "lotacao_div", "valor") AS 
 (SELECT sal.matr, 
         sal.lotacao_div,
         SUM(sal.valor)
    FROM salario AS sal
GROUP BY sal.matr, sal.lotacao_div),

         salario_divisao AS 
 (SELECT div.cod_dep,
         div.nome AS "divisao",
         ROUND(AVG(sd.valor), 2) AS "media"
    FROM salario_desconto AS sd
         INNER JOIN divisao AS div
         ON sd.lotacao_div = div.cod_divisao
GROUP BY div.cod_dep, div.nome),

         salario_max_dep AS 
 (SELECT sd.cod_dep,
         MAX(sd.media) AS "media"
    FROM salario_divisao AS sd
GROUP BY sd.cod_dep)  
  SELECT dep.nome AS "departamento",
         sd.divisao,
		 sd.media
    FROM salario_max_dep AS smd
	     INNER JOIN salario_divisao AS sd
		 ON smd.cod_dep = sd.cod_dep
		    AND smd.media = sd.media
			
		 INNER JOIN departamento AS dep
		 ON smd.cod_dep = dep.cod_dep
ORDER BY smd.media DESC