  SELECT emp.cpf,
         emp.enome,
		 dep.dnome
    FROM empregados AS emp
	     LEFT JOIN trabalha AS trab
		 ON emp.cpf = trab.cpf_emp
		 
		 LEFT JOIN departamentos AS dep
		 ON emp.dnumero = dep.dnumero
   WHERE trab.cpf_emp IS NULL
ORDER BY emp.cpf