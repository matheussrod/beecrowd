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
GROUP BY sal.matr, sal.lotacao_div)
  SELECT dep.nome AS "departamento",
         div.nome AS "divisao",
		     ROUND(AVG(sd.valor), 2) AS "media",
		     ROUND(MAX(sd.valor), 2) AS "maior"
    FROM salario_desconto AS sd
	       INNER JOIN divisao AS div
		     ON sd.lotacao_div = div.cod_divisao
		 
		     INNER JOIN departamento AS dep
		     ON div.cod_dep = dep.cod_dep
GROUP BY dep.nome, div.nome
ORDER BY media DESC